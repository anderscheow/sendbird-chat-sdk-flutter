// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'do_not_disturb.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoNotDisturb _$DoNotDisturbFromJson(Map<String, dynamic> json) => DoNotDisturb(
      isDoNotDisturbOn: json['do_not_disturb'] as bool,
      startHour: (json['startHour'] as num?)?.toInt(),
      startMin: (json['startMin'] as num?)?.toInt(),
      endHour: (json['endHour'] as num?)?.toInt(),
      endMin: (json['endMin'] as num?)?.toInt(),
      timezone: json['timezone'] as String?,
    );
