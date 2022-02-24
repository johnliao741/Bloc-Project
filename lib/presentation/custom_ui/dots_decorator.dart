import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';


class CustomDotsDecorator extends StatelessWidget {
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final Color? unActiveColor;
  final Color? activeColor;
  final double? currentPage;
  final int? size;
  const CustomDotsDecorator({
    Key? key,
    this.borderRadius,
    this.borderColor,
    this.unActiveColor,
    this.activeColor,
    this.currentPage,
    this.size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedDotsDecorator(
        borderRadius: borderRadius,
        borderColor: borderColor,
        unActiveColor: unActiveColor,
        activeColor: activeColor,
        currentPage: currentPage,
        size : size
    );
  }
}

class RoundedDotsDecorator extends StatelessWidget {
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final Color? unActiveColor;
  final Color? activeColor;
  final double? currentPage;
  final int? size;
  const RoundedDotsDecorator({
    Key? key,
    this.borderRadius,
    this.borderColor,
    this.unActiveColor,
    this.activeColor,
    this.currentPage,
    this.size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
        decorator: DotsDecorator(
            shape: CircleBorder(
              side: BorderSide(width: 1, color: borderColor ?? Colors.grey),
            ),
            color: unActiveColor ?? Colors.white,
            activeColor: activeColor ?? Colors.blue),
        dotsCount: size!,
        position: currentPage!);
  }
}
