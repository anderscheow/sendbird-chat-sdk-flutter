// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduled_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduledInfo _$ScheduledInfoFromJson(Map<String, dynamic> json) =>
    ScheduledInfo(
      scheduledMessageId: (json['scheduledMessageId'] as num).toInt(),
      scheduledAt: (json['scheduledAt'] as num).toInt(),
      scheduledStatus:
          $enumDecode(_$ScheduledStatusEnumMap, json['scheduledStatus']),
    );

const _$ScheduledStatusEnumMap = {
  ScheduledStatus.pending: 'pending',
  ScheduledStatus.inQueue: 'in_queue',
  ScheduledStatus.sent: 'sent',
  ScheduledStatus.failed: 'failed',
  ScheduledStatus.canceled: 'canceled',
  ScheduledStatus.removed: 'removed',
};
