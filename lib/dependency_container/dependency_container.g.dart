// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependency_container.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dioHash() => r'a03da399b44b3740dc4fcfc6716203041d66ff01';

/// See also [dio].
@ProviderFor(dio)
final dioProvider = AutoDisposeProvider<Dio>.internal(
  dio,
  name: r'dioProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dioHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DioRef = AutoDisposeProviderRef<Dio>;
String _$remoteServiceHash() => r'b030dfefc24a9e11fe767a38306a34e8b65e2603';

/// See also [remoteService].
@ProviderFor(remoteService)
final remoteServiceProvider = AutoDisposeProvider<RemoteService>.internal(
  remoteService,
  name: r'remoteServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$remoteServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RemoteServiceRef = AutoDisposeProviderRef<RemoteService>;
String _$getWeatherRepositoryHash() =>
    r'fcb98cb3d7b79c563afd93e1adb9383c8a5789bd';

/// See also [getWeatherRepository].
@ProviderFor(getWeatherRepository)
final getWeatherRepositoryProvider =
    AutoDisposeProvider<GetWeatherInterface>.internal(
  getWeatherRepository,
  name: r'getWeatherRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getWeatherRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetWeatherRepositoryRef = AutoDisposeProviderRef<GetWeatherInterface>;
String _$getWeatherUsecaseHash() => r'1027f17dd0ace92178ed4794ccfa50c02a4a73a2';

/// See also [getWeatherUsecase].
@ProviderFor(getWeatherUsecase)
final getWeatherUsecaseProvider =
    AutoDisposeProvider<GetWeatherUsecase>.internal(
  getWeatherUsecase,
  name: r'getWeatherUsecaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getWeatherUsecaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetWeatherUsecaseRef = AutoDisposeProviderRef<GetWeatherUsecase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
