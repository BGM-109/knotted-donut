import 'package:knotted_donut_tdd/app/features/banner/banner_model.dart';
import 'package:knotted_donut_tdd/app/features/banner/banner_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'banner_providers.g.dart';

@Riverpod(keepAlive: true)
BannerRepository bannerRepository(BannerRepositoryRef ref) {
  return BannerRepository();
}

@riverpod
Future<List<BannerModel>> getBanner(GetBannerRef ref) async {
  final repository = ref.read(bannerRepositoryProvider);
  return await repository.getBanners();
}

@riverpod
Future<List<BannerModel>> getInstagram(GetInstagramRef ref) async {
  final repository = ref.read(bannerRepositoryProvider);
  return await repository.getInstagram();
}
