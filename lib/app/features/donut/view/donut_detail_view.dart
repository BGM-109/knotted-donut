import 'package:flutter/material.dart';

class DonutDetailView extends StatelessWidget {
  const DonutDetailView({super.key, required this.id});
  static const String routeName = "detail";

  final String? id;

  @override
  Widget build(BuildContext context) {
    if (id == null) {
      return const Text("잘못된 접근입니다.");
    }

    return Center(child: Text(id!));
  }
}
