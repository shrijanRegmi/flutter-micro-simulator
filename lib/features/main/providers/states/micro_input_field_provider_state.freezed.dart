// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'micro_input_field_provider_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MicroInputFieldProviderState {
  String get address => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MicroInputFieldProviderStateCopyWith<MicroInputFieldProviderState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MicroInputFieldProviderStateCopyWith<$Res> {
  factory $MicroInputFieldProviderStateCopyWith(
          MicroInputFieldProviderState value,
          $Res Function(MicroInputFieldProviderState) then) =
      _$MicroInputFieldProviderStateCopyWithImpl<$Res,
          MicroInputFieldProviderState>;
  @useResult
  $Res call({String address, String value});
}

/// @nodoc
class _$MicroInputFieldProviderStateCopyWithImpl<$Res,
        $Val extends MicroInputFieldProviderState>
    implements $MicroInputFieldProviderStateCopyWith<$Res> {
  _$MicroInputFieldProviderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MicroInputFieldProviderStateCopyWith<$Res>
    implements $MicroInputFieldProviderStateCopyWith<$Res> {
  factory _$$_MicroInputFieldProviderStateCopyWith(
          _$_MicroInputFieldProviderState value,
          $Res Function(_$_MicroInputFieldProviderState) then) =
      __$$_MicroInputFieldProviderStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String address, String value});
}

/// @nodoc
class __$$_MicroInputFieldProviderStateCopyWithImpl<$Res>
    extends _$MicroInputFieldProviderStateCopyWithImpl<$Res,
        _$_MicroInputFieldProviderState>
    implements _$$_MicroInputFieldProviderStateCopyWith<$Res> {
  __$$_MicroInputFieldProviderStateCopyWithImpl(
      _$_MicroInputFieldProviderState _value,
      $Res Function(_$_MicroInputFieldProviderState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? value = null,
  }) {
    return _then(_$_MicroInputFieldProviderState(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MicroInputFieldProviderState implements _MicroInputFieldProviderState {
  const _$_MicroInputFieldProviderState(
      {required this.address, required this.value});

  @override
  final String address;
  @override
  final String value;

  @override
  String toString() {
    return 'MicroInputFieldProviderState(address: $address, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MicroInputFieldProviderState &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MicroInputFieldProviderStateCopyWith<_$_MicroInputFieldProviderState>
      get copyWith => __$$_MicroInputFieldProviderStateCopyWithImpl<
          _$_MicroInputFieldProviderState>(this, _$identity);
}

abstract class _MicroInputFieldProviderState
    implements MicroInputFieldProviderState {
  const factory _MicroInputFieldProviderState(
      {required final String address,
      required final String value}) = _$_MicroInputFieldProviderState;

  @override
  String get address;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$_MicroInputFieldProviderStateCopyWith<_$_MicroInputFieldProviderState>
      get copyWith => throw _privateConstructorUsedError;
}
