import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  testWidgets('dio provider ...', (tester) async {
    // TODO: Implement test
    final mockDio = MockDio();
  });
}
