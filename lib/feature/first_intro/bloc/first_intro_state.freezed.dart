// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'first_intro_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FirstIntroState {
  int get tabIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FirstIntroStateCopyWith<FirstIntroState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirstIntroStateCopyWith<$Res> {
  factory $FirstIntroStateCopyWith(
          FirstIntroState value, $Res Function(FirstIntroState) then) =
      _$FirstIntroStateCopyWithImpl<$Res, FirstIntroState>;
  @useResult
  $Res call({int tabIndex});
}

/// @nodoc
class _$FirstIntroStateCopyWithImpl<$Res, $Val extends FirstIntroState>
    implements $FirstIntroStateCopyWith<$Res> {
  _$FirstIntroStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabIndex = null,
  }) {
    return _then(_value.copyWith(
      tabIndex: null == tabIndex
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FirstIntroStateImplCopyWith<$Res>
    implements $FirstIntroStateCopyWith<$Res> {
  factory _$$FirstIntroStateImplCopyWith(_$FirstIntroStateImpl value,
          $Res Function(_$FirstIntroStateImpl) then) =
      __$$FirstIntroStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int tabIndex});
}

/// @nodoc
class __$$FirstIntroStateImplCopyWithImpl<$Res>
    extends _$FirstIntroStateCopyWithImpl<$Res, _$FirstIntroStateImpl>
    implements _$$FirstIntroStateImplCopyWith<$Res> {
  __$$FirstIntroStateImplCopyWithImpl(
      _$FirstIntroStateImpl _value, $Res Function(_$FirstIntroStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabIndex = null,
  }) {
    return _then(_$FirstIntroStateImpl(
      tabIndex: null == tabIndex
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FirstIntroStateImpl implements _FirstIntroState {
  const _$FirstIntroStateImpl({this.tabIndex = 0});

  @override
  @JsonKey()
  final int tabIndex;

  @override
  String toString() {
    return 'FirstIntroState(tabIndex: $tabIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirstIntroStateImpl &&
            (identical(other.tabIndex, tabIndex) ||
                other.tabIndex == tabIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tabIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FirstIntroStateImplCopyWith<_$FirstIntroStateImpl> get copyWith =>
      __$$FirstIntroStateImplCopyWithImpl<_$FirstIntroStateImpl>(
          this, _$identity);
}

abstract class _FirstIntroState implements FirstIntroState {
  const factory _FirstIntroState({final int tabIndex}) = _$FirstIntroStateImpl;

  @override
  int get tabIndex;
  @override
  @JsonKey(ignore: true)
  _$$FirstIntroStateImplCopyWith<_$FirstIntroStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
