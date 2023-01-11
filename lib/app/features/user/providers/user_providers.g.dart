// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_providers.dart';

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

String _$userRepositoryHash() => r'6e198555fc6e5f4763ccfb92ea208091e52af39b';

/// See also [userRepository].
final userRepositoryProvider = Provider<UserRepository>(
  userRepository,
  name: r'userRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userRepositoryHash,
);
typedef UserRepositoryRef = ProviderRef<UserRepository>;
String _$getUserProviderHash() => r'c2c0e968c94fa32b1f1f192b76ce52895c727b27';

/// See also [getUserProvider].
final getUserProviderProvider = AutoDisposeFutureProvider<UserModel>(
  getUserProvider,
  name: r'getUserProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getUserProviderHash,
);
typedef GetUserProviderRef = AutoDisposeFutureProviderRef<UserModel>;
