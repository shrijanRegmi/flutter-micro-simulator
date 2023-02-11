// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'micro_volume_button_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MicroVolumeButtonState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isMuted) onValue,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isMuted)? onValue,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isMuted)? onValue,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnValue value) onValue,
    required TResult Function(_Loading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnValue value)? onValue,
    TResult? Function(_Loading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnValue value)? onValue,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MicroVolumeButtonStateCopyWith<$Res> {
  factory $MicroVolumeButtonStateCopyWith(MicroVolumeButtonState value,
          $Res Function(MicroVolumeButtonState) then) =
      _$MicroVolumeButtonStateCopyWithImpl<$Res, MicroVolumeButtonState>;
}

/// @nodoc
class _$MicroVolumeButtonStateCopyWithImpl<$Res,
        $Val extends MicroVolumeButtonState>
    implements $MicroVolumeButtonStateCopyWith<$Res> {
  _$MicroVolumeButtonStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_OnValueCopyWith<$Res> {
  factory _$$_OnValueCopyWith(
          _$_OnValue value, $Res Function(_$_OnValue) then) =
      __$$_OnValueCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isMuted});
}

/// @nodoc
class __$$_OnValueCopyWithImpl<$Res>
    extends _$MicroVolumeButtonStateCopyWithImpl<$Res, _$_OnValue>
    implements _$$_OnValueCopyWith<$Res> {
  __$$_OnValueCopyWithImpl(_$_OnValue _value, $Res Function(_$_OnValue) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isMuted = null,
  }) {
    return _then(_$_OnValue(
      isMuted: null == isMuted
          ? _value.isMuted
          : isMuted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_OnValue implements _OnValue {
  const _$_OnValue({required this.isMuted});

  @override
  final bool isMuted;

  @override
  String toString() {
    return 'MicroVolumeButtonState.onValue(isMuted: $isMuted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnValue &&
            (identical(other.isMuted, isMuted) || other.isMuted == isMuted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isMuted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnValueCopyWith<_$_OnValue> get copyWith =>
      __$$_OnValueCopyWithImpl<_$_OnValue>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isMuted) onValue,
    required TResult Function() loading,
  }) {
    return onValue(isMuted);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isMuted)? onValue,
    TResult? Function()? loading,
  }) {
    return onValue?.call(isMuted);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isMuted)? onValue,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (onValue != null) {
      return onValue(isMuted);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnValue value) onValue,
    required TResult Function(_Loading value) loading,
  }) {
    return onValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnValue value)? onValue,
    TResult? Function(_Loading value)? loading,
  }) {
    return onValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnValue value)? onValue,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (onValue != null) {
      return onValue(this);
    }
    return orElse();
  }
}

abstract class _OnValue implements MicroVolumeButtonState {
  const factory _OnValue({required final bool isMuted}) = _$_OnValue;

  bool get isMuted;
  @JsonKey(ignore: true)
  _$$_OnValueCopyWith<_$_OnValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$MicroVolumeButtonStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'MicroVolumeButtonState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isMuted) onValue,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isMuted)? onValue,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isMuted)? onValue,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnValue value) onValue,
    required TResult Function(_Loading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnValue value)? onValue,
    TResult? Function(_Loading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnValue value)? onValue,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements MicroVolumeButtonState {
  const factory _Loading() = _$_Loading;
}
