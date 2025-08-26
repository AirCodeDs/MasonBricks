// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _${{name.pascalCase()}}Model {
  @DynamicToStringConverter()
  String get id;
  String get name;
  String get description;
  String get category;
  @StringOrNumToDoubleConverter()
  double get price;

  /// Create a copy of {{name.pascalCase()}}Model
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  ${{name.pascalCase()}}ModelCopyWith<{{name.pascalCase()}}Model> get copyWith =>
      _${{name.pascalCase()}}ModelCopyWithImpl<{{name.pascalCase()}}Model>(
          this as {{name.pascalCase()}}Model, _$identity);

  /// Serializes this {{name.pascalCase()}}Model to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is {{name.pascalCase()}}Model &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, description, category, price);

  @override
  String toString() {
    return '{{name.pascalCase()}}Model(id: $id, name: $name, description: $description, category: $category, price: $price)';
  }
}

/// @nodoc
abstract mixin class ${{name.pascalCase()}}ModelCopyWith<$Res> {
  factory ${{name.pascalCase()}}ModelCopyWith(
          {{name.pascalCase()}}Model value, $Res Function({{name.pascalCase()}}Model) _then) =
      _${{name.pascalCase()}}ModelCopyWithImpl;
  @useResult
  $Res call(
      {@DynamicToStringConverter() String id,
      String name,
      String description,
      String category,
      @StringOrNumToDoubleConverter() double price});
}

/// @nodoc
class _${{name.pascalCase()}}ModelCopyWithImpl<$Res> implements ${{name.pascalCase()}}ModelCopyWith<$Res> {
  _${{name.pascalCase()}}ModelCopyWithImpl(this._self, this._then);

  final {{name.pascalCase()}}Model _self;
  final $Res Function({{name.pascalCase()}}Model) _then;

  /// Create a copy of {{name.pascalCase()}}Model
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? category = null,
    Object? price = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _{{name.pascalCase()}}Model implements {{name.pascalCase()}}Model {
  const _{{name.pascalCase()}}Model(
      {@DynamicToStringConverter() required this.id,
      required this.name,
      required this.description,
      required this.category,
      @StringOrNumToDoubleConverter() required this.price});
  factory _{{name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) =>
      _${{name.pascalCase()}}ModelFromJson(json);

  @override
  @DynamicToStringConverter()
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String category;
  @override
  @StringOrNumToDoubleConverter()
  final double price;

  /// Create a copy of {{name.pascalCase()}}Model
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _${{name.pascalCase()}}ModelCopyWith<_{{name.pascalCase()}}Model> get copyWith =>
      __${{name.pascalCase()}}ModelCopyWithImpl<_{{name.pascalCase()}}Model>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _${{name.pascalCase()}}ModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _{{name.pascalCase()}}Model &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, description, category, price);

  @override
  String toString() {
    return '{{name.pascalCase()}}Model(id: $id, name: $name, description: $description, category: $category, price: $price)';
  }
}

/// @nodoc
abstract mixin class _${{name.pascalCase()}}ModelCopyWith<$Res>
    implements ${{name.pascalCase()}}ModelCopyWith<$Res> {
  factory _${{name.pascalCase()}}ModelCopyWith(
          _{{name.pascalCase()}}Model value, $Res Function(_{{name.pascalCase()}}Model) _then) =
      __${{name.pascalCase()}}ModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@DynamicToStringConverter() String id,
      String name,
      String description,
      String category,
      @StringOrNumToDoubleConverter() double price});
}

/// @nodoc
class __${{name.pascalCase()}}ModelCopyWithImpl<$Res>
    implements _${{name.pascalCase()}}ModelCopyWith<$Res> {
  __${{name.pascalCase()}}ModelCopyWithImpl(this._self, this._then);

  final _{{name.pascalCase()}}Model _self;
  final $Res Function(_{{name.pascalCase()}}Model) _then;

  /// Create a copy of {{name.pascalCase()}}Model
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? category = null,
    Object? price = null,
  }) {
    return _then(_{{name.pascalCase()}}Model(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
