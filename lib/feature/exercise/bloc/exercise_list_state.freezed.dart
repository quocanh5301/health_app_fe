// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExerciseListState {
  List<ExerciseModel> get exercises => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  String get filterType =>
      throw _privateConstructorUsedError; // muscle group , difficulty , all
  String get filterValue => throw _privateConstructorUsedError;
  String get mess => throw _privateConstructorUsedError;
  GetExerciseStatus get getExerciseStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExerciseListStateCopyWith<ExerciseListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseListStateCopyWith<$Res> {
  factory $ExerciseListStateCopyWith(
          ExerciseListState value, $Res Function(ExerciseListState) then) =
      _$ExerciseListStateCopyWithImpl<$Res, ExerciseListState>;
  @useResult
  $Res call(
      {List<ExerciseModel> exercises,
      int page,
      String filterType,
      String filterValue,
      String mess,
      GetExerciseStatus getExerciseStatus});
}

/// @nodoc
class _$ExerciseListStateCopyWithImpl<$Res, $Val extends ExerciseListState>
    implements $ExerciseListStateCopyWith<$Res> {
  _$ExerciseListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exercises = null,
    Object? page = null,
    Object? filterType = null,
    Object? filterValue = null,
    Object? mess = null,
    Object? getExerciseStatus = null,
  }) {
    return _then(_value.copyWith(
      exercises: null == exercises
          ? _value.exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<ExerciseModel>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      filterType: null == filterType
          ? _value.filterType
          : filterType // ignore: cast_nullable_to_non_nullable
              as String,
      filterValue: null == filterValue
          ? _value.filterValue
          : filterValue // ignore: cast_nullable_to_non_nullable
              as String,
      mess: null == mess
          ? _value.mess
          : mess // ignore: cast_nullable_to_non_nullable
              as String,
      getExerciseStatus: null == getExerciseStatus
          ? _value.getExerciseStatus
          : getExerciseStatus // ignore: cast_nullable_to_non_nullable
              as GetExerciseStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExerciseListStateImplCopyWith<$Res>
    implements $ExerciseListStateCopyWith<$Res> {
  factory _$$ExerciseListStateImplCopyWith(_$ExerciseListStateImpl value,
          $Res Function(_$ExerciseListStateImpl) then) =
      __$$ExerciseListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ExerciseModel> exercises,
      int page,
      String filterType,
      String filterValue,
      String mess,
      GetExerciseStatus getExerciseStatus});
}

/// @nodoc
class __$$ExerciseListStateImplCopyWithImpl<$Res>
    extends _$ExerciseListStateCopyWithImpl<$Res, _$ExerciseListStateImpl>
    implements _$$ExerciseListStateImplCopyWith<$Res> {
  __$$ExerciseListStateImplCopyWithImpl(_$ExerciseListStateImpl _value,
      $Res Function(_$ExerciseListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exercises = null,
    Object? page = null,
    Object? filterType = null,
    Object? filterValue = null,
    Object? mess = null,
    Object? getExerciseStatus = null,
  }) {
    return _then(_$ExerciseListStateImpl(
      exercises: null == exercises
          ? _value._exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<ExerciseModel>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      filterType: null == filterType
          ? _value.filterType
          : filterType // ignore: cast_nullable_to_non_nullable
              as String,
      filterValue: null == filterValue
          ? _value.filterValue
          : filterValue // ignore: cast_nullable_to_non_nullable
              as String,
      mess: null == mess
          ? _value.mess
          : mess // ignore: cast_nullable_to_non_nullable
              as String,
      getExerciseStatus: null == getExerciseStatus
          ? _value.getExerciseStatus
          : getExerciseStatus // ignore: cast_nullable_to_non_nullable
              as GetExerciseStatus,
    ));
  }
}

/// @nodoc

class _$ExerciseListStateImpl implements _ExerciseListState {
  const _$ExerciseListStateImpl(
      {final List<ExerciseModel> exercises = const [],
      this.page = 1,
      this.filterType = "all",
      this.filterValue = "",
      this.mess = "",
      this.getExerciseStatus = GetExerciseStatus.initial})
      : _exercises = exercises;

  final List<ExerciseModel> _exercises;
  @override
  @JsonKey()
  List<ExerciseModel> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final String filterType;
// muscle group , difficulty , all
  @override
  @JsonKey()
  final String filterValue;
  @override
  @JsonKey()
  final String mess;
  @override
  @JsonKey()
  final GetExerciseStatus getExerciseStatus;

  @override
  String toString() {
    return 'ExerciseListState(exercises: $exercises, page: $page, filterType: $filterType, filterValue: $filterValue, mess: $mess, getExerciseStatus: $getExerciseStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseListStateImpl &&
            const DeepCollectionEquality()
                .equals(other._exercises, _exercises) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.filterType, filterType) ||
                other.filterType == filterType) &&
            (identical(other.filterValue, filterValue) ||
                other.filterValue == filterValue) &&
            (identical(other.mess, mess) || other.mess == mess) &&
            (identical(other.getExerciseStatus, getExerciseStatus) ||
                other.getExerciseStatus == getExerciseStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_exercises),
      page,
      filterType,
      filterValue,
      mess,
      getExerciseStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseListStateImplCopyWith<_$ExerciseListStateImpl> get copyWith =>
      __$$ExerciseListStateImplCopyWithImpl<_$ExerciseListStateImpl>(
          this, _$identity);
}

abstract class _ExerciseListState implements ExerciseListState {
  const factory _ExerciseListState(
      {final List<ExerciseModel> exercises,
      final int page,
      final String filterType,
      final String filterValue,
      final String mess,
      final GetExerciseStatus getExerciseStatus}) = _$ExerciseListStateImpl;

  @override
  List<ExerciseModel> get exercises;
  @override
  int get page;
  @override
  String get filterType;
  @override // muscle group , difficulty , all
  String get filterValue;
  @override
  String get mess;
  @override
  GetExerciseStatus get getExerciseStatus;
  @override
  @JsonKey(ignore: true)
  _$$ExerciseListStateImplCopyWith<_$ExerciseListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
