import 'package:knotted_donut_tdd/app/core/network/generic_model.dart';
import 'package:knotted_donut_tdd/app/features/store/model/store_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'store_repository.g.dart';

@RestApi()
abstract class StoreRepository {
  factory StoreRepository(Dio dio, {String baseUrl}) = _StoreRepository;

  @GET("/tYGmiOSRYfDqBJXM?tabId=store")
  Future<DataModel<StoreModel>> getStores();
}
