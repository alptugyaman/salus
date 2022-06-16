import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  String? from;
  String? sendTime;
  String? message;
  String? to;

  MessageModel({
    this.from,
    this.sendTime,
    this.message,
    this.to,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);

  factory MessageModel.fromQuery(QueryDocumentSnapshot<MessageModel> doc) =>
      MessageModel(
        from: doc['from'] as String?,
        sendTime: doc['send_time'] as String?,
        message: doc['message'] as String?,
        to: doc['to'] as String?,
      );
}
