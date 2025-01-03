// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMessage _$UserMessageFromJson(Map<String, dynamic> json) => UserMessage(
      channelUrl: json['channel_url'] as String,
      channelType: $enumDecodeNullable(
              _$ChannelTypeEnumMap, json['channel_type'],
              unknownValue: ChannelType.group) ??
          ChannelType.group,
      messageId: (json['message_id'] as num?)?.toInt() ?? 0,
      message: json['message'] as String,
      translations: (json['translations'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          {},
      sender: json['user'] == null
          ? null
          : Sender.fromJson(json['user'] as Map<String, dynamic>),
      sendingStatus:
          $enumDecodeNullable(_$SendingStatusEnumMap, json['sending_status']),
      requestId: json['request_id'] as String?,
      mentionedUsers: (json['mentioned_users'] as List<dynamic>?)
              ?.map((e) => User.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      mentionType: $enumDecodeNullable(
              _$MentionTypeEnumMap, json['mention_type'],
              unknownValue: MentionType.users) ??
          MentionType.users,
      createdAt: (json['created_at'] as num?)?.toInt() ?? 0,
      updatedAt: (json['updated_at'] as num?)?.toInt() ?? 0,
      parentMessageId: (json['parent_message_id'] as num?)?.toInt(),
      threadInfo: json['thread_info'] == null
          ? null
          : ThreadInfo.fromJson(json['thread_info'] as Map<String, dynamic>),
      customType: json['custom_type'] as String?,
      messageSurvivalSeconds:
          (json['message_survival_seconds'] as num?)?.toInt() ?? -1,
      forceUpdateLastMessage:
          json['force_update_last_message'] as bool? ?? false,
      isSilent: json['silent'] as bool? ?? false,
      isOperatorMessage: json['is_op_msg'] as bool? ?? false,
      data: TypeChecker.fromJsonToNullableString(json['data']),
      ogMetaData: json['og_tag'] == null
          ? null
          : OGMetaData.fromJson(json['og_tag'] as Map<String, dynamic>),
      reactions: (json['reactions'] as List<dynamic>?)
              ?.map((e) => Reaction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      parentMessage: json['parent_message_info'] as Map<String, dynamic>?,
      poll: json['poll'] == null
          ? null
          : Poll.fromJson(json['poll'] as Map<String, dynamic>),
      translationTargetLanguages:
          (json['translation_target_languages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
    )
      ..allMetaArrays = (json['sorted_metaarray'] as List<dynamic>?)
          ?.map((e) => MessageMetaArray.fromJson(e as Map<String, dynamic>))
          .toList()
      ..extendedMessage =
          json['extended_message'] as Map<String, dynamic>? ?? {}
      ..isReplyToChannel = json['is_reply_to_channel'] as bool? ?? false
      ..errorCode = (json['error_code'] as num?)?.toInt();

Map<String, dynamic> _$UserMessageToJson(UserMessage instance) =>
    <String, dynamic>{
      'channel_url': instance.channelUrl,
      'channel_type': _$ChannelTypeEnumMap[instance.channelType]!,
      'data': instance.data,
      'custom_type': instance.customType,
      'mention_type': _$MentionTypeEnumMap[instance.mentionType]!,
      'mentioned_users': instance.mentionedUsers,
      'sorted_metaarray': instance.allMetaArrays,
      'extended_message': instance.extendedMessage,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'message_id': instance.messageId,
      'request_id': instance.requestId,
      'message': instance.message,
      'sending_status': _$SendingStatusEnumMap[instance.sendingStatus],
      'is_reply_to_channel': instance.isReplyToChannel,
      'parent_message_id': instance.parentMessageId,
      'parent_message_info': instance.parentMessage,
      'thread_info': instance.threadInfo,
      'message_survival_seconds': instance.messageSurvivalSeconds,
      'silent': instance.isSilent,
      'error_code': instance.errorCode,
      'is_op_msg': instance.isOperatorMessage,
      'og_tag': instance.ogMetaData,
      'reactions': instance.reactions,
      'force_update_last_message': instance.forceUpdateLastMessage,
      'user': instance.sender,
      'translations': instance.translations,
      'translation_target_languages': instance.translationTargetLanguages,
      'poll': instance.poll,
    };

const _$ChannelTypeEnumMap = {
  ChannelType.group: 'group',
  ChannelType.open: 'open',
  ChannelType.feed: 'feed',
};

const _$SendingStatusEnumMap = {
  SendingStatus.none: 'none',
  SendingStatus.pending: 'pending',
  SendingStatus.failed: 'failed',
  SendingStatus.succeeded: 'succeeded',
  SendingStatus.canceled: 'canceled',
};

const _$MentionTypeEnumMap = {
  MentionType.users: 'users',
  MentionType.channel: 'channel',
};
