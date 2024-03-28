import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveSize {
  late BuildContext context;
  late Map<String, double> breakpoints;

  AdaptiveSize(this.context) {
    breakpoints = {
      'sm': 640,
      'md': 768,
      'lg': 1024,
      'xl': 1280,
      '2xl': 1536,
    };
  }
  get deviceWidth => MediaQuery.of(context).size.width;
  get deviceHeight => MediaQuery.of(context).size.height;

  double getWidthPercent(double percent) {
    return MediaQuery.of(context).size.width * percent / 100;
  }

  double getHeightPercent(double percent) {
    return MediaQuery.of(context).size.height * percent / 100;
  }

  // // **New functions for device height checks:**
  // double upHeight(String key, double val, double keyVal) {
  //   return breakpoints[key]! > deviceHeight ? keyVal : val;
  // }

  // double downHeight(String key, double val, double keyVal) {
  //   return breakpoints[key]! < deviceHeight ? keyVal : val;
  // }

  // double onlyHeight(String key, double val, double keyVal) {
  //   return breakpoints[key]! == deviceHeight ? keyVal : val;
  // }

  // double notHeight(String key, double val, double keyVal) {
  //   return breakpoints[key]! != deviceHeight ? keyVal : val;
  // }

  // double betweenHeight(String key1, String key2, double val, double keyVal) {
  //   if (!breakpoints.containsKey(key1) || !breakpoints.containsKey(key2)) {
  //     // Handle missing breakpoints (e.g., return a default value or throw an exception)
  //     return keyVal; // Example: return keyVal if a breakpoint is missing
  //   }
  //   return deviceHeight > breakpoints[key1]! &&
  //           deviceHeight < breakpoints[key2]!
  //       ? keyVal
  //       : val;
  // }

  double upWidth(String key, double val, double keyVal) {
    return breakpoints[key]! > deviceWidth ? keyVal : val;
  }

  double downWidth(String key, double val, double keyVal) {
    return breakpoints[key]! < deviceWidth ? keyVal : val;
  }

  double onlyWidth(String key, double val, double keyVal) {
    return breakpoints[key]! == deviceWidth ? keyVal : val;
  }

  double notWidth(String key, double val, double keyVal) {
    return breakpoints[key]! != deviceWidth ? keyVal : val;
  }

  double betweenWidth(String key1, String key2, double val, double keyVal) {
    if (!breakpoints.containsKey(key1) || !breakpoints.containsKey(key2)) {
      // Handle missing breakpoints (e.g., return a default value or throw an exception)
      return keyVal; // Example: return keyVal if a breakpoint is missing
    }
    return deviceWidth > breakpoints[key1]! && deviceWidth < breakpoints[key2]!
        ? keyVal
        : val;
  }
}
