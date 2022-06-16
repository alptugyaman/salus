// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      from: json['from'] as String?,
      sendTime: json['sendTime'] as String?,
      message: json['message'] as String?,
      to: json['to'] as String?,
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'from': instance.from,
      'sendTime': instance.sendTime,
      'message': instance.message,
      'to': instance.to,
    };
