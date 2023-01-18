import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knotted_donut_tdd/app/core/network/dio_provider.dart';
import 'package:knotted_donut_tdd/app/features/store/model/store_model.dart';
import 'package:knotted_donut_tdd/app/features/store/repository/store_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'store_provider.g.dart';

@Riverpod(keepAlive: true)
StoreRepository storeRepository(StoreRepositoryRef ref) {
  final dio = ref.read(dioProvider);

  return StoreRepository(dio);
}

@riverpod
Future<List<StoreModel>> getStores(GetStoresRef ref) async {
  final storeRepository = ref.read(storeRepositoryProvider);
  return await storeRepository.getStores().then((value) => value.data);
}

final storeSearchTextProvider =
    StateProvider.autoDispose<String?>((ref) => null);

final selectedStoreProvider = StateProvider<StoreModel?>((ref) => null);
