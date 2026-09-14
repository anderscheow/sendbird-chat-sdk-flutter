// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dnd_time_window.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DndTimeWindow _$DndTimeWindowFromJson(Map<String, dynamic> json) =>
    DndTimeWindow(
      startHour: (json['startHour'] as num).toInt(),
      startMin: (json['startMin'] as num).toInt(),
      endHour: (json['endHour'] as num).toInt(),
      endMin: (json['endMin'] as num).toInt(),
    );

Map<String, dynamic> _$DndTimeWindowToJson(DndTimeWindow instance) =>
    <String, dynamic>{
      'startHour': instance.startHour,
      'startMin': instance.startMin,
      'endHour': instance.endHour,
      'endMin': instance.endMin,
    };
