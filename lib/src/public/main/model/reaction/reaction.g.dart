// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reaction _$ReactionFromJson(Map<String, dynamic> json) => Reaction(
      key: json['key'] as String,
      userIds: (json['userIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      updatedAt: (json['updatedAt'] as num).toInt(),
    );

Map<String, dynamic> _$ReactionToJson(Reaction instance) => <String, dynamic>{
      'key': instance.key,
      'userIds': instance.userIds,
      'updatedAt': instance.updatedAt,
    };
