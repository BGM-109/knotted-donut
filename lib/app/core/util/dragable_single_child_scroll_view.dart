import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DragableSingleChildScrollView extends StatelessWidget {
  final ScrollController? controller;
  final Widget child;
  final Axis scrollDirection;
  final EdgeInsetsGeometry? padding;
  const DragableSingleChildScrollView(
      {this.controller,
      required this.child,
      required this.scrollDirection,
      Key? key,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyCustomScrollBehavior(),
      child: Scrollbar(
        controller: controller,
        child: SingleChildScrollView(
          padding: padding,
          controller: controller,
          scrollDirection: scrollDirection,
          child: child,
        ),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown,
      };
}
