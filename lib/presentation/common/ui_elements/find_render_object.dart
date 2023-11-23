


import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

abstract class GetRenderBox{
  static RenderBox get(GlobalKey key){
    final RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;
    return renderBox;
  }
}

class WidgetSizeRenderObject extends RenderProxyBox {
  void Function(RenderBox renderBox)? onRenderObjectChange;
  void Function(RenderBox renderBox)? onRenderedObject;

  WidgetSizeRenderObject({this.onRenderObjectChange, this.onRenderedObject});

  @override
  void performLayout() {
    try{
      WidgetsBinding.instance.endOfFrame.then((value){
        if(child != null && onRenderedObject != null) {
          onRenderedObject!(child!);
        }
      });

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if(child != null && onRenderObjectChange != null) onRenderObjectChange!(child!);
      });
    }catch(e){
      print(e);
    }
    super.performLayout();
  }
}

class RenderBoxWrapper extends SingleChildRenderObjectWidget{
  void Function(RenderBox renderBox)? onRenderObjectChange;
  void Function(RenderBox renderBox)? onRenderedObject;

  RenderBoxWrapper({
    super.key,
    required super.child,
    this.onRenderObjectChange,
    this.onRenderedObject
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return WidgetSizeRenderObject(onRenderObjectChange: onRenderObjectChange, onRenderedObject: onRenderedObject);
  }

}