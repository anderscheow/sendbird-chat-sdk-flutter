// Copyright (c) 2023 Sendbird, Inc. All rights reserved.

import 'dart:convert';

import 'package:isar_community/isar.dart';
import 'package:sendbird_chat_sdk/sendbird_chat_sdk.dart';
import 'package:sendbird_chat_sdk/src/internal/db/schema/channel/c_base_channel.dart';
import 'package:sendbird_chat_sdk/src/internal/db/schema/message/c_base_message.dart';
import 'package:sendbird_chat_sdk/src/internal/db/schema/user/c_member.dart';
import 'package:sendbird_chat_sdk/src/internal/db/schema/user/c_user.dart';
import 'package:sendbird_chat_sdk/src/internal/main/chat/chat.dart';

part 'c_group_channel.g.dart';

@collection
class CGroupChannel extends CBaseChannel {
  @enumerated
  late MessageType lastMessageType; // lastMessage
  String? lastMessageRootId; // lastMessage
  int? lastMessageCreatedAt; // lastMessage for filtering

  late bool isSuper;
  late bool isBroadcast;
  late bool isPublic;
  late bool isDistinct;
  late bool isDiscoverable;
  late bool isExclusive;
  late bool isAccessCodeRequired;
  late int unreadMessageCount;
  late int unreadMentionCount;
  late List<CMember> members;
  late int memberCount;
  late int joinedMemberCount;

  @enumerated
  late GroupChannelPushTriggerOption myPushTriggerOption;

  late bool isChatNotification;

  @enumerated
  late MemberState myMemberState;

  @enumerated
  late Role myRole;

  @enumerated
  late MuteState myMutedState;

  @enumerated
  late CountPreference myCountPreference;

  String? creator; // CUser
  CMember? inviter;
  late int invitedAt;
  late int joinedAt;
  late bool isHidden;

  @enumerated
  late GroupChannelHiddenState hiddenState;

  late int myLastRead;
  int? messageOffsetTimestamp;
  late int messageSurvivalSeconds;
  late List<int> pinnedMessageIds;

  @enumerated
  late MessageType lastPinnedMessageType; // lastPinnedMessage
  String? lastPinnedMessageRootId; // lastPinnedMessage

  late int pinnedMessageUpdatedAt;

  late String readStatus; // Map<String, int>
  late String deliveryStatus; // Map<String, int>

  int? messageDeletionTimestamp;

  CGroupChannel();

  factory CGroupChannel.fromGroupChannel(GroupChannel channel) {
    return CGroupChannel()
      // BaseChannel
      ..setBaseChannel(channel)
      // GroupChannel
      ..lastMessageType = channel.lastMessage?.messageType ?? MessageType.user
      ..lastMessageRootId = channel.lastMessage?.rootId
      ..lastMessageCreatedAt = channel.lastMessage?.createdAt
      ..isSuper = channel.isSuper
      ..isBroadcast = channel.isBroadcast
      ..isSuper = channel.isSuper
      ..isPublic = channel.isPublic
      ..isDistinct = channel.isDistinct
      ..isDiscoverable = channel.isDiscoverable
      ..isExclusive = channel.isExclusive
      ..isAccessCodeRequired = channel.isAccessCodeRequired
      ..unreadMessageCount = channel.unreadMessageCount
      ..unreadMentionCount = channel.unreadMentionCount
      ..members =
          channel.members.map((member) => CMember.fromMember(member)).toList()
      ..memberCount = channel.memberCount
      ..joinedMemberCount = channel.joinedMemberCount
      ..myPushTriggerOption = channel.myPushTriggerOption
      ..isChatNotification = channel.isChatNotification
      ..myMemberState = channel.myMemberState
      ..myRole = channel.myRole
      ..myMutedState = channel.myMutedState
      ..myCountPreference = channel.myCountPreference
      ..creator = channel.creator?.userId
      ..inviter =
          channel.inviter != null ? CMember.fromMember(channel.inviter!) : null
      ..invitedAt = channel.invitedAt
      ..joinedAt = channel.joinedAt
      ..isHidden = channel.isHidden
      ..hiddenState = channel.hiddenState
      ..myLastRead = channel.myLastRead
      ..messageOffsetTimestamp = channel.messageOffsetTimestamp
      ..messageSurvivalSeconds = channel.messageSurvivalSeconds
      ..pinnedMessageIds = channel.pinnedMessageIds
      ..lastPinnedMessageType =
          channel.lastPinnedMessage?.messageType ?? MessageType.user
      ..lastPinnedMessageRootId = channel.lastPinnedMessage?.rootId
      ..pinnedMessageUpdatedAt = channel.pinnedMessageUpdatedAt
      ..readStatus = jsonEncode(channel.getCachedReadStatus(channel.channelUrl))
      ..deliveryStatus =
          jsonEncode(channel.getCachedDeliveryStatus(channel.channelUrl))
      ..messageDeletionTimestamp = channel.messageDeletionTimestamp;
  }

  Future<GroupChannel> toGroupChannel(Chat chat, Isar isar) async {
    final groupChannel = GroupChannel(
      // BaseChannel
      channelUrl: channelUrl,
    )..set(chat);

    CBaseChannel.setCBaseChannel(chat, isar, groupChannel, this) as GroupChannel
      // GroupChannel
      ..lastMessage = await CBaseMessage.getMessage(
          chat, isar, lastMessageType, lastMessageRootId)
      ..isBroadcast = isBroadcast
      ..isSuper = isSuper
      ..isPublic = isPublic
      ..isDistinct = isDistinct
      ..isDiscoverable = isDiscoverable
      ..isExclusive = isExclusive
      ..isAccessCodeRequired = isAccessCodeRequired
      ..unreadMessageCount = unreadMessageCount
      ..unreadMentionCount = unreadMentionCount
      ..memberCount = memberCount
      ..joinedMemberCount = joinedMemberCount
      ..myPushTriggerOption = myPushTriggerOption
      ..isChatNotification = isChatNotification
      ..myMemberState = myMemberState
      ..myRole = myRole
      ..myMutedState = myMutedState
      ..myCountPreference = myCountPreference
      ..creator = creator != null ? await CUser.get(chat, isar, creator!) : null
      ..inviter = await inviter?.toMember(chat, isar)
      ..invitedAt = invitedAt
      ..joinedAt = joinedAt
      ..isHidden = isHidden
      ..hiddenState = hiddenState
      ..myLastRead = myLastRead
      ..messageOffsetTimestamp = messageOffsetTimestamp
      ..messageSurvivalSeconds = messageSurvivalSeconds
      ..pinnedMessageIds = pinnedMessageIds
      ..lastPinnedMessage = await CBaseMessage.getMessage(
          chat, isar, lastPinnedMessageType, lastPinnedMessageRootId)
      ..pinnedMessageUpdatedAt = pinnedMessageUpdatedAt;

    groupChannel.members = [];
    for (final cMember in members) {
      final member = await cMember.toMember(chat, isar);
      if (member != null) {
        groupChannel.members.add(member);
      }
    }

    final cachedReadStatus = (jsonDecode(readStatus) as Map<String, dynamic>)
        .map((key, value) => MapEntry(key, value as int));
    groupChannel.setCachedReadStatus(cachedReadStatus);

    final cachedDeliveryStatus =
        (jsonDecode(deliveryStatus) as Map<String, dynamic>)
            .map((key, value) => MapEntry(key, value as int));
    groupChannel.setCachedDeliveryStatus(cachedDeliveryStatus);

    groupChannel.messageDeletionTimestamp = messageDeletionTimestamp;

    return groupChannel;
  }

  static Future<CGroupChannel> upsert(
      Chat chat, Isar isar, GroupChannel channel) async {
    final cGroupChannel = CGroupChannel.fromGroupChannel(channel);

    // Persist the channel and ALL of its related records (last message, members,
    // creator, inviter, last pinned message) inside a SINGLE write transaction.
    // Previously each of these opened its own transaction (one per member, etc.),
    // so a single channel cost ~10-15 durable commits and a full back-sync issued
    // thousands of them. (CLNP-8914)
    await chat.dbManager.write(() async {
      await _putWithinTxn(chat, isar, channel, cGroupChannel);
    });

    return cGroupChannel;
  }

  // Raw put of a channel and its related records WITHOUT opening a transaction.
  // Must run inside an existing DBManager.write() — used to batch a whole page of
  // channels into one transaction (see DB.upsertGroupChannels). (CLNP-8914)
  static Future<void> putWithinTxn(
      Chat chat, Isar isar, GroupChannel channel) async {
    await _putWithinTxn(
        chat, isar, channel, CGroupChannel.fromGroupChannel(channel));
  }

  static Future<void> _putWithinTxn(
    Chat chat,
    Isar isar,
    GroupChannel channel,
    CGroupChannel cGroupChannel,
  ) async {
    // GroupChannel
    await isar.cGroupChannels.put(cGroupChannel);

    // lastMessage
    if (channel.lastMessage != null) {
      await CBaseMessage.putWithinTxn(chat, isar, channel.lastMessage!);
    }

    // members
    for (final member in channel.members) {
      await CUser.putWithinTxn(isar, member);
    }

    // creator
    if (channel.creator != null) {
      await CUser.putWithinTxn(isar, channel.creator!);
    }

    // inviter
    if (channel.inviter != null) {
      await CUser.putWithinTxn(isar, channel.inviter!);
    }

    // lastPinnedMessage
    if (channel.lastPinnedMessage != null) {
      await CBaseMessage.putWithinTxn(chat, isar, channel.lastPinnedMessage!);
    }
  }

  static Future<GroupChannel?> get(
      Chat chat, Isar isar, String channelUrl) async {
    final cGroupChannel = await isar.cGroupChannels
        .where()
        .channelUrlEqualTo(channelUrl)
        .findFirst();
    return await cGroupChannel?.toGroupChannel(chat, isar);
  }

  static Future<List<GroupChannel>> getChannels(
    Chat chat,
    Isar isar,
    GroupChannelListQuery query,
    int? offset,
  ) async {
    return _getChannels(
      chat: chat,
      isar: isar,
      query: query,
      offset: offset,
    );
  }

  // Whether the cached channel with [channelUrl] matches [query]. Retained only
  // to back the deprecated DB/DBManager.canAddChannel; the collection now filters
  // in memory via GroupChannelCollection._canAddChannel. (CLNP-8914)
  static Future<bool> canAddChannel(
    Chat chat,
    Isar isar,
    GroupChannelListQuery query,
    String channelUrl,
  ) async {
    final cGroupChannels = await _queryCChannels(
      chat: chat,
      isar: isar,
      query: query,
      channelUrl: channelUrl,
      limitOverride: 1,
      existsOnly: true,
    );
    return cGroupChannels.isNotEmpty;
  }

  static Future<List<GroupChannel>> _getChannels({
    required Chat chat,
    required Isar isar,
    required GroupChannelListQuery query,
    int? offset,
  }) async {
    final cGroupChannels = await _queryCChannels(
      chat: chat,
      isar: isar,
      query: query,
      offset: offset,
    );

    final List<GroupChannel> channels = [];
    for (final cGroupChannel in cGroupChannels) {
      channels.add(await cGroupChannel.toGroupChannel(chat, isar));
    }
    return channels;
  }

  // Whether at least one channel matches [query] at [offset], WITHOUT
  // deserializing a full page. Used for the loadMore hasMore look-ahead so a
  // whole page isn't read + toGroupChannel'd (N+1) just to check existence.
  // (CLNP-8914)
  static Future<bool> hasChannels({
    required Chat chat,
    required Isar isar,
    required GroupChannelListQuery query,
    int? offset,
  }) async {
    final cGroupChannels = await _queryCChannels(
      chat: chat,
      isar: isar,
      query: query,
      offset: offset,
      limitOverride: 1,
      existsOnly: true,
    );
    return cGroupChannels.isNotEmpty;
  }

  static Future<List<CGroupChannel>> _queryCChannels({
    required Chat chat,
    required Isar isar,
    required GroupChannelListQuery query,
    int? offset,
    int? limitOverride,
    // Restricts the query to a single channel url (used by the deprecated
    // canAddChannel path).
    String? channelUrl,
    // Existence-only (hasChannels): skip ordering — emptiness at an offset depends
    // only on the match COUNT, not the order, so sorting would be wasted. (CLNP-8914)
    bool existsOnly = false,
  }) async {
    // [includeMetaData]
    // When calling API, this value have to be `true` to make chunk.
    // But we must always call API for GroupChannel, because we must always get `hasNext` value from API.
    // So we do not need the chunk for GroupChannel.

    QueryBuilder<CGroupChannel, CGroupChannel, QFilterCondition> queryBuilder;
    if (channelUrl != null && channelUrl.isNotEmpty) {
      queryBuilder = isar.cGroupChannels
          .where()
          .channelTypeChannelUrlEqualTo(ChannelType.group, channelUrl)
          .filter();
    } else {
      queryBuilder = isar.cGroupChannels
          .where()
          .channelTypeEqualToAnyChannelUrl(ChannelType.group) // Check
          .filter();
    }

    final cGroupChannels = await queryBuilder
        // channelUrlsFilter
        .optional(query.channelUrlsFilter.isNotEmpty, (q) {
          return q.group((groupQ) {
            late QueryBuilder<CGroupChannel, CGroupChannel,
                QAfterFilterCondition> qb;
            bool isFirst = true;
            for (final channelUrl in query.channelUrlsFilter) {
              if (isFirst) {
                qb = groupQ.channelUrlEqualTo(channelUrl);
                isFirst = false;
              } else {
                qb = qb.or().channelUrlEqualTo(channelUrl);
              }
            }
            return qb;
          });
        })

        // myMemberStateFilter
        .optional(query.myMemberStateFilter == MyMemberStateFilter.invited,
            (q) {
          return q.myMemberStateEqualTo(MemberState.invited);
        })
        .optional(query.myMemberStateFilter == MyMemberStateFilter.invitedByFriend,
            (q) {
          // Must call API, because this can not be queried with local cache.
          return q.myMemberStateEqualTo(MemberState.invited);
        })
        .optional(query.myMemberStateFilter == MyMemberStateFilter.invitedByNonFriend,
            (q) {
          // Must call API, because this can not be queried with local cache.
          return q.myMemberStateEqualTo(MemberState.invited);
        })
        .optional(query.myMemberStateFilter == MyMemberStateFilter.joined, (q) {
          return q.myMemberStateEqualTo(MemberState.joined);
        })

        // superChannelFilter
        // isExclusive / isBroadcast are stored, so filter them locally to match
        // the in-memory canAddChannel path (keeps cache read and live add
        // consistent). (CLNP-8914)
        .optional(query.superChannelFilter == SuperChannelFilter.exclusiveChannelOnly,
            (q) {
          return q.isExclusiveEqualTo(true);
        })
        .optional(query.superChannelFilter == SuperChannelFilter.superChannelOnly,
            (q) {
          return q.isSuperEqualTo(true);
        })
        .optional(query.superChannelFilter == SuperChannelFilter.nonsuperChannelOnly,
            (q) {
          return q.isSuperEqualTo(false);
        })
        .optional(query.superChannelFilter == SuperChannelFilter.broadcastChannelOnly,
            (q) {
          return q.isBroadcastEqualTo(true);
        })

        // publicChannelFilter
        .optional(query.publicChannelFilter == PublicChannelFilter.public, (q) {
          return q.isPublicEqualTo(true);
        })
        .optional(query.publicChannelFilter == PublicChannelFilter.private,
            (q) {
          return q.isPublicEqualTo(false);
        })

        // unreadChannelFilter
        .optional(query.unreadChannelFilter == UnreadChannelFilter.unreadMessage,
            (q) {
          return q.isSuperEqualTo(false).unreadMessageCountGreaterThan(0);
        })

        // hiddenChannelFilter
        .optional(query.hiddenChannelFilter == HiddenChannelFilter.unhidden,
            (q) {
          return q.isHiddenEqualTo(false);
        })
        .optional(query.hiddenChannelFilter == HiddenChannelFilter.hidden, (q) {
          return q.isHiddenEqualTo(true);
        })
        .optional(query.hiddenChannelFilter == HiddenChannelFilter.hiddenAllowAutoUnhide,
            (q) {
          return q
              .isHiddenEqualTo(true)
              .hiddenStateEqualTo(GroupChannelHiddenState.allowAutoUnhide);
        })
        .optional(query.hiddenChannelFilter == HiddenChannelFilter.hiddenPreventAutoUnhide,
            (q) {
          return q
              .isHiddenEqualTo(true)
              .hiddenStateEqualTo(GroupChannelHiddenState.preventAutoUnhide);
        })

        // customTypeStartsWithFilter
        .optional(query.customTypeStartsWithFilter != null && query.customTypeStartsWithFilter!.isNotEmpty,
            (q) {
          return q.customTypeStartsWith(query.customTypeStartsWithFilter!);
        })

        // customTypesFilter
        .optional(query.customTypesFilter.isNotEmpty, (q) {
          return q.group((groupQ) {
            late QueryBuilder<CGroupChannel, CGroupChannel,
                QAfterFilterCondition> qb;
            bool isFirst = true;
            for (final customType in query.customTypesFilter) {
              if (isFirst) {
                qb = groupQ.customTypeEqualTo(customType);
                isFirst = false;
              } else {
                qb = qb.or().customTypeEqualTo(customType);
              }
            }
            return qb;
          });
        })

        // nicknameContainsFilter
        .optional(query.nicknameContainsFilter != null && query.nicknameContainsFilter!.isNotEmpty,
            (q) {
          return q.membersElement((q) {
            return q.nicknameContains(query.nicknameContainsFilter!,
                caseSensitive: false);
          });
        })

        // userIdsIncludeFilter & queryType
        // AND: the channel must contain EVERY listed user — one membersElement per
        // id, implicitly AND-ed (a single member cannot equal two ids). OR: it must
        // contain ANY. user_id is matched case-sensitively to mirror the server
        // (guest_id collation is utf8mb4_bin). (CLNP-8914)
        .optional(
            query.userIdsIncludeFilter.isNotEmpty &&
                query.queryType == GroupChannelListQueryType.and, (q) {
          var qb = q.membersElement(
              (m) => m.userIdEqualTo(query.userIdsIncludeFilter.first));
          for (final userId in query.userIdsIncludeFilter.skip(1)) {
            qb = qb.membersElement((m) => m.userIdEqualTo(userId));
          }
          return qb;
        })
        .optional(
            query.userIdsIncludeFilter.isNotEmpty &&
                query.queryType == GroupChannelListQueryType.or, (q) {
          return q.membersElement((membersQ) {
            late QueryBuilder<CMember, CMember, QAfterFilterCondition> qb;
            bool isFirst = true;
            for (final userId in query.userIdsIncludeFilter) {
              if (isFirst) {
                qb = membersQ.userIdEqualTo(userId);
                isFirst = false;
              } else {
                qb = qb.or().userIdEqualTo(userId);
              }
            }
            return qb;
          });
        })

        // userIdsExactFilter — exact set: member count == N AND every listed user
        // present (one membersElement per id, AND-ed), mirroring the server's
        // COUNT(...) = N + per-id match. user_id matched case-sensitively. (CLNP-8914)
        .optional(query.userIdsExactFilter.isNotEmpty, (q) {
          var qb = q
              .membersLengthEqualTo(query.userIdsExactFilter.length)
              .membersElement(
                  (m) => m.userIdEqualTo(query.userIdsExactFilter.first));
          for (final userId in query.userIdsExactFilter.skip(1)) {
            qb = qb.membersElement((m) => m.userIdEqualTo(userId));
          }
          return qb;
        })

        // channelNameContainsFilter
        .optional(query.channelNameContainsFilter != null && query.channelNameContainsFilter!.isNotEmpty,
            (q) {
          return q.nameContains(query.channelNameContainsFilter!,
              caseSensitive: false);
        })

        // [metaDataOrderKeyFilter]
        // Must call API, because this can not be queried with local cache.

        // [metaDataKey & metaDataValues]
        // Must call API, because this can not be queried with local cache.

        // [metaDataKey & metaDataValueStartsWith]
        // Must call API, because this can not be queried with local cache.

        // searchQuery & searchFields — only apply when both are set. Without the
        // searchFields guard, an empty searchFields would build an empty group()
        // and return an uninitialized `late qb` (LateInitializationError). Matches
        // the in-memory _canAddChannel guard. (CLNP-8914)
        .optional(query.searchQuery != null && query.searchQuery!.isNotEmpty && query.searchFields.isNotEmpty, (q) {
          return q.group((groupQ) {
            late QueryBuilder<CGroupChannel, CGroupChannel,
                QAfterFilterCondition> qb;
            bool isFirst = true;
            for (final searchField in query.searchFields) {
              if (searchField ==
                  GroupChannelListQuerySearchField.memberNickname) {
                if (isFirst) {
                  qb = groupQ.membersElement((q) {
                    return q.nicknameContains(query.searchQuery!,
                        caseSensitive: false);
                  });
                  isFirst = false;
                } else {
                  qb = qb.or().membersElement((q) {
                    return q.nicknameContains(query.searchQuery!,
                        caseSensitive: false);
                  });
                }
              } else if (searchField ==
                  GroupChannelListQuerySearchField.channelName) {
                if (isFirst) {
                  qb = groupQ.nameContains(query.searchQuery!,
                      caseSensitive: false);
                  isFirst = false;
                } else {
                  qb = qb
                      .or()
                      .nameContains(query.searchQuery!, caseSensitive: false);
                }
              }
            }
            return qb;
          });
        })

        // includeEmpty
        .optional(query.includeEmpty == false, (q) {
          return q.lastMessageRootIdIsNotNull();
        })

        // includeFrozen
        .optional(query.includeFrozen == false, (q) {
          return q.isFrozenEqualTo(false);
        })

        // includeChatNotification
        .optional(query.includeChatNotification == false, (q) {
          return q.isChatNotificationEqualTo(false);
        })

        // createdBefore
        .optional(query.createdBefore != null, (q) {
          return q.createdAtLessThan(query.createdBefore, include: true);
        })

        // createdAfter
        .optional(query.createdAfter != null, (q) {
          return q.createdAtGreaterThan(query.createdAfter, include: true);
        })

        // order (skipped for existence-only queries)
        .optional(!existsOnly && query.order == GroupChannelListQueryOrder.chronological, (q) {
          return q.sortByCreatedAtDesc();
        })
        .optional(!existsOnly && query.order == GroupChannelListQueryOrder.latestLastMessage, (q) {
          return q.thenByLastMessageCreatedAtDesc().thenByCreatedAtDesc();
        })
        .optional(!existsOnly && query.order == GroupChannelListQueryOrder.channelNameAlphabetical, (q) {
          return q.thenByName().thenByCreatedAtDesc();
        })

        // [GroupChannelListQueryOrder.metadataValueAlphabetical]
        // Must call API, because this can not be queried with local cache.

        // offset
        .optional(offset != null, (q) {
          return q.offset(offset!);
        })

        // limit
        .limit(limitOverride ?? query.limit)
        .findAll();

    return cGroupChannels;
  }

  static Future<void> delete(Chat chat, Isar isar, String channelUrl) async {
    await chat.dbManager.write(() async {
      await isar.cGroupChannels.deleteByChannelUrl(channelUrl);
    });
  }
}
