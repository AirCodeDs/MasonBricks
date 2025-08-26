// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductState {
  List<Product> get products;
  Map<ProductOperation, OperationStatus> get operationStatuses;
  Map<ProductOperation, String?> get errors;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductStateCopyWith<ProductState> get copyWith =>
      _$ProductStateCopyWithImpl<ProductState>(
          this as ProductState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductState &&
            const DeepCollectionEquality().equals(other.products, products) &&
            const DeepCollectionEquality()
                .equals(other.operationStatuses, operationStatuses) &&
            const DeepCollectionEquality().equals(other.errors, errors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(products),
      const DeepCollectionEquality().hash(operationStatuses),
      const DeepCollectionEquality().hash(errors));

  @override
  String toString() {
    return 'ProductState(products: $products, operationStatuses: $operationStatuses, errors: $errors)';
  }
}

/// @nodoc
abstract mixin class $ProductStateCopyWith<$Res> {
  factory $ProductStateCopyWith(
          ProductState value, $Res Function(ProductState) _then) =
      _$ProductStateCopyWithImpl;
  @useResult
  $Res call(
      {List<Product> products,
      Map<ProductOperation, OperationStatus> operationStatuses,
      Map<ProductOperation, String?> errors});
}

/// @nodoc
class _$ProductStateCopyWithImpl<$Res> implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._self, this._then);

  final ProductState _self;
  final $Res Function(ProductState) _then;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? operationStatuses = null,
    Object? errors = null,
  }) {
    return _then(_self.copyWith(
      products: null == products
          ? _self.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      operationStatuses: null == operationStatuses
          ? _self.operationStatuses
          : operationStatuses // ignore: cast_nullable_to_non_nullable
              as Map<ProductOperation, OperationStatus>,
      errors: null == errors
          ? _self.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<ProductOperation, String?>,
    ));
  }
}

/// @nodoc

class _ProductState implements ProductState {
  const _ProductState(
      {final List<Product> products = const [],
      final Map<ProductOperation, OperationStatus> operationStatuses = const {},
      final Map<ProductOperation, String?> errors = const {}})
      : _products = products,
        _operationStatuses = operationStatuses,
        _errors = errors;

  final List<Product> _products;
  @override
  @JsonKey()
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  final Map<ProductOperation, OperationStatus> _operationStatuses;
  @override
  @JsonKey()
  Map<ProductOperation, OperationStatus> get operationStatuses {
    if (_operationStatuses is EqualUnmodifiableMapView)
      return _operationStatuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_operationStatuses);
  }

  final Map<ProductOperation, String?> _errors;
  @override
  @JsonKey()
  Map<ProductOperation, String?> get errors {
    if (_errors is EqualUnmodifiableMapView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_errors);
  }

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductStateCopyWith<_ProductState> get copyWith =>
      __$ProductStateCopyWithImpl<_ProductState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductState &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality()
                .equals(other._operationStatuses, _operationStatuses) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(_operationStatuses),
      const DeepCollectionEquality().hash(_errors));

  @override
  String toString() {
    return 'ProductState(products: $products, operationStatuses: $operationStatuses, errors: $errors)';
  }
}

/// @nodoc
abstract mixin class _$ProductStateCopyWith<$Res>
    implements $ProductStateCopyWith<$Res> {
  factory _$ProductStateCopyWith(
          _ProductState value, $Res Function(_ProductState) _then) =
      __$ProductStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<Product> products,
      Map<ProductOperation, OperationStatus> operationStatuses,
      Map<ProductOperation, String?> errors});
}

/// @nodoc
class __$ProductStateCopyWithImpl<$Res>
    implements _$ProductStateCopyWith<$Res> {
  __$ProductStateCopyWithImpl(this._self, this._then);

  final _ProductState _self;
  final $Res Function(_ProductState) _then;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? products = null,
    Object? operationStatuses = null,
    Object? errors = null,
  }) {
    return _then(_ProductState(
      products: null == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      operationStatuses: null == operationStatuses
          ? _self._operationStatuses
          : operationStatuses // ignore: cast_nullable_to_non_nullable
              as Map<ProductOperation, OperationStatus>,
      errors: null == errors
          ? _self._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<ProductOperation, String?>,
    ));
  }
}

// dart format on
