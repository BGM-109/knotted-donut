import 'package:flutter/material.dart';
import 'package:knotted_donut_tdd/app/core/constants/breakpoint.dart';

class ResponsiveCenter extends StatelessWidget {
  const ResponsiveCenter(
      {super.key,
      required this.child,
      this.padding = EdgeInsets.zero,
      this.maxContentWidth = Breakpoint.mobile});
  final Widget child;
  final double maxContentWidth;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: maxContentWidth,
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
