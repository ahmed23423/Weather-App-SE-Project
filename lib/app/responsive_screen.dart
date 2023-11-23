import 'dart:io';

import 'package:flutter/material.dart';

//? First
//? Example Of Initialize
/// void main() {
///  runApp(ResponsiveScreen(builder: (_, screenInfo) {
///    return MyApp();
///  }));
/// }
///

//? Second
//? Example Of Useage
/// Container(
/// width : ResponsiveScreen.newSize(12,12,12,12),
/// height: ResponsiveScreen.newSize(12,12,12,12),
/// )

// ignore: constant_identifier_names
enum DeviceType { Small, Medium, Large, Tablet, Desktop }

class ScreenInfo {
  final DeviceType deviceType;
  final double height;
  final double width;
  final double localWidth;
  final double localHeight;
  final Orientation orientation;

  ScreenInfo(
      {required this.deviceType,
      required this.height,
      required this.width,
      required this.localHeight,
      required this.localWidth,
      required this.orientation});
}

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({super.key, required this.builder});

  static late ScreenInfo screenInfo;
  final Widget Function(BuildContext context, ScreenInfo info) builder;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, Orientation orientation) {
      return LayoutBuilder(builder: (context, BoxConstraints constraints) {
        var infoDevice = ScreenInfo(
          orientation: orientation,
          deviceType: _deviceDetails(constraints: constraints, orientation: orientation)!,
          height: Platform.isAndroid || Platform.isIOS
              ? orientation == Orientation.landscape
                  ? constraints.maxWidth
                  : constraints.maxHeight
              : constraints.maxHeight,
          width: Platform.isAndroid || Platform.isIOS
              ? orientation == Orientation.landscape
                  ? constraints.maxHeight
                  : constraints.maxWidth
              : constraints.maxWidth,
          localHeight: constraints.maxHeight,
          localWidth: constraints.maxWidth,
        );
        screenInfo = infoDevice;
        return builder(context, infoDevice);
      });
    });
  }

  DeviceType? _deviceDetails({required BoxConstraints constraints, required Orientation orientation}) {
    late double width;
    if (Platform.isAndroid || Platform.isIOS) {
      width = orientation == Orientation.landscape ? constraints.maxHeight : constraints.maxWidth;
    } else {
      width = constraints.maxWidth;
    }
    if (width >= 950) {
      return DeviceType.Desktop;
    } else if (width > 600) {
      return DeviceType.Tablet;
    } else if (width < 360) {
      return DeviceType.Small;
    } else if (width < 480) {
      return DeviceType.Medium;
    } else if (width < 600) {
      return DeviceType.Small;
    }
    return null;
  }

  static double newSize(
    // small device
    double S,
    // medium device
    double M,
    // large device
    double L,
    // table device
    double T,
    // desktop device
    double D, {
    /// isFont is 'true' it will use this equation [ 'size' * (width / 3) / 100 ]
    /// for makeing the font size const on all devices
    /// isFont is 'false' it will use this equation [ 'size' * width / 100 ]
    /// but it better with other widget like container width or anything other than font size.
    bool isFont = false,

    /// constWithAll is 'true' it will not use equation [ 'size' * width / 100 ] or [ 'size' * (width / 3) / 100 ]
    /// if you add the size 12 for font or any widget it will use the same value '12'.
    bool constWithAll = false,

    /// withWidth is 'true' the equations [ 'size' * (width / 3) / 100 ] or [ 'size' * width / 100 ]
    /// will use the '''width''' of scrren in calculating the new size
    /// withWidth is 'false' the equations [ 'size' * (height / 3) / 100 ] or [ 'size' * height / 100 ]
    /// will use the '''height''' of scrren in calculating the new size
    bool withWidth = true,

    /// like constWithAll but just work with 'Desktop', 'MacOS' or 'Linux'
    bool constWithDML = false,
  }) {
    double width = withWidth ? screenInfo.width : screenInfo.height;
    switch (screenInfo.deviceType) {
      case DeviceType.Small:
        {
          if (constWithAll) {
            return S;
          } else if (isFont) {
            return S * (width / 3) / 100;
          } else {
            return S * width / 100;
          }
        }
      case DeviceType.Large:
        {
          if (constWithAll) {
            return L;
          } else if (isFont) {
            return L * (width / 3) / 100;
          } else {
            return L * width / 100;
          }
        }
      case DeviceType.Medium:
        {
          if (constWithAll) {
            return M;
          } else if (isFont) {
            return M * (width / 3) / 100;
          } else {
            return M * width / 100;
          }
        }
      case DeviceType.Tablet:
        {
          if (constWithAll) {
            return T;
          } else if (isFont) {
            return T * (width / 3) / 100;
          } else {
            return T * width / 100;
          }
        }
      case DeviceType.Desktop:
        {
          if (constWithAll || (constWithDML && (Platform.isWindows || Platform.isLinux || Platform.isMacOS))) {
            return D;
          } else if (isFont) {
            return D * (width / 3) / 100;
          } else {
            return D * width / 100;
          }
        }
      default:
        return 0.0;
    }
  }
}
