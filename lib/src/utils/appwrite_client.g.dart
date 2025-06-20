// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appwrite_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(appwriteClient)
const appwriteClientProvider = AppwriteClientProvider._();

final class AppwriteClientProvider extends $FunctionalProvider<Client, Client>
    with $Provider<Client> {
  const AppwriteClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appwriteClientProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appwriteClientHash();

  @$internal
  @override
  $ProviderElement<Client> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Client create(Ref ref) {
    return appwriteClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Client value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<Client>(value),
    );
  }
}

String _$appwriteClientHash() => r'fdcf39a7db62ec88c8cde2cb6131e1d0ed7aaf4e';

@ProviderFor(appwriteAccount)
const appwriteAccountProvider = AppwriteAccountProvider._();

final class AppwriteAccountProvider
    extends $FunctionalProvider<Account, Account>
    with $Provider<Account> {
  const AppwriteAccountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appwriteAccountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appwriteAccountHash();

  @$internal
  @override
  $ProviderElement<Account> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Account create(Ref ref) {
    return appwriteAccount(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Account value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<Account>(value),
    );
  }
}

String _$appwriteAccountHash() => r'7c5c3bf21a5f8cc29d2fbcff5337c6cfc39ff979';

@ProviderFor(appwriteDatabase)
const appwriteDatabaseProvider = AppwriteDatabaseProvider._();

final class AppwriteDatabaseProvider
    extends $FunctionalProvider<Databases, Databases>
    with $Provider<Databases> {
  const AppwriteDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appwriteDatabaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appwriteDatabaseHash();

  @$internal
  @override
  $ProviderElement<Databases> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Databases create(Ref ref) {
    return appwriteDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Databases value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<Databases>(value),
    );
  }
}

String _$appwriteDatabaseHash() => r'a42ff860845e1ffa63e6357454099c5b547b0f7b';

@ProviderFor(appwriteStorage)
const appwriteStorageProvider = AppwriteStorageProvider._();

final class AppwriteStorageProvider
    extends $FunctionalProvider<Storage, Storage>
    with $Provider<Storage> {
  const AppwriteStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appwriteStorageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appwriteStorageHash();

  @$internal
  @override
  $ProviderElement<Storage> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Storage create(Ref ref) {
    return appwriteStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Storage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<Storage>(value),
    );
  }
}

String _$appwriteStorageHash() => r'b1c835e05314f23fe37b1729a74bbb54963188e6';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
