// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String _$bannerRepositoryHash() => r'e548c7e14a9be971adf419ae0d1e7045f017c06c';

/// See also [bannerRepository].
final bannerRepositoryProvider = Provider<BannerRepository>(
  bannerRepository,
  name: r'bannerRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$bannerRepositoryHash,
);
typedef BannerRepositoryRef = ProviderRef<BannerRepository>;
String _$getBannerHash() => r'da6de8ff44f86c4c7033a167bb9ccd7c179cef99';

/// See also [getBanner].
final getBannerProvider = AutoDisposeFutureProvider<List<BannerModel>>(
  getBanner,
  name: r'getBannerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getBannerHash,
);
typedef GetBannerRef = AutoDisposeFutureProviderRef<List<BannerModel>>;
String _$getInstagramHash() => r'07e797cfa68cfcc836699b6a44e959130c2e5b7c';

/// See also [getInstagram].
final getInstagramProvider = AutoDisposeFutureProvider<List<BannerModel>>(
  getInstagram,
  name: r'getInstagramProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getInstagramHash,
);
typedef GetInstagramRef = AutoDisposeFutureProviderRef<List<BannerModel>>;
