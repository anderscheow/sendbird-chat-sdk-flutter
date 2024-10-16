// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'threaded_message_list_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThreadedMessageListParams _$ThreadedMessageListParamsFromJson(
        Map<String, dynamic> json) =>
    ThreadedMessageListParams()
      ..includeMetaArray = json['with_sorted_meta_array'] as bool
      ..includeReactions = json['includeReactions'] as bool
      ..includeThreadInfo = json['includeThreadInfo'] as bool
      ..includeParentMessageInfo = json['includeParentMessageInfo'] as bool
      ..replyType =
          $enumDecodeNullable(_$ReplyTypeEnumMap, json['include_reply_type'])
      ..previousResultSize = (json['prev_limit'] as num).toInt()
      ..nextResultSize = (json['next_limit'] as num).toInt()
      ..inclusive = json['include'] as bool
      ..reverse = json['reverse'] as bool
      ..messageType =
          $enumDecode(_$MessageTypeFilterEnumMap, json['messageType'])
      ..customType = json['customType'] as String?
      ..senderIds = (json['senderIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList();

Map<String, dynamic> _$ThreadedMessageListParamsToJson(
        ThreadedMessageListParams instance) =>
    <String, dynamic>{
      'with_sorted_meta_array': instance.includeMetaArray,
      'includeReactions': instance.includeReactions,
      'includeThreadInfo': instance.includeThreadInfo,
      'includeParentMessageInfo': instance.includeParentMessageInfo,
      'include_reply_type': _$ReplyTypeEnumMap[instance.replyType],
      'prev_limit': instance.previousResultSize,
      'next_limit': instance.nextResultSize,
      'include': instance.inclusive,
      'reverse': instance.reverse,
      'messageType': _$MessageTypeFilterEnumMap[instance.messageType]!,
      'customType': instance.customType,
      'senderIds': instance.senderIds,
    };

const _$ReplyTypeEnumMap = {
  ReplyType.none: 'none',
  ReplyType.all: 'all',
  ReplyType.onlyReplyToChannel: 'only_reply_to_channel',
};

const _$MessageTypeFilterEnumMap = {
  MessageTypeFilter.all: '',
  MessageTypeFilter.user: 'MESG',
  MessageTypeFilter.file: 'FILE',
  MessageTypeFilter.admin: 'ADMN',
};
