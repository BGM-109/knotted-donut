import 'package:knotted_donut_tdd/app/core/network/generic_model.dart';
import 'package:knotted_donut_tdd/app/features/donut/model/donut_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'donut_repository.g.dart';

// Insert uri
@RestApi(baseUrl: '')
abstract class DonutRepository {
  factory DonutRepository(Dio dio, {String baseUrl}) = _DonutRepository;

  @GET('/tYGmiOSRYfDqBJXM?tabId=donuts')
  Future<DataModel<DonutModel>> getDonuts();
}
