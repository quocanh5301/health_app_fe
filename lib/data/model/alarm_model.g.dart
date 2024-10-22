// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlarmModelImpl _$$AlarmModelImplFromJson(Map<String, dynamic> json) =>
    _$AlarmModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? "",
      note: json['note'] as String? ?? "",
      dateTime: json['dateTime'] as String? ?? "",
      isActive: json['isActive'] as bool? ?? true,
      volume: (json['volume'] as num?)?.toDouble() ?? 0.5,
      loopAudio: json['loopAudio'] as bool? ?? true,
      vibrate: json['vibrate'] as bool? ?? true,
      audio: json['audio'] as String? ?? "assets/audio_nature_sounds.mp3",
      repeatOption:
          $enumDecodeNullable(_$RepeatOptionEnumMap, json['repeatOption']) ??
              RepeatOption.once,
      customDays: (json['customDays'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AlarmModelImplToJson(_$AlarmModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'note': instance.note,
      'dateTime': instance.dateTime,
      'isActive': instance.isActive,
      'volume': instance.volume,
      'loopAudio': instance.loopAudio,
      'vibrate': instance.vibrate,
      'audio': instance.audio,
      'repeatOption': _$RepeatOptionEnumMap[instance.repeatOption]!,
      'customDays': instance.customDays,
    };

const _$RepeatOptionEnumMap = {
  RepeatOption.daily: 'daily',
  RepeatOption.monFri: 'monFri',
  RepeatOption.once: 'once',
  RepeatOption.custom: 'custom',
};
