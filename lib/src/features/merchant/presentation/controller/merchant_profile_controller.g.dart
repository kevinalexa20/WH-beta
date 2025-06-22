// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_profile_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(merchantProfileRepository)
const merchantProfileRepositoryProvider = MerchantProfileRepositoryProvider._();

final class MerchantProfileRepositoryProvider
    extends
        $FunctionalProvider<
          MerchantProfileRepository,
          MerchantProfileRepository
        >
    with $Provider<MerchantProfileRepository> {
  const MerchantProfileRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'merchantProfileRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$merchantProfileRepositoryHash();

  @$internal
  @override
  $ProviderElement<MerchantProfileRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MerchantProfileRepository create(Ref ref) {
    return merchantProfileRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MerchantProfileRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<MerchantProfileRepository>(value),
    );
  }
}

String _$merchantProfileRepositoryHash() =>
    r'bf7a08f465c52d128d755a66201bcb270dbd4a10';

@ProviderFor(MerchantProfileController)
const merchantProfileControllerProvider = MerchantProfileControllerProvider._();

final class MerchantProfileControllerProvider
    extends $AsyncNotifierProvider<MerchantProfileController, void> {
  const MerchantProfileControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'merchantProfileControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$merchantProfileControllerHash();

  @$internal
  @override
  MerchantProfileController create() => MerchantProfileController();

  @$internal
  @override
  $AsyncNotifierProviderElement<MerchantProfileController, void> $createElement(
    $ProviderPointer pointer,
  ) => $AsyncNotifierProviderElement(pointer);
}

String _$merchantProfileControllerHash() =>
    r'55d34153a5ca8a8aaede4be1ac5486947b9da511';

abstract class _$MerchantProfileController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
