import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NoBottomLayout extends ConsumerWidget {
  const NoBottomLayout(
      {super.key, required this.child, this.bottomNavigationBar});
  final Widget child;
  final Widget? bottomNavigationBar;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/');
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: child,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
