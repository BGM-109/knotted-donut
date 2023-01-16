import 'package:flutter_test/flutter_test.dart';
import 'package:knotted_donut_tdd/app/features/donut/repositotry/donut_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:retrofit/dio.dart';

class MockDonutRepository extends Mock implements DonutRepository {}

class MockResponse extends Mock implements DioResponseType {}

void main() {
  group("Donut Repository", () {
    final mockRepository = MockDonutRepository(); // #
  });
}
