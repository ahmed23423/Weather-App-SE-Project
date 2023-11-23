import 'dart:async';

import 'package:flutter/widgets.dart';

mixin AfterLayout<T extends StatefulWidget> on State<T>{
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.endOfFrame.then((value) {
      if(mounted) afterLayoutBuild(context);
    });
  }
  FutureOr<void> afterLayoutBuild(BuildContext context);
}