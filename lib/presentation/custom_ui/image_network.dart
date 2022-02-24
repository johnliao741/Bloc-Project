import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';


class CustomImageNetwork extends StatelessWidget {
  final String? url;
  final Color? indicatorColor;
  final String? loadImagePath;
  final String? errorImagePath;
  final bool? showLoadingIndicator;
  final double? width;
  final double? height;
  final VoidCallback? loadedCallback;

  const CustomImageNetwork(
      {Key? key,
        this.url,
        this.indicatorColor,
        this.loadImagePath,
        this.errorImagePath,
        this.showLoadingIndicator = true,
        this.width,
        this.height,
        this.loadedCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CostomImage(
        url: url,
        indicatorColor: indicatorColor,
        showLoadingIndicator: showLoadingIndicator,
        loadImagePath: loadImagePath,
        errorImagePath: errorImagePath,
        width: width,
        height: height,
        loadedCallback: loadedCallback);
  }
}

class CostomImage extends StatefulWidget {
  final String? url;
  final Color? indicatorColor;
  final bool? showLoadingIndicator;
  final String? loadImagePath;
  final String? errorImagePath;
  final double? width;
  final double? height;
  final VoidCallback? loadedCallback;

  const CostomImage(
      {Key? key,
        this.url,
        this.indicatorColor,
        this.showLoadingIndicator,
        this.loadImagePath,
        this.errorImagePath,
        this.width,
        this.height,
        this.loadedCallback})
      : super(key: key);

  @override
  State<CostomImage> createState() => _CostomImageViewState();
}

class _CostomImageViewState extends State<CostomImage> {
  String? url;
  Color? indicatorColor;
  bool? showLoadingIndicator;
  String? loadImagePath;
  String? errorImagePath;
  double? width;
  double? height;
  bool isLoading = true;
  VoidCallback? loadedCallback;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url!,
      width: width,
      height: height,
    );
  }

  void initData() {
    url = widget.url;
    indicatorColor = widget.indicatorColor;
    showLoadingIndicator = widget.showLoadingIndicator;
    loadImagePath = widget.loadImagePath;
    errorImagePath = widget.errorImagePath;
    width = widget.width;
    height = widget.height;
    loadedCallback = widget.loadedCallback;
  }
}
