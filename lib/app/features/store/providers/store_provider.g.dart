// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_provider.dart';

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

String _$storeRepositoryHash() => r'80cb2371850486f720e2bf9d08c3a2e0897347f8';

/// See also [storeRepository].
final storeRepositoryProvider = Provider<StoreRepository>(
  storeRepository,
  name: r'storeRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$storeRepositoryHash,
);
typedef StoreRepositoryRef = ProviderRef<StoreRepository>;
String _$getStoresHash() => r'6ef9e02739bbedf4cfe3e9931fdb4ef4b6274fb5';

/// See also [getStores].
final getStoresProvider = AutoDisposeFutureProvider<List<StoreModel>>(
  getStores,
  name: r'getStoresProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getStoresHash,
);
typedef GetStoresRef = AutoDisposeFutureProviderRef<List<StoreModel>>;
