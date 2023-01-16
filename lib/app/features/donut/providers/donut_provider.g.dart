// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donut_provider.dart';

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

String _$donutRepositoryHash() => r'fe6472e5558f27c055ed6fd2270345b172c25328';

/// See also [donutRepository].
final donutRepositoryProvider = Provider<DonutRepository>(
  donutRepository,
  name: r'donutRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$donutRepositoryHash,
);
typedef DonutRepositoryRef = ProviderRef<DonutRepository>;
String _$getDonutHash() => r'b8129976ddb16936bdf7045eae81cca68996fbd1';

/// See also [getDonut].
final getDonutProvider = AutoDisposeFutureProvider<List<DonutModel>>(
  getDonut,
  name: r'getDonutProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getDonutHash,
);
typedef GetDonutRef = AutoDisposeFutureProviderRef<List<DonutModel>>;
String _$getBestDonutHash() => r'8fba799a2ab0a3dae3c44b86cf8590a93c91e745';

/// See also [getBestDonut].
final getBestDonutProvider = AutoDisposeFutureProvider<List<DonutModel>>(
  getBestDonut,
  name: r'getBestDonutProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getBestDonutHash,
);
typedef GetBestDonutRef = AutoDisposeFutureProviderRef<List<DonutModel>>;
