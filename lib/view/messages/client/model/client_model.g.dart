// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      count: json['count'] as int?,
      hashNumber: json['hashNumber'] as String?,
      id: json['id'] as String?,
      imageUrl: json['imageUrl'] as String?,
      lastMessage: json['lastMessage'] as String?,
      messageState: json['messageState'] as int?,
      name: json['name'] as String?,
      online: json['online'] as bool?,
      read: json['read'] as bool?,
      surname: json['surname'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'count': instance.count,
      'hashNumber': instance.hashNumber,
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'lastMessage': instance.lastMessage,
      'messageState': instance.messageState,
      'name': instance.name,
      'online': instance.online,
      'read': instance.read,
      'surname': instance.surname,
      'time': instance.time,
    };
