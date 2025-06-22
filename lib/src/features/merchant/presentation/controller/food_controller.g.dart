// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(FoodController)
const foodControllerProvider = FoodControllerProvider._();

final class FoodControllerProvider
    extends $AsyncNotifierProvider<FoodController, List<FoodItemModel>> {
  const FoodControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'foodControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$foodControllerHash();

  @$internal
  @override
  FoodController create() => FoodController();

  @$internal
  @override
  $AsyncNotifierProviderElement<FoodController, List<FoodItemModel>>
  $createElement($ProviderPointer pointer) =>
      $AsyncNotifierProviderElement(pointer);
}

String _$foodControllerHash() => r'd8708f727420d2b3cab14b109228c79ccac9b3e7';

abstract class _$FoodController extends $AsyncNotifier<List<FoodItemModel>> {
  FutureOr<List<FoodItemModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<FoodItemModel>>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<FoodItemModel>>>,
              AsyncValue<List<FoodItemModel>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(foodDetail)
const foodDetailProvider = FoodDetailFamily._();

final class FoodDetailProvider
    extends
        $FunctionalProvider<AsyncValue<FoodItemModel>, FutureOr<FoodItemModel>>
    with $FutureModifier<FoodItemModel>, $FutureProvider<FoodItemModel> {
  const FoodDetailProvider._({
    required FoodDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'foodDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$foodDetailHash();

  @override
  String toString() {
    return r'foodDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<FoodItemModel> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<FoodItemModel> create(Ref ref) {
    final argument = this.argument as String;
    return foodDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FoodDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$foodDetailHash() => r'79fecb1b9c876a35a228080057fba1de630939f1';

final class FoodDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<FoodItemModel>, String> {
  const FoodDetailFamily._()
    : super(
        retry: null,
        name: r'foodDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FoodDetailProvider call(String foodId) =>
      FoodDetailProvider._(argument: foodId, from: this);

  @override
  String toString() => r'foodDetailProvider';
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
