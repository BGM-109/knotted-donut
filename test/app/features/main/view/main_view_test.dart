import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knotted_donut_tdd/app/features/main/view/main_view.dart';

void main() {
  testWidgets('메인 스크린 테스트', (tester) async {
    await tester.pumpWidget(const ProviderScope(
        child: MaterialApp(
      home: MainView(),
    )));
    final loginButton = find.text("로그인 테스트");
    expect(loginButton, findsOneWidget);
  });
}
