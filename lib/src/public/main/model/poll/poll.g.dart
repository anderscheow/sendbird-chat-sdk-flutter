// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Poll _$PollFromJson(Map<String, dynamic> json) => Poll(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String? ?? '',
      createdAt: (json['createdAt'] as num).toInt(),
      updatedAt: (json['updatedAt'] as num).toInt(),
      closeAt: (json['closeAt'] as num).toInt(),
      status: $enumDecode(_$PollStatusEnumMap, json['status']),
      messageId: (json['messageId'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : PollData.fromJson(json['data'] as Map<String, dynamic>),
      voterCount: (json['voterCount'] as num?)?.toInt() ?? -1,
      options: (json['options'] as List<dynamic>?)
              ?.map((e) => PollOption.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdBy: json['createdBy'] as String?,
      allowUserSuggestion: json['allowUserSuggestion'] as bool? ?? false,
      allowMultipleVotes: json['allowMultipleVotes'] as bool? ?? false,
      votedPollOptionIds: (json['voted_option_ids'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
    );

Map<String, dynamic> _$PollToJson(Poll instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'closeAt': instance.closeAt,
      'status': _$PollStatusEnumMap[instance.status]!,
      'messageId': instance.messageId,
      'data': instance.data,
      'voterCount': instance.voterCount,
      'options': instance.options,
      'createdBy': instance.createdBy,
      'allowUserSuggestion': instance.allowUserSuggestion,
      'allowMultipleVotes': instance.allowMultipleVotes,
      'voted_option_ids': instance.votedPollOptionIds,
    };

const _$PollStatusEnumMap = {
  PollStatus.open: 'open',
  PollStatus.closed: 'closed',
};
