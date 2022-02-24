import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dots_decorator.dart';
import 'image_network.dart';
typedef ClickItemFunction<T> = void Function(T data);
typedef ItemWidgetFunction<T> = Widget Function(T data);
class CustomPageView<T> extends StatefulWidget {
  List<T>? images;
  bool? isAutoSlide = false;
  double? height = 0.0;
  double? width = 0.0;
  ClickItemFunction? clickItemAction;
  ItemWidgetFunction? itemWidget;
  CustomPageView({this.images, this.isAutoSlide, this.width, this.height,this.clickItemAction,this.itemWidget});

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView>
    with SingleTickerProviderStateMixin {
  PageController _pageController = PageController();
  double currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    if (widget.isAutoSlide ?? false) _animateSlider();

    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!;
      });
    });
  }

  void _animateSlider() {
    _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      int nextPage = _pageController.page!.round() + 1;

      if (nextPage == widget.images!.length) {
        nextPage = 0;
      }

      _pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = widget.width;
    final height = widget.height;
    final isAutoSlide = widget.isAutoSlide!;
    return Container(
        width: width == 0.0 ? null : width,
        height: height == 0.0 ? null : height,
        child:Stack(
          children: [
            GestureDetector(
              child: PageView.builder(
                itemCount: widget.images!.length,
                controller: _pageController,
                itemBuilder: (context, index) {
                  return InkWell(onTap: (){
                    widget.clickItemAction!(widget.images![index]);
                  },child: widget.itemWidget!(widget.images![index]));

                },
              ),
              onPanDown: (details) {
                if(isAutoSlide)_timer!.cancel();
              },
              onPanEnd: (details) {
                if (isAutoSlide && !_timer!.isActive) {
                  _animateSlider();
                }
              },
              onPanCancel: () {
                if (isAutoSlide && !_timer!.isActive) {
                  _animateSlider();
                }
              },
            ),
            Align(
              child: CustomDotsDecorator(
                  size: widget.images!.length, currentPage: currentPage),
              alignment: Alignment.bottomCenter,
            )
          ],
        ))
    ;
  }
}
