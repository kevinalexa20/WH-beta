// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// Provider ini akan mendapatkan lokasi realtime pengguna,
/// lalu mengubahnya menjadi nama lokasi yang bisa dibaca.
@ProviderFor(userLocationName)
const userLocationNameProvider = UserLocationNameProvider._();

/// Provider ini akan mendapatkan lokasi realtime pengguna,
/// lalu mengubahnya menjadi nama lokasi yang bisa dibaca.
final class UserLocationNameProvider
    extends $FunctionalProvider<AsyncValue<Placemark>, FutureOr<Placemark>>
    with $FutureModifier<Placemark>, $FutureProvider<Placemark> {
  /// Provider ini akan mendapatkan lokasi realtime pengguna,
  /// lalu mengubahnya menjadi nama lokasi yang bisa dibaca.
  const UserLocationNameProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userLocationNameProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userLocationNameHash();

  @$internal
  @override
  $FutureProviderElement<Placemark> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Placemark> create(Ref ref) {
    return userLocationName(ref);
  }
}

String _$userLocationNameHash() => r'33134273f74886fa81ab3c79c250bc6ab3ecd8d0';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
