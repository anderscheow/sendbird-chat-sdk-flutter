// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_publish_default_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogPublishDefaultConfig _$LogPublishDefaultConfigFromJson(
        Map<String, dynamic> json) =>
    LogPublishDefaultConfig(
      minStatCount: (json['minStatCount'] as num?)?.toInt(),
      minInterval: (json['minInterval'] as num?)?.toInt(),
      maxStatCountPerRequest: (json['maxStatCountPerRequest'] as num?)?.toInt(),
      lowerThreshold: (json['lowerThreshold'] as num?)?.toInt(),
      requestDelayRange: (json['requestDelayRange'] as num?)?.toInt(),
    );
