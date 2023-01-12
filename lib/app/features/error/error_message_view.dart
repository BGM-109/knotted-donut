import 'package:flutter/material.dart';

class ErrorMessageView extends StatelessWidget {
  const ErrorMessageView({super.key, this.msg});
  final String? msg;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(msg ?? ""),
    );
  }
}
