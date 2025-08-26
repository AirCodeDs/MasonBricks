// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '{{name.snakeCase()}}_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _${{name.pascalCase()}}State {
  List<{{name.snakeCase()}}> get {{name.snakeCase()}}s;
  Map<{{name.pascalCase()}}Operation, OperationStatus> get operationStatuses;
  Map<{{name.pascalCase()}}Operation, String?> get errors;

  /// Create a copy of {{name.pascalCase()}}State
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  ${{name.pascalCase()}}StateCopyWith<{{name.pascalCase()}}State> get copyWith =>
      _${{name.pascalCase()}}StateCopyWithImpl<{{name.pascalCase()}}State>(
          this as {{name.pascalCase()}}State, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is {{name.pascalCase()}}State &&
            const DeepCollectionEquality().equals(other.{{name.snakeCase()}}s, {{name.snakeCase()}}s) &&
            const DeepCollectionEquality()
                .equals(other.operationStatuses, operationStatuses) &&
            const DeepCollectionEquality().equals(other.errors, errors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash({{name.snakeCase()}}s),
      const DeepCollectionEquality().hash(operationStatuses),
      const DeepCollectionEquality().hash(errors));

  @override
  String toString() {
    return '{{name.pascalCase()}}State({{name.snakeCase()}}s: ${{name.snakeCase()}}s, operationStatuses: $operationStatuses, errors: $errors)';
  }
}

/// @nodoc
abstract mixin class ${{name.pascalCase()}}StateCopyWith<$Res> {
  factory ${{name.pascalCase()}}StateCopyWith(
          {{name.pascalCase()}}State value, $Res Function({{name.pascalCase()}}State) _then) =
      _${{name.pascalCase()}}StateCopyWithImpl;
  @useResult
  $Res call(
      {List<{{name.snakeCase()}}> {{name.snakeCase()}}s,
      Map<{{name.pascalCase()}}Operation, OperationStatus> operationStatuses,
      Map<{{name.pascalCase()}}Operation, String?> errors});
}

/// @nodoc
class _${{name.pascalCase()}}StateCopyWithImpl<$Res> implements ${{name.pascalCase()}}StateCopyWith<$Res> {
  _${{name.pascalCase()}}StateCopyWithImpl(this._self, this._then);

  final {{name.pascalCase()}}State _self;
  final $Res Function({{name.pascalCase()}}State) _then;

  /// Create a copy of {{name.pascalCase()}}State
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? {{name.snakeCase()}}s = null,
    Object? operationStatuses = null,
    Object? errors = null,
  }) {
    return _then(_self.copyWith(
      {{name.snakeCase()}}s: null == {{name.snakeCase()}}s
          ? _self.{{name.snakeCase()}}s
          : {{name.snakeCase()}}s // ignore: cast_nullable_to_non_nullable
              as List<{{name.snakeCase()}}>,
      operationStatuses: null == operationStatuses
          ? _self.operationStatuses
          : operationStatuses // ignore: cast_nullable_to_non_nullable
              as Map<{{name.pascalCase()}}Operation, OperationStatus>,
      errors: null == errors
          ? _self.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<{{name.pascalCase()}}Operation, String?>,
    ));
  }
}

/// @nodoc

class _{{name.pascalCase()}}State implements {{name.pascalCase()}}State {
  const _{{name.pascalCase()}}State(
      {final List<{{name.snakeCase()}}> {{name.snakeCase()}}s = const [],
      final Map<{{name.pascalCase()}}Operation, OperationStatus> operationStatuses = const {},
      final Map<{{name.pascalCase()}}Operation, String?> errors = const {}})
      : _products = {{name.snakeCase()}}s,
        _operationStatuses = operationStatuses,
        _errors = errors;

  final List<{{name.snakeCase()}}> _products;
  @override
  @JsonKey()
  List<{{name.snakeCase()}}> get {{name.snakeCase()}}s {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  final Map<{{name.pascalCase()}}Operation, OperationStatus> _operationStatuses;
  @override
  @JsonKey()
  Map<{{name.pascalCase()}}Operation, OperationStatus> get operationStatuses {
    if (_operationStatuses is EqualUnmodifiableMapView)
      return _operationStatuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_operationStatuses);
  }

  final Map<{{name.pascalCase()}}Operation, String?> _errors;
  @override
  @JsonKey()
  Map<{{name.pascalCase()}}Operation, String?> get errors {
    if (_errors is EqualUnmodifiableMapView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_errors);
  }

  /// Create a copy of {{name.pascalCase()}}State
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _${{name.pascalCase()}}StateCopyWith<_{{name.pascalCase()}}State> get copyWith =>
      __${{name.pascalCase()}}StateCopyWithImpl<_{{name.pascalCase()}}State>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _{{name.pascalCase()}}State &&
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
    return '{{name.pascalCase()}}State({{name.snakeCase()}}s: ${{name.snakeCase()}}s, operationStatuses: $operationStatuses, errors: $errors)';
  }
}

/// @nodoc
abstract mixin class _${{name.pascalCase()}}StateCopyWith<$Res>
    implements ${{name.pascalCase()}}StateCopyWith<$Res> {
  factory _${{name.pascalCase()}}StateCopyWith(
          _{{name.pascalCase()}}State value, $Res Function(_{{name.pascalCase()}}State) _then) =
      __${{name.pascalCase()}}StateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<{{name.snakeCase()}}> {{name.snakeCase()}}s,
      Map<{{name.pascalCase()}}Operation, OperationStatus> operationStatuses,
      Map<{{name.pascalCase()}}Operation, String?> errors});
}

/// @nodoc
class __${{name.pascalCase()}}StateCopyWithImpl<$Res>
    implements _${{name.pascalCase()}}StateCopyWith<$Res> {
  __${{name.pascalCase()}}StateCopyWithImpl(this._self, this._then);

  final _{{name.pascalCase()}}State _self;
  final $Res Function(_{{name.pascalCase()}}State) _then;

  /// Create a copy of {{name.pascalCase()}}State
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? {{name.snakeCase()}}s = null,
    Object? operationStatuses = null,
    Object? errors = null,
  }) {
    return _then(_{{name.pascalCase()}}State(
      {{name.snakeCase()}}s: null == {{name.snakeCase()}}s
          ? _self._products
          : {{name.snakeCase()}}s // ignore: cast_nullable_to_non_nullable
              as List<{{name.snakeCase()}}>,
      operationStatuses: null == operationStatuses
          ? _self._operationStatuses
          : operationStatuses // ignore: cast_nullable_to_non_nullable
              as Map<{{name.pascalCase()}}Operation, OperationStatus>,
      errors: null == errors
          ? _self._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<{{name.pascalCase()}}Operation, String?>,
    ));
  }
}

// dart format on
