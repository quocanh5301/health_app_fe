// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alarm_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AlarmModel _$AlarmModelFromJson(Map<String, dynamic> json) {
  return _AlarmModel.fromJson(json);
}

/// @nodoc
mixin _$AlarmModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  String get dateTime =>
      throw _privateConstructorUsedError; // Format: dd/MM/yyyy HH:mm:ss
  bool get isActive => throw _privateConstructorUsedError;
  double get volume => throw _privateConstructorUsedError;
  bool get loopAudio => throw _privateConstructorUsedError;
  bool get vibrate => throw _privateConstructorUsedError;
  String get audio => throw _privateConstructorUsedError;
  RepeatOption get repeatOption => throw _privateConstructorUsedError;
  List<int> get customDays => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlarmModelCopyWith<AlarmModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlarmModelCopyWith<$Res> {
  factory $AlarmModelCopyWith(
          AlarmModel value, $Res Function(AlarmModel) then) =
      _$AlarmModelCopyWithImpl<$Res, AlarmModel>;
  @useResult
  $Res call(
      {int id,
      String title,
      String note,
      String dateTime,
      bool isActive,
      double volume,
      bool loopAudio,
      bool vibrate,
      String audio,
      RepeatOption repeatOption,
      List<int> customDays});
}

/// @nodoc
class _$AlarmModelCopyWithImpl<$Res, $Val extends AlarmModel>
    implements $AlarmModelCopyWith<$Res> {
  _$AlarmModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? note = null,
    Object? dateTime = null,
    Object? isActive = null,
    Object? volume = null,
    Object? loopAudio = null,
    Object? vibrate = null,
    Object? audio = null,
    Object? repeatOption = null,
    Object? customDays = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
      loopAudio: null == loopAudio
          ? _value.loopAudio
          : loopAudio // ignore: cast_nullable_to_non_nullable
              as bool,
      vibrate: null == vibrate
          ? _value.vibrate
          : vibrate // ignore: cast_nullable_to_non_nullable
              as bool,
      audio: null == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String,
      repeatOption: null == repeatOption
          ? _value.repeatOption
          : repeatOption // ignore: cast_nullable_to_non_nullable
              as RepeatOption,
      customDays: null == customDays
          ? _value.customDays
          : customDays // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlarmModelImplCopyWith<$Res>
    implements $AlarmModelCopyWith<$Res> {
  factory _$$AlarmModelImplCopyWith(
          _$AlarmModelImpl value, $Res Function(_$AlarmModelImpl) then) =
      __$$AlarmModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String note,
      String dateTime,
      bool isActive,
      double volume,
      bool loopAudio,
      bool vibrate,
      String audio,
      RepeatOption repeatOption,
      List<int> customDays});
}

/// @nodoc
class __$$AlarmModelImplCopyWithImpl<$Res>
    extends _$AlarmModelCopyWithImpl<$Res, _$AlarmModelImpl>
    implements _$$AlarmModelImplCopyWith<$Res> {
  __$$AlarmModelImplCopyWithImpl(
      _$AlarmModelImpl _value, $Res Function(_$AlarmModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? note = null,
    Object? dateTime = null,
    Object? isActive = null,
    Object? volume = null,
    Object? loopAudio = null,
    Object? vibrate = null,
    Object? audio = null,
    Object? repeatOption = null,
    Object? customDays = null,
  }) {
    return _then(_$AlarmModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
      loopAudio: null == loopAudio
          ? _value.loopAudio
          : loopAudio // ignore: cast_nullable_to_non_nullable
              as bool,
      vibrate: null == vibrate
          ? _value.vibrate
          : vibrate // ignore: cast_nullable_to_non_nullable
              as bool,
      audio: null == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String,
      repeatOption: null == repeatOption
          ? _value.repeatOption
          : repeatOption // ignore: cast_nullable_to_non_nullable
              as RepeatOption,
      customDays: null == customDays
          ? _value._customDays
          : customDays // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlarmModelImpl implements _AlarmModel {
  const _$AlarmModelImpl(
      {this.id = 0,
      this.title = "",
      this.note = "",
      this.dateTime = "",
      this.isActive = true,
      this.volume = 0.5,
      this.loopAudio = true,
      this.vibrate = true,
      this.audio = "assets/audio_nature_sounds.mp3",
      this.repeatOption = RepeatOption.once,
      final List<int> customDays = const []})
      : _customDays = customDays;

  factory _$AlarmModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlarmModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String note;
  @override
  @JsonKey()
  final String dateTime;
// Format: dd/MM/yyyy HH:mm:ss
  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final double volume;
  @override
  @JsonKey()
  final bool loopAudio;
  @override
  @JsonKey()
  final bool vibrate;
  @override
  @JsonKey()
  final String audio;
  @override
  @JsonKey()
  final RepeatOption repeatOption;
  final List<int> _customDays;
  @override
  @JsonKey()
  List<int> get customDays {
    if (_customDays is EqualUnmodifiableListView) return _customDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customDays);
  }

  @override
  String toString() {
    return 'AlarmModel(id: $id, title: $title, note: $note, dateTime: $dateTime, isActive: $isActive, volume: $volume, loopAudio: $loopAudio, vibrate: $vibrate, audio: $audio, repeatOption: $repeatOption, customDays: $customDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlarmModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.loopAudio, loopAudio) ||
                other.loopAudio == loopAudio) &&
            (identical(other.vibrate, vibrate) || other.vibrate == vibrate) &&
            (identical(other.audio, audio) || other.audio == audio) &&
            (identical(other.repeatOption, repeatOption) ||
                other.repeatOption == repeatOption) &&
            const DeepCollectionEquality()
                .equals(other._customDays, _customDays));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      note,
      dateTime,
      isActive,
      volume,
      loopAudio,
      vibrate,
      audio,
      repeatOption,
      const DeepCollectionEquality().hash(_customDays));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlarmModelImplCopyWith<_$AlarmModelImpl> get copyWith =>
      __$$AlarmModelImplCopyWithImpl<_$AlarmModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlarmModelImplToJson(
      this,
    );
  }
}

abstract class _AlarmModel implements AlarmModel {
  const factory _AlarmModel(
      {final int id,
      final String title,
      final String note,
      final String dateTime,
      final bool isActive,
      final double volume,
      final bool loopAudio,
      final bool vibrate,
      final String audio,
      final RepeatOption repeatOption,
      final List<int> customDays}) = _$AlarmModelImpl;

  factory _AlarmModel.fromJson(Map<String, dynamic> json) =
      _$AlarmModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get note;
  @override
  String get dateTime;
  @override // Format: dd/MM/yyyy HH:mm:ss
  bool get isActive;
  @override
  double get volume;
  @override
  bool get loopAudio;
  @override
  bool get vibrate;
  @override
  String get audio;
  @override
  RepeatOption get repeatOption;
  @override
  List<int> get customDays;
  @override
  @JsonKey(ignore: true)
  _$$AlarmModelImplCopyWith<_$AlarmModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
