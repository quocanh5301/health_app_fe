// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark_exercise_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookmarkExerciseState {
  List<ExerciseModel> get bookmarkExercises =>
      throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  String get mess => throw _privateConstructorUsedError;
  GetBookmarkExerciseStatus get getBookmarkExerciseStatus =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookmarkExerciseStateCopyWith<BookmarkExerciseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarkExerciseStateCopyWith<$Res> {
  factory $BookmarkExerciseStateCopyWith(BookmarkExerciseState value,
          $Res Function(BookmarkExerciseState) then) =
      _$BookmarkExerciseStateCopyWithImpl<$Res, BookmarkExerciseState>;
  @useResult
  $Res call(
      {List<ExerciseModel> bookmarkExercises,
      int page,
      String mess,
      GetBookmarkExerciseStatus getBookmarkExerciseStatus});
}

/// @nodoc
class _$BookmarkExerciseStateCopyWithImpl<$Res,
        $Val extends BookmarkExerciseState>
    implements $BookmarkExerciseStateCopyWith<$Res> {
  _$BookmarkExerciseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmarkExercises = null,
    Object? page = null,
    Object? mess = null,
    Object? getBookmarkExerciseStatus = null,
  }) {
    return _then(_value.copyWith(
      bookmarkExercises: null == bookmarkExercises
          ? _value.bookmarkExercises
          : bookmarkExercises // ignore: cast_nullable_to_non_nullable
              as List<ExerciseModel>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      mess: null == mess
          ? _value.mess
          : mess // ignore: cast_nullable_to_non_nullable
              as String,
      getBookmarkExerciseStatus: null == getBookmarkExerciseStatus
          ? _value.getBookmarkExerciseStatus
          : getBookmarkExerciseStatus // ignore: cast_nullable_to_non_nullable
              as GetBookmarkExerciseStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookmarkExerciseStateImplCopyWith<$Res>
    implements $BookmarkExerciseStateCopyWith<$Res> {
  factory _$$BookmarkExerciseStateImplCopyWith(
          _$BookmarkExerciseStateImpl value,
          $Res Function(_$BookmarkExerciseStateImpl) then) =
      __$$BookmarkExerciseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ExerciseModel> bookmarkExercises,
      int page,
      String mess,
      GetBookmarkExerciseStatus getBookmarkExerciseStatus});
}

/// @nodoc
class __$$BookmarkExerciseStateImplCopyWithImpl<$Res>
    extends _$BookmarkExerciseStateCopyWithImpl<$Res,
        _$BookmarkExerciseStateImpl>
    implements _$$BookmarkExerciseStateImplCopyWith<$Res> {
  __$$BookmarkExerciseStateImplCopyWithImpl(_$BookmarkExerciseStateImpl _value,
      $Res Function(_$BookmarkExerciseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmarkExercises = null,
    Object? page = null,
    Object? mess = null,
    Object? getBookmarkExerciseStatus = null,
  }) {
    return _then(_$BookmarkExerciseStateImpl(
      bookmarkExercises: null == bookmarkExercises
          ? _value._bookmarkExercises
          : bookmarkExercises // ignore: cast_nullable_to_non_nullable
              as List<ExerciseModel>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      mess: null == mess
          ? _value.mess
          : mess // ignore: cast_nullable_to_non_nullable
              as String,
      getBookmarkExerciseStatus: null == getBookmarkExerciseStatus
          ? _value.getBookmarkExerciseStatus
          : getBookmarkExerciseStatus // ignore: cast_nullable_to_non_nullable
              as GetBookmarkExerciseStatus,
    ));
  }
}

/// @nodoc

class _$BookmarkExerciseStateImpl implements _BookmarkExerciseState {
  const _$BookmarkExerciseStateImpl(
      {final List<ExerciseModel> bookmarkExercises = const [],
      this.page = 0,
      this.mess = "",
      this.getBookmarkExerciseStatus = GetBookmarkExerciseStatus.initial})
      : _bookmarkExercises = bookmarkExercises;

  final List<ExerciseModel> _bookmarkExercises;
  @override
  @JsonKey()
  List<ExerciseModel> get bookmarkExercises {
    if (_bookmarkExercises is EqualUnmodifiableListView)
      return _bookmarkExercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookmarkExercises);
  }

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final String mess;
  @override
  @JsonKey()
  final GetBookmarkExerciseStatus getBookmarkExerciseStatus;

  @override
  String toString() {
    return 'BookmarkExerciseState(bookmarkExercises: $bookmarkExercises, page: $page, mess: $mess, getBookmarkExerciseStatus: $getBookmarkExerciseStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkExerciseStateImpl &&
            const DeepCollectionEquality()
                .equals(other._bookmarkExercises, _bookmarkExercises) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.mess, mess) || other.mess == mess) &&
            (identical(other.getBookmarkExerciseStatus,
                    getBookmarkExerciseStatus) ||
                other.getBookmarkExerciseStatus == getBookmarkExerciseStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_bookmarkExercises),
      page,
      mess,
      getBookmarkExerciseStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookmarkExerciseStateImplCopyWith<_$BookmarkExerciseStateImpl>
      get copyWith => __$$BookmarkExerciseStateImplCopyWithImpl<
          _$BookmarkExerciseStateImpl>(this, _$identity);
}

abstract class _BookmarkExerciseState implements BookmarkExerciseState {
  const factory _BookmarkExerciseState(
          {final List<ExerciseModel> bookmarkExercises,
          final int page,
          final String mess,
          final GetBookmarkExerciseStatus getBookmarkExerciseStatus}) =
      _$BookmarkExerciseStateImpl;

  @override
  List<ExerciseModel> get bookmarkExercises;
  @override
  int get page;
  @override
  String get mess;
  @override
  GetBookmarkExerciseStatus get getBookmarkExerciseStatus;
  @override
  @JsonKey(ignore: true)
  _$$BookmarkExerciseStateImplCopyWith<_$BookmarkExerciseStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
