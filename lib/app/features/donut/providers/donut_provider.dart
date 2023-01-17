import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knotted_donut_tdd/app/core/network/dio_provider.dart';
import 'package:knotted_donut_tdd/app/features/donut/model/donut_model.dart';
import 'package:knotted_donut_tdd/app/features/donut/repositotry/donut_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'donut_provider.g.dart';

@Riverpod(keepAlive: true)
DonutRepository donutRepository(DonutRepositoryRef ref) {
  final dio = ref.read(dioProvider);
  final baseUrl = ref.read(baseUrlProivder);

  return DonutRepository(dio, baseUrl: baseUrl);
}

// 베이스 URL 없을 경우
// 네트워크 연결이 안되어 있을 경우
@riverpod
Future<List<DonutModel>> getDonut(GetDonutRef ref) async {
  final repository = ref.read(donutRepositoryProvider);
  return await repository.getDonuts().then((response) => response.data);
}

final donutCategoryProivder =
    StateProvider<DonutCategory>((ref) => DonutCategory.donut);

final donutViewProvider = StateProvider<bool>((ref) => true);

final donutSearchProivder = StateProvider<String>((ref) => "");

@riverpod
Future<List<DonutModel>> getBestDonut(GetBestDonutRef ref) async {
  final repository = ref.read(donutRepositoryProvider);
  return await repository.getBestDonuts().then((response) => response.data);
}

@riverpod
Future<DonutModel> getDonutDetail(GetDonutDetailRef ref,
    {required String id}) async {
  final repository = ref.read(donutRepositoryProvider);
  return await repository
      .getDonutDetail(id)
      .then((response) => response.data.first);
}

final detailCountProivder = StateProvider.autoDispose<int>((ref) => 1);
