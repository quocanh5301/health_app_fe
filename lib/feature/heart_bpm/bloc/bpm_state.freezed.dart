// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bpm_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BPMState {
  String get mess => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  int get bpm => throw _privateConstructorUsedError;
  int get stressLevel => throw _privateConstructorUsedError;
  String get stressDescription => throw _privateConstructorUsedError;
  SetYouBPMStatus get setYouBPMStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BPMStateCopyWith<BPMState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BPMStateCopyWith<$Res> {
  factory $BPMStateCopyWith(BPMState value, $Res Function(BPMState) then) =
      _$BPMStateCopyWithImpl<$Res, BPMState>;
  @useResult
  $Res call(
      {String mess,
      int code,
      int bpm,
      int stressLevel,
      String stressDescription,
      SetYouBPMStatus setYouBPMStatus});
}

/// @nodoc
class _$BPMStateCopyWithImpl<$Res, $Val extends BPMState>
    implements $BPMStateCopyWith<$Res> {
  _$BPMStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mess = null,
    Object? code = null,
    Object? bpm = null,
    Object? stressLevel = null,
    Object? stressDescription = null,
    Object? setYouBPMStatus = null,
  }) {
    return _then(_value.copyWith(
      mess: null == mess
          ? _value.mess
          : mess // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      bpm: null == bpm
          ? _value.bpm
          : bpm // ignore: cast_nullable_to_non_nullable
              as int,
      stressLevel: null == stressLevel
          ? _value.stressLevel
          : stressLevel // ignore: cast_nullable_to_non_nullable
              as int,
      stressDescription: null == stressDescription
          ? _value.stressDescription
          : stressDescription // ignore: cast_nullable_to_non_nullable
              as String,
      setYouBPMStatus: null == setYouBPMStatus
          ? _value.setYouBPMStatus
          : setYouBPMStatus // ignore: cast_nullable_to_non_nullable
              as SetYouBPMStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BPMStateImplCopyWith<$Res>
    implements $BPMStateCopyWith<$Res> {
  factory _$$BPMStateImplCopyWith(
          _$BPMStateImpl value, $Res Function(_$BPMStateImpl) then) =
      __$$BPMStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String mess,
      int code,
      int bpm,
      int stressLevel,
      String stressDescription,
      SetYouBPMStatus setYouBPMStatus});
}

/// @nodoc
class __$$BPMStateImplCopyWithImpl<$Res>
    extends _$BPMStateCopyWithImpl<$Res, _$BPMStateImpl>
    implements _$$BPMStateImplCopyWith<$Res> {
  __$$BPMStateImplCopyWithImpl(
      _$BPMStateImpl _value, $Res Function(_$BPMStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mess = null,
    Object? code = null,
    Object? bpm = null,
    Object? stressLevel = null,
    Object? stressDescription = null,
    Object? setYouBPMStatus = null,
  }) {
    return _then(_$BPMStateImpl(
      mess: null == mess
          ? _value.mess
          : mess // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      bpm: null == bpm
          ? _value.bpm
          : bpm // ignore: cast_nullable_to_non_nullable
              as int,
      stressLevel: null == stressLevel
          ? _value.stressLevel
          : stressLevel // ignore: cast_nullable_to_non_nullable
              as int,
      stressDescription: null == stressDescription
          ? _value.stressDescription
          : stressDescription // ignore: cast_nullable_to_non_nullable
              as String,
      setYouBPMStatus: null == setYouBPMStatus
          ? _value.setYouBPMStatus
          : setYouBPMStatus // ignore: cast_nullable_to_non_nullable
              as SetYouBPMStatus,
    ));
  }
}

/// @nodoc

class _$BPMStateImpl implements _BPMState {
  const _$BPMStateImpl(
      {this.mess = '',
      this.code = 200,
      this.bpm = 0,
      this.stressLevel = 0,
      this.stressDescription = 'Basic Stress Level',
      this.setYouBPMStatus = SetYouBPMStatus.initial});

  @override
  @JsonKey()
  final String mess;
  @override
  @JsonKey()
  final int code;
  @override
  @JsonKey()
  final int bpm;
  @override
  @JsonKey()
  final int stressLevel;
  @override
  @JsonKey()
  final String stressDescription;
  @override
  @JsonKey()
  final SetYouBPMStatus setYouBPMStatus;

  @override
  String toString() {
    return 'BPMState(mess: $mess, code: $code, bpm: $bpm, stressLevel: $stressLevel, stressDescription: $stressDescription, setYouBPMStatus: $setYouBPMStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BPMStateImpl &&
            (identical(other.mess, mess) || other.mess == mess) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.bpm, bpm) || other.bpm == bpm) &&
            (identical(other.stressLevel, stressLevel) ||
                other.stressLevel == stressLevel) &&
            (identical(other.stressDescription, stressDescription) ||
                other.stressDescription == stressDescription) &&
            (identical(other.setYouBPMStatus, setYouBPMStatus) ||
                other.setYouBPMStatus == setYouBPMStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mess, code, bpm, stressLevel,
      stressDescription, setYouBPMStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BPMStateImplCopyWith<_$BPMStateImpl> get copyWith =>
      __$$BPMStateImplCopyWithImpl<_$BPMStateImpl>(this, _$identity);
}

abstract class _BPMState implements BPMState {
  const factory _BPMState(
      {final String mess,
      final int code,
      final int bpm,
      final int stressLevel,
      final String stressDescription,
      final SetYouBPMStatus setYouBPMStatus}) = _$BPMStateImpl;

  @override
  String get mess;
  @override
  int get code;
  @override
  int get bpm;
  @override
  int get stressLevel;
  @override
  String get stressDescription;
  @override
  SetYouBPMStatus get setYouBPMStatus;
  @override
  @JsonKey(ignore: true)
  _$$BPMStateImplCopyWith<_$BPMStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
