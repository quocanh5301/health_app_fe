// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alarm_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AlarmState {
  List<AlarmSettings> get alarms => throw _privateConstructorUsedError;
  String get mess => throw _privateConstructorUsedError;
  SetAlarmStatus get setAlarmStatus => throw _privateConstructorUsedError;
  GetAlarmStatus get getAlarmStatus => throw _privateConstructorUsedError;
  DeleteAlarmStatus get deleteAlarmStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlarmStateCopyWith<AlarmState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlarmStateCopyWith<$Res> {
  factory $AlarmStateCopyWith(
          AlarmState value, $Res Function(AlarmState) then) =
      _$AlarmStateCopyWithImpl<$Res, AlarmState>;
  @useResult
  $Res call(
      {List<AlarmSettings> alarms,
      String mess,
      SetAlarmStatus setAlarmStatus,
      GetAlarmStatus getAlarmStatus,
      DeleteAlarmStatus deleteAlarmStatus});
}

/// @nodoc
class _$AlarmStateCopyWithImpl<$Res, $Val extends AlarmState>
    implements $AlarmStateCopyWith<$Res> {
  _$AlarmStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alarms = null,
    Object? mess = null,
    Object? setAlarmStatus = null,
    Object? getAlarmStatus = null,
    Object? deleteAlarmStatus = null,
  }) {
    return _then(_value.copyWith(
      alarms: null == alarms
          ? _value.alarms
          : alarms // ignore: cast_nullable_to_non_nullable
              as List<AlarmSettings>,
      mess: null == mess
          ? _value.mess
          : mess // ignore: cast_nullable_to_non_nullable
              as String,
      setAlarmStatus: null == setAlarmStatus
          ? _value.setAlarmStatus
          : setAlarmStatus // ignore: cast_nullable_to_non_nullable
              as SetAlarmStatus,
      getAlarmStatus: null == getAlarmStatus
          ? _value.getAlarmStatus
          : getAlarmStatus // ignore: cast_nullable_to_non_nullable
              as GetAlarmStatus,
      deleteAlarmStatus: null == deleteAlarmStatus
          ? _value.deleteAlarmStatus
          : deleteAlarmStatus // ignore: cast_nullable_to_non_nullable
              as DeleteAlarmStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlarmStateeImplCopyWith<$Res>
    implements $AlarmStateCopyWith<$Res> {
  factory _$$AlarmStateeImplCopyWith(
          _$AlarmStateeImpl value, $Res Function(_$AlarmStateeImpl) then) =
      __$$AlarmStateeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AlarmSettings> alarms,
      String mess,
      SetAlarmStatus setAlarmStatus,
      GetAlarmStatus getAlarmStatus,
      DeleteAlarmStatus deleteAlarmStatus});
}

/// @nodoc
class __$$AlarmStateeImplCopyWithImpl<$Res>
    extends _$AlarmStateCopyWithImpl<$Res, _$AlarmStateeImpl>
    implements _$$AlarmStateeImplCopyWith<$Res> {
  __$$AlarmStateeImplCopyWithImpl(
      _$AlarmStateeImpl _value, $Res Function(_$AlarmStateeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alarms = null,
    Object? mess = null,
    Object? setAlarmStatus = null,
    Object? getAlarmStatus = null,
    Object? deleteAlarmStatus = null,
  }) {
    return _then(_$AlarmStateeImpl(
      alarms: null == alarms
          ? _value._alarms
          : alarms // ignore: cast_nullable_to_non_nullable
              as List<AlarmSettings>,
      mess: null == mess
          ? _value.mess
          : mess // ignore: cast_nullable_to_non_nullable
              as String,
      setAlarmStatus: null == setAlarmStatus
          ? _value.setAlarmStatus
          : setAlarmStatus // ignore: cast_nullable_to_non_nullable
              as SetAlarmStatus,
      getAlarmStatus: null == getAlarmStatus
          ? _value.getAlarmStatus
          : getAlarmStatus // ignore: cast_nullable_to_non_nullable
              as GetAlarmStatus,
      deleteAlarmStatus: null == deleteAlarmStatus
          ? _value.deleteAlarmStatus
          : deleteAlarmStatus // ignore: cast_nullable_to_non_nullable
              as DeleteAlarmStatus,
    ));
  }
}

/// @nodoc

class _$AlarmStateeImpl implements _AlarmStatee {
  const _$AlarmStateeImpl(
      {final List<AlarmSettings> alarms = const [],
      this.mess = "",
      this.setAlarmStatus = SetAlarmStatus.initial,
      this.getAlarmStatus = GetAlarmStatus.initial,
      this.deleteAlarmStatus = DeleteAlarmStatus.initial})
      : _alarms = alarms;

  final List<AlarmSettings> _alarms;
  @override
  @JsonKey()
  List<AlarmSettings> get alarms {
    if (_alarms is EqualUnmodifiableListView) return _alarms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_alarms);
  }

  @override
  @JsonKey()
  final String mess;
  @override
  @JsonKey()
  final SetAlarmStatus setAlarmStatus;
  @override
  @JsonKey()
  final GetAlarmStatus getAlarmStatus;
  @override
  @JsonKey()
  final DeleteAlarmStatus deleteAlarmStatus;

  @override
  String toString() {
    return 'AlarmState(alarms: $alarms, mess: $mess, setAlarmStatus: $setAlarmStatus, getAlarmStatus: $getAlarmStatus, deleteAlarmStatus: $deleteAlarmStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlarmStateeImpl &&
            const DeepCollectionEquality().equals(other._alarms, _alarms) &&
            (identical(other.mess, mess) || other.mess == mess) &&
            (identical(other.setAlarmStatus, setAlarmStatus) ||
                other.setAlarmStatus == setAlarmStatus) &&
            (identical(other.getAlarmStatus, getAlarmStatus) ||
                other.getAlarmStatus == getAlarmStatus) &&
            (identical(other.deleteAlarmStatus, deleteAlarmStatus) ||
                other.deleteAlarmStatus == deleteAlarmStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_alarms),
      mess,
      setAlarmStatus,
      getAlarmStatus,
      deleteAlarmStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlarmStateeImplCopyWith<_$AlarmStateeImpl> get copyWith =>
      __$$AlarmStateeImplCopyWithImpl<_$AlarmStateeImpl>(this, _$identity);
}

abstract class _AlarmStatee implements AlarmState {
  const factory _AlarmStatee(
      {final List<AlarmSettings> alarms,
      final String mess,
      final SetAlarmStatus setAlarmStatus,
      final GetAlarmStatus getAlarmStatus,
      final DeleteAlarmStatus deleteAlarmStatus}) = _$AlarmStateeImpl;

  @override
  List<AlarmSettings> get alarms;
  @override
  String get mess;
  @override
  SetAlarmStatus get setAlarmStatus;
  @override
  GetAlarmStatus get getAlarmStatus;
  @override
  DeleteAlarmStatus get deleteAlarmStatus;
  @override
  @JsonKey(ignore: true)
  _$$AlarmStateeImplCopyWith<_$AlarmStateeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
