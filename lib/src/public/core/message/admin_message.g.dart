// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminMessage _$AdminMessageFromJson(Map<String, dynamic> json) => AdminMessage(
      channelUrl: json['channelUrl'] as String,
      channelType: $enumDecodeNullable(
              _$ChannelTypeEnumMap, json['channelType'],
              unknownValue: ChannelType.group) ??
          ChannelType.group,
      messageId: (json['messageId'] as num?)?.toInt() ?? 0,
      message: json['message'] as String,
      sendingStatus:
          $enumDecodeNullable(_$SendingStatusEnumMap, json['sendingStatus']),
      requestId: json['requestId'] as String?,
      mentionedUsers: (json['mentionedUsers'] as List<dynamic>?)
              ?.map((e) => User.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      mentionType: $enumDecodeNullable(
              _$MentionTypeEnumMap, json['mentionType'],
              unknownValue: MentionType.users) ??
          MentionType.users,
      createdAt: (json['createdAt'] as num?)?.toInt() ?? 0,
      updatedAt: (json['updatedAt'] as num?)?.toInt() ?? 0,
      parentMessageId: (json['parentMessageId'] as num?)?.toInt(),
      parentMessage: json['parent_message_info'] as Map<String, dynamic>?,
      threadInfo: json['threadInfo'] == null
          ? null
          : ThreadInfo.fromJson(json['threadInfo'] as Map<String, dynamic>),
      customType: json['customType'] as String?,
      messageSurvivalSeconds:
          (json['messageSurvivalSeconds'] as num?)?.toInt() ?? -1,
      forceUpdateLastMessage: json['forceUpdateLastMessage'] as bool? ?? false,
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
      extendedMessage: json['extended_message'] as Map<String, dynamic>? ?? {},
    )
      ..allMetaArrays = (json['sorted_metaarray'] as List<dynamic>?)
          ?.map((e) => MessageMetaArray.fromJson(e as Map<String, dynamic>))
          .toList()
      ..isReplyToChannel = json['is_reply_to_channel'] as bool? ?? false
      ..errorCode = (json['errorCode'] as num?)?.toInt()
      ..sender = json['user'] == null
          ? null
          : Sender.fromJson(json['user'] as Map<String, dynamic>);

Map<String, dynamic> _$AdminMessageToJson(AdminMessage instance) =>
    <String, dynamic>{
      'channelUrl': instance.channelUrl,
      'channelType': _$ChannelTypeEnumMap[instance.channelType]!,
      'data': instance.data,
      'customType': instance.customType,
      'mentionType': _$MentionTypeEnumMap[instance.mentionType]!,
      'mentionedUsers': instance.mentionedUsers,
      'sorted_metaarray': instance.allMetaArrays,
      'extended_message': instance.extendedMessage,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'messageId': instance.messageId,
      'requestId': instance.requestId,
      'message': instance.message,
      'sendingStatus': _$SendingStatusEnumMap[instance.sendingStatus],
      'is_reply_to_channel': instance.isReplyToChannel,
      'parentMessageId': instance.parentMessageId,
      'parent_message_info': instance.parentMessage,
      'threadInfo': instance.threadInfo,
      'messageSurvivalSeconds': instance.messageSurvivalSeconds,
      'silent': instance.isSilent,
      'errorCode': instance.errorCode,
      'is_op_msg': instance.isOperatorMessage,
      'og_tag': instance.ogMetaData,
      'reactions': instance.reactions,
      'forceUpdateLastMessage': instance.forceUpdateLastMessage,
      'user': instance.sender,
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
