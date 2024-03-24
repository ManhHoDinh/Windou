// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'garbage.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GarbageModel _$GarbageModelFromJson(Map<String, dynamic> json) {
  return _GarbageModel.fromJson(json);
}

/// @nodoc
mixin _$GarbageModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageLink => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GarbageModelCopyWith<GarbageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GarbageModelCopyWith<$Res> {
  factory $GarbageModelCopyWith(
          GarbageModel value, $Res Function(GarbageModel) then) =
      _$GarbageModelCopyWithImpl<$Res, GarbageModel>;
  @useResult
  $Res call({String id, String name, String imageLink, String price});
}

/// @nodoc
class _$GarbageModelCopyWithImpl<$Res, $Val extends GarbageModel>
    implements $GarbageModelCopyWith<$Res> {
  _$GarbageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageLink = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageLink: null == imageLink
          ? _value.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GarbageModelImplCopyWith<$Res>
    implements $GarbageModelCopyWith<$Res> {
  factory _$$GarbageModelImplCopyWith(
          _$GarbageModelImpl value, $Res Function(_$GarbageModelImpl) then) =
      __$$GarbageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String imageLink, String price});
}

/// @nodoc
class __$$GarbageModelImplCopyWithImpl<$Res>
    extends _$GarbageModelCopyWithImpl<$Res, _$GarbageModelImpl>
    implements _$$GarbageModelImplCopyWith<$Res> {
  __$$GarbageModelImplCopyWithImpl(
      _$GarbageModelImpl _value, $Res Function(_$GarbageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageLink = null,
    Object? price = null,
  }) {
    return _then(_$GarbageModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageLink: null == imageLink
          ? _value.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GarbageModelImpl with DiagnosticableTreeMixin implements _GarbageModel {
  const _$GarbageModelImpl(
      {required this.id,
      required this.name,
      required this.imageLink,
      required this.price});

  factory _$GarbageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GarbageModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String imageLink;
  @override
  final String price;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GarbageModel(id: $id, name: $name, imageLink: $imageLink, price: $price)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GarbageModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('imageLink', imageLink))
      ..add(DiagnosticsProperty('price', price));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GarbageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageLink, imageLink) ||
                other.imageLink == imageLink) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageLink, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GarbageModelImplCopyWith<_$GarbageModelImpl> get copyWith =>
      __$$GarbageModelImplCopyWithImpl<_$GarbageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GarbageModelImplToJson(
      this,
    );
  }
}

abstract class _GarbageModel implements GarbageModel {
  const factory _GarbageModel(
      {required final String id,
      required final String name,
      required final String imageLink,
      required final String price}) = _$GarbageModelImpl;

  factory _GarbageModel.fromJson(Map<String, dynamic> json) =
      _$GarbageModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get imageLink;
  @override
  String get price;
  @override
  @JsonKey(ignore: true)
  _$$GarbageModelImplCopyWith<_$GarbageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
