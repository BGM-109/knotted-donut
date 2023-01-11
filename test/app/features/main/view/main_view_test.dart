import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/app.dart';
import 'package:flutter_application_1/app/features/main/view/main_view.dart';
import 'package:flutter_application_1/app/features/user/providers/user_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  testWidgets('메인 스크린 테스트', (tester) async {
    await tester.pumpWidget(const ProviderScope(
        child: MaterialApp(
      home: MainView(),
    )));
    final loginButton = find.text("로그인 테스트");
    expect(loginButton, findsOneWidget);
    await tester.tap(loginButton);
    await tester.pumpAndSettle(const Duration(milliseconds: 100));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
