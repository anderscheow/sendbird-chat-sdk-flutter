// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PollOption _$PollOptionFromJson(Map<String, dynamic> json) => PollOption(
      pollId: (json['pollId'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      text: json['text'] as String,
      createdBy: json['createdBy'] as String?,
      createdAt: (json['createdAt'] as num).toInt(),
      voteCount: (json['voteCount'] as num).toInt(),
      updatedAt: (json['updatedAt'] as num).toInt(),
    );

Map<String, dynamic> _$PollOptionToJson(PollOption instance) =>
    <String, dynamic>{
      'pollId': instance.pollId,
      'id': instance.id,
      'text': instance.text,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt,
      'voteCount': instance.voteCount,
      'updatedAt': instance.updatedAt,
    };
