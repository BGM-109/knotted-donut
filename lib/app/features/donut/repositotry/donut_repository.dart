import 'package:knotted_donut_tdd/app/core/network/generic_model.dart';
import 'package:knotted_donut_tdd/app/features/donut/model/donut_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'donut_repository.g.dart';

// Insert uri
@RestApi()
abstract class DonutRepository {
  factory DonutRepository(Dio dio, {String baseUrl}) = _DonutRepository;

  @GET('/tYGmiOSRYfDqBJXM?tabId=donuts')
  Future<DataModel<DonutModel>> getDonuts();

  @GET('/tYGmiOSRYfDqBJXM?tabId=best')
  Future<DataModel<DonutModel>> getBestDonuts();

  @GET('/tYGmiOSRYfDqBJXM?tabId=donuts&filterBy=id&filterValue={id}')
  Future<DataModel<DonutModel>> getDonutDetail(@Path("id") String id);
}
