// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenChannel _$OpenChannelFromJson(Map<String, dynamic> json) => OpenChannel(
      participantCount: (json['participantCount'] as num).toInt(),
      operators: (json['operators'] as List<dynamic>?)
              ?.map((e) => User.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      channelUrl: json['channelUrl'] as String,
      name: json['name'] as String? ?? '',
      coverUrl: json['coverUrl'] as String? ?? '',
      createdAt: (json['createdAt'] as num?)?.toInt(),
      data: json['data'] as String? ?? '',
      customType: json['customType'] as String? ?? '',
      isFrozen: json['freeze'] as bool? ?? false,
      isEphemeral: json['isEphemeral'] as bool? ?? false,
    );

Map<String, dynamic> _$OpenChannelToJson(OpenChannel instance) =>
    <String, dynamic>{
      'channelUrl': instance.channelUrl,
      'name': instance.name,
      'createdAt': instance.createdAt,
      'coverUrl': instance.coverUrl,
      'data': instance.data,
      'customType': instance.customType,
      'freeze': instance.isFrozen,
      'isEphemeral': instance.isEphemeral,
      'participantCount': instance.participantCount,
      'operators': instance.operators,
    };
