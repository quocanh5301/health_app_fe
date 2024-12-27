// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  String get mess => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  List<BasicRunData> get lastWeekRunDatas => throw _privateConstructorUsedError;
  List<BasicRunData> get thisWeekRunDatas => throw _privateConstructorUsedError;
  List<BasicHeartRateData> get myBPMDatas => throw _privateConstructorUsedError;
  GetYourDataStatus get getYourDataStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {String mess,
      int code,
      List<BasicRunData> lastWeekRunDatas,
      List<BasicRunData> thisWeekRunDatas,
      List<BasicHeartRateData> myBPMDatas,
      GetYourDataStatus getYourDataStatus});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mess = null,
    Object? code = null,
    Object? lastWeekRunDatas = null,
    Object? thisWeekRunDatas = null,
    Object? myBPMDatas = null,
    Object? getYourDataStatus = null,
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
      lastWeekRunDatas: null == lastWeekRunDatas
          ? _value.lastWeekRunDatas
          : lastWeekRunDatas // ignore: cast_nullable_to_non_nullable
              as List<BasicRunData>,
      thisWeekRunDatas: null == thisWeekRunDatas
          ? _value.thisWeekRunDatas
          : thisWeekRunDatas // ignore: cast_nullable_to_non_nullable
              as List<BasicRunData>,
      myBPMDatas: null == myBPMDatas
          ? _value.myBPMDatas
          : myBPMDatas // ignore: cast_nullable_to_non_nullable
              as List<BasicHeartRateData>,
      getYourDataStatus: null == getYourDataStatus
          ? _value.getYourDataStatus
          : getYourDataStatus // ignore: cast_nullable_to_non_nullable
              as GetYourDataStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String mess,
      int code,
      List<BasicRunData> lastWeekRunDatas,
      List<BasicRunData> thisWeekRunDatas,
      List<BasicHeartRateData> myBPMDatas,
      GetYourDataStatus getYourDataStatus});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mess = null,
    Object? code = null,
    Object? lastWeekRunDatas = null,
    Object? thisWeekRunDatas = null,
    Object? myBPMDatas = null,
    Object? getYourDataStatus = null,
  }) {
    return _then(_$HomeStateImpl(
      mess: null == mess
          ? _value.mess
          : mess // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      lastWeekRunDatas: null == lastWeekRunDatas
          ? _value._lastWeekRunDatas
          : lastWeekRunDatas // ignore: cast_nullable_to_non_nullable
              as List<BasicRunData>,
      thisWeekRunDatas: null == thisWeekRunDatas
          ? _value._thisWeekRunDatas
          : thisWeekRunDatas // ignore: cast_nullable_to_non_nullable
              as List<BasicRunData>,
      myBPMDatas: null == myBPMDatas
          ? _value._myBPMDatas
          : myBPMDatas // ignore: cast_nullable_to_non_nullable
              as List<BasicHeartRateData>,
      getYourDataStatus: null == getYourDataStatus
          ? _value.getYourDataStatus
          : getYourDataStatus // ignore: cast_nullable_to_non_nullable
              as GetYourDataStatus,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {this.mess = '',
      this.code = 200,
      final List<BasicRunData> lastWeekRunDatas = const [],
      final List<BasicRunData> thisWeekRunDatas = const [],
      final List<BasicHeartRateData> myBPMDatas = const [],
      this.getYourDataStatus = GetYourDataStatus.initial})
      : _lastWeekRunDatas = lastWeekRunDatas,
        _thisWeekRunDatas = thisWeekRunDatas,
        _myBPMDatas = myBPMDatas;

  @override
  @JsonKey()
  final String mess;
  @override
  @JsonKey()
  final int code;
  final List<BasicRunData> _lastWeekRunDatas;
  @override
  @JsonKey()
  List<BasicRunData> get lastWeekRunDatas {
    if (_lastWeekRunDatas is EqualUnmodifiableListView)
      return _lastWeekRunDatas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lastWeekRunDatas);
  }

  final List<BasicRunData> _thisWeekRunDatas;
  @override
  @JsonKey()
  List<BasicRunData> get thisWeekRunDatas {
    if (_thisWeekRunDatas is EqualUnmodifiableListView)
      return _thisWeekRunDatas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_thisWeekRunDatas);
  }

  final List<BasicHeartRateData> _myBPMDatas;
  @override
  @JsonKey()
  List<BasicHeartRateData> get myBPMDatas {
    if (_myBPMDatas is EqualUnmodifiableListView) return _myBPMDatas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myBPMDatas);
  }

  @override
  @JsonKey()
  final GetYourDataStatus getYourDataStatus;

  @override
  String toString() {
    return 'HomeState(mess: $mess, code: $code, lastWeekRunDatas: $lastWeekRunDatas, thisWeekRunDatas: $thisWeekRunDatas, myBPMDatas: $myBPMDatas, getYourDataStatus: $getYourDataStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.mess, mess) || other.mess == mess) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality()
                .equals(other._lastWeekRunDatas, _lastWeekRunDatas) &&
            const DeepCollectionEquality()
                .equals(other._thisWeekRunDatas, _thisWeekRunDatas) &&
            const DeepCollectionEquality()
                .equals(other._myBPMDatas, _myBPMDatas) &&
            (identical(other.getYourDataStatus, getYourDataStatus) ||
                other.getYourDataStatus == getYourDataStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      mess,
      code,
      const DeepCollectionEquality().hash(_lastWeekRunDatas),
      const DeepCollectionEquality().hash(_thisWeekRunDatas),
      const DeepCollectionEquality().hash(_myBPMDatas),
      getYourDataStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {final String mess,
      final int code,
      final List<BasicRunData> lastWeekRunDatas,
      final List<BasicRunData> thisWeekRunDatas,
      final List<BasicHeartRateData> myBPMDatas,
      final GetYourDataStatus getYourDataStatus}) = _$HomeStateImpl;

  @override
  String get mess;
  @override
  int get code;
  @override
  List<BasicRunData> get lastWeekRunDatas;
  @override
  List<BasicRunData> get thisWeekRunDatas;
  @override
  List<BasicHeartRateData> get myBPMDatas;
  @override
  GetYourDataStatus get getYourDataStatus;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
