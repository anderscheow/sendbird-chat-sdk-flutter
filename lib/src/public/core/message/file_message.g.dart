// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileMessage _$FileMessageFromJson(Map<String, dynamic> json) => FileMessage(
      channelUrl: json['channelUrl'] as String,
      channelType: $enumDecodeNullable(
              _$ChannelTypeEnumMap, json['channelType'],
              unknownValue: ChannelType.group) ??
          ChannelType.group,
      messageId: (json['messageId'] as num?)?.toInt() ?? 0,
      url: json['url'] as String,
      name: json['name'] as String?,
      size: (json['size'] as num?)?.toInt() ?? 0,
      type: json['type'] as String?,
      thumbnails: (json['thumbnails'] as List<dynamic>?)
          ?.map((e) => Thumbnail.fromJson(e as Map<String, dynamic>))
          .toList(),
      requireAuth: json['requireAuth'] as bool? ?? false,
      requestId: json['requestId'] as String?,
      message: json['message'] as String?,
      sendingStatus:
          $enumDecodeNullable(_$SendingStatusEnumMap, json['sendingStatus']),
      sender: json['user'] == null
          ? null
          : Sender.fromJson(json['user'] as Map<String, dynamic>),
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
      parentMessage: json['parent_message_info'] as Map<String, dynamic>?,
    )
      ..allMetaArrays = (json['sorted_metaarray'] as List<dynamic>?)
          ?.map((e) => MessageMetaArray.fromJson(e as Map<String, dynamic>))
          .toList()
      ..extendedMessage =
          json['extended_message'] as Map<String, dynamic>? ?? {}
      ..isReplyToChannel = json['is_reply_to_channel'] as bool? ?? false
      ..errorCode = (json['errorCode'] as num?)?.toInt();

Map<String, dynamic> _$FileMessageToJson(FileMessage instance) =>
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
      'url': instance.url,
      'name': instance.name,
      'size': instance.size,
      'type': instance.type,
      'thumbnails': instance.thumbnails,
      'requireAuth': instance.requireAuth,
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

Thumbnail _$ThumbnailFromJson(Map<String, dynamic> json) => Thumbnail(
      json['url'] as String,
      json['plainUrl'] as String?,
      (json['height'] as num?)?.toDouble(),
      (json['width'] as num?)?.toDouble(),
      (json['realHeight'] as num?)?.toDouble(),
      (json['realWidth'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ThumbnailToJson(Thumbnail instance) => <String, dynamic>{
      'url': instance.url,
      'plainUrl': instance.plainUrl,
      'height': instance.height,
      'width': instance.width,
      'realHeight': instance.realHeight,
      'realWidth': instance.realWidth,
    };
