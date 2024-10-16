// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      memberState: $enumDecodeNullable(_$MemberStateEnumMap, json['state'],
              unknownValue: MemberState.none) ??
          MemberState.none,
      isBlockedByMe: json['isBlockedByMe'] as bool? ?? false,
      isBlockingMe: json['isBlockingMe'] as bool? ?? false,
      isMuted: json['isMuted'] as bool? ?? false,
      role: $enumDecodeNullable(_$RoleEnumMap, json['role'],
              unknownValue: Role.none) ??
          Role.none,
      userId: json['userId'] as String,
      nickname: json['nickname'] as String,
      profileUrl: json['profileUrl'] as String? ?? '',
      connectionStatus: json['is_online'] == null
          ? UserConnectionStatus.notAvailable
          : boolToConnectionStatus(json['is_online'] as bool?),
      lastSeenAt: (json['lastSeenAt'] as num?)?.toInt(),
      preferredLanguages: (json['preferredLanguages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      friendDiscoveryKey: json['friendDiscoveryKey'] as String? ?? '',
      friendName: json['friendName'] as String? ?? '',
      metaData: (json['metadata'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      requireAuth: json['require_auth_for_profile_image'] as bool? ?? false,
    )..isActive = json['isActive'] as bool?;

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'userId': instance.userId,
      'nickname': instance.nickname,
      'profileUrl': instance.profileUrl,
      'is_online': connectionStatusToBool(instance.connectionStatus),
      'lastSeenAt': instance.lastSeenAt,
      'isActive': instance.isActive,
      'preferredLanguages': instance.preferredLanguages,
      'friendDiscoveryKey': instance.friendDiscoveryKey,
      'friendName': instance.friendName,
      'metadata': instance.metaData,
      'require_auth_for_profile_image': instance.requireAuth,
      'state': _$MemberStateEnumMap[instance.memberState]!,
      'isBlockedByMe': instance.isBlockedByMe,
      'isBlockingMe': instance.isBlockingMe,
      'isMuted': instance.isMuted,
      'role': _$RoleEnumMap[instance.role]!,
    };

const _$MemberStateEnumMap = {
  MemberState.none: 'none',
  MemberState.invited: 'invited',
  MemberState.joined: 'joined',
};

const _$RoleEnumMap = {
  Role.none: 'none',
  Role.operator: 'operator',
};
