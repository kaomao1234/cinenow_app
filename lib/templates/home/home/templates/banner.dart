import 'dart:developer';

import 'package:cinenow_app/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

class HomeBanner extends StatefulWidget {
  String title, subTitle, imgSrc;
  double? defaultHeight; // Optional default height for the banner

  HomeBanner({
    required this.title,
    required this.subTitle,
    required this.imgSrc,
    this.defaultHeight,
    super.key,
  });

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  late AdaptiveSize _adaptiveSize;
  double height = 0;
  final imageKey = GlobalKey();

  @override
  void initState() {
    _adaptiveSize = AdaptiveSize(context);
    super.initState();
    // Call _getSize here to ensure initial layout
  }

  void _getSize() async {
    // Ensure image has loaded before calculating size
    await SchedulerBinding.instance!.endOfFrame;

    final renderBox = imageKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    setState(() {
      height = size.height;
    });
    log("Image size: width = ${size.width}, height = ${size.height}");
  }

  @override
  Widget build(BuildContext context) {
    return wrapperMain(260);
  }

  Widget wrapperMain(double? height) {
    return SizedBox(
      width: _adaptiveSize.getWidthPercent(100),
      height: height,
      child: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 1, left: 1, right: 1),
              child: Image.asset(
                widget.imgSrc,
                key: imageKey,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    widget.subTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
