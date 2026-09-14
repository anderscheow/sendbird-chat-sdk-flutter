// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mute_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MuteInfo _$MuteInfoFromJson(Map<String, dynamic> json) => MuteInfo(
      isMuted: json['isMuted'] as bool,
      description: json['description'] as String?,
      startAt: (json['startAt'] as num?)?.toInt(),
      endAt: (json['endAt'] as num?)?.toInt(),
      remainingDuration: (json['remainingDuration'] as num?)?.toInt(),
    );
