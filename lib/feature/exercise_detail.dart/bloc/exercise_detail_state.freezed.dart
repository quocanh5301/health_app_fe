// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExerciseDetailState {
  ExerciseDetailModel get exerciseDetail => throw _privateConstructorUsedError;
  String get mess => throw _privateConstructorUsedError;
  GetExerciseDetailStatus get getExerciseDetailStatus =>
      throw _privateConstructorUsedError;
  MarkFavoriteExerciseStatus get markFavoriteExerciseStatus =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExerciseDetailStateCopyWith<ExerciseDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseDetailStateCopyWith<$Res> {
  factory $ExerciseDetailStateCopyWith(
          ExerciseDetailState value, $Res Function(ExerciseDetailState) then) =
      _$ExerciseDetailStateCopyWithImpl<$Res, ExerciseDetailState>;
  @useResult
  $Res call(
      {ExerciseDetailModel exerciseDetail,
      String mess,
      GetExerciseDetailStatus getExerciseDetailStatus,
      MarkFavoriteExerciseStatus markFavoriteExerciseStatus});

  $ExerciseDetailModelCopyWith<$Res> get exerciseDetail;
}

/// @nodoc
class _$ExerciseDetailStateCopyWithImpl<$Res, $Val extends ExerciseDetailState>
    implements $ExerciseDetailStateCopyWith<$Res> {
  _$ExerciseDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseDetail = null,
    Object? mess = null,
    Object? getExerciseDetailStatus = null,
    Object? markFavoriteExerciseStatus = null,
  }) {
    return _then(_value.copyWith(
      exerciseDetail: null == exerciseDetail
          ? _value.exerciseDetail
          : exerciseDetail // ignore: cast_nullable_to_non_nullable
              as ExerciseDetailModel,
      mess: null == mess
          ? _value.mess
          : mess // ignore: cast_nullable_to_non_nullable
              as String,
      getExerciseDetailStatus: null == getExerciseDetailStatus
          ? _value.getExerciseDetailStatus
          : getExerciseDetailStatus // ignore: cast_nullable_to_non_nullable
              as GetExerciseDetailStatus,
      markFavoriteExerciseStatus: null == markFavoriteExerciseStatus
          ? _value.markFavoriteExerciseStatus
          : markFavoriteExerciseStatus // ignore: cast_nullable_to_non_nullable
              as MarkFavoriteExerciseStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ExerciseDetailModelCopyWith<$Res> get exerciseDetail {
    return $ExerciseDetailModelCopyWith<$Res>(_value.exerciseDetail, (value) {
      return _then(_value.copyWith(exerciseDetail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExerciseDetailStateImplCopyWith<$Res>
    implements $ExerciseDetailStateCopyWith<$Res> {
  factory _$$ExerciseDetailStateImplCopyWith(_$ExerciseDetailStateImpl value,
          $Res Function(_$ExerciseDetailStateImpl) then) =
      __$$ExerciseDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ExerciseDetailModel exerciseDetail,
      String mess,
      GetExerciseDetailStatus getExerciseDetailStatus,
      MarkFavoriteExerciseStatus markFavoriteExerciseStatus});

  @override
  $ExerciseDetailModelCopyWith<$Res> get exerciseDetail;
}

/// @nodoc
class __$$ExerciseDetailStateImplCopyWithImpl<$Res>
    extends _$ExerciseDetailStateCopyWithImpl<$Res, _$ExerciseDetailStateImpl>
    implements _$$ExerciseDetailStateImplCopyWith<$Res> {
  __$$ExerciseDetailStateImplCopyWithImpl(_$ExerciseDetailStateImpl _value,
      $Res Function(_$ExerciseDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseDetail = null,
    Object? mess = null,
    Object? getExerciseDetailStatus = null,
    Object? markFavoriteExerciseStatus = null,
  }) {
    return _then(_$ExerciseDetailStateImpl(
      exerciseDetail: null == exerciseDetail
          ? _value.exerciseDetail
          : exerciseDetail // ignore: cast_nullable_to_non_nullable
              as ExerciseDetailModel,
      mess: null == mess
          ? _value.mess
          : mess // ignore: cast_nullable_to_non_nullable
              as String,
      getExerciseDetailStatus: null == getExerciseDetailStatus
          ? _value.getExerciseDetailStatus
          : getExerciseDetailStatus // ignore: cast_nullable_to_non_nullable
              as GetExerciseDetailStatus,
      markFavoriteExerciseStatus: null == markFavoriteExerciseStatus
          ? _value.markFavoriteExerciseStatus
          : markFavoriteExerciseStatus // ignore: cast_nullable_to_non_nullable
              as MarkFavoriteExerciseStatus,
    ));
  }
}

/// @nodoc

class _$ExerciseDetailStateImpl implements _ExerciseDetailState {
  const _$ExerciseDetailStateImpl(
      {this.exerciseDetail = const ExerciseDetailModel(),
      this.mess = "",
      this.getExerciseDetailStatus = GetExerciseDetailStatus.initial,
      this.markFavoriteExerciseStatus = MarkFavoriteExerciseStatus.initial});

  @override
  @JsonKey()
  final ExerciseDetailModel exerciseDetail;
  @override
  @JsonKey()
  final String mess;
  @override
  @JsonKey()
  final GetExerciseDetailStatus getExerciseDetailStatus;
  @override
  @JsonKey()
  final MarkFavoriteExerciseStatus markFavoriteExerciseStatus;

  @override
  String toString() {
    return 'ExerciseDetailState(exerciseDetail: $exerciseDetail, mess: $mess, getExerciseDetailStatus: $getExerciseDetailStatus, markFavoriteExerciseStatus: $markFavoriteExerciseStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseDetailStateImpl &&
            (identical(other.exerciseDetail, exerciseDetail) ||
                other.exerciseDetail == exerciseDetail) &&
            (identical(other.mess, mess) || other.mess == mess) &&
            (identical(
                    other.getExerciseDetailStatus, getExerciseDetailStatus) ||
                other.getExerciseDetailStatus == getExerciseDetailStatus) &&
            (identical(other.markFavoriteExerciseStatus,
                    markFavoriteExerciseStatus) ||
                other.markFavoriteExerciseStatus ==
                    markFavoriteExerciseStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exerciseDetail, mess,
      getExerciseDetailStatus, markFavoriteExerciseStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseDetailStateImplCopyWith<_$ExerciseDetailStateImpl> get copyWith =>
      __$$ExerciseDetailStateImplCopyWithImpl<_$ExerciseDetailStateImpl>(
          this, _$identity);
}

abstract class _ExerciseDetailState implements ExerciseDetailState {
  const factory _ExerciseDetailState(
          {final ExerciseDetailModel exerciseDetail,
          final String mess,
          final GetExerciseDetailStatus getExerciseDetailStatus,
          final MarkFavoriteExerciseStatus markFavoriteExerciseStatus}) =
      _$ExerciseDetailStateImpl;

  @override
  ExerciseDetailModel get exerciseDetail;
  @override
  String get mess;
  @override
  GetExerciseDetailStatus get getExerciseDetailStatus;
  @override
  MarkFavoriteExerciseStatus get markFavoriteExerciseStatus;
  @override
  @JsonKey(ignore: true)
  _$$ExerciseDetailStateImplCopyWith<_$ExerciseDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
