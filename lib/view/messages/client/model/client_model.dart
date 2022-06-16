import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:salus/core/constant/enum/label_enum.dart';

part 'client_model.g.dart';

@JsonSerializable()
class Client {
  int? count;
  String? hashNumber;
  String? id;
  String? imageUrl;
  String? lastMessage;
  int? messageState;
  String? name;
  bool? online;
  bool? read;
  String? surname;
  String? time;

  Client({
    this.count,
    this.hashNumber,
    this.id,
    this.imageUrl,
    this.lastMessage,
    this.messageState,
    this.name,
    this.online,
    this.read,
    this.surname,
    this.time,
  });

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  Map<String, dynamic> toJson() => _$ClientToJson(this);

  factory Client.fromQuery(QueryDocumentSnapshot<Client> doc) => Client(
        count: doc['count'] as int?,
        hashNumber: doc['hash_number'] as String?,
        id: doc['id'] as String?,
        imageUrl: doc['imageUrl'] as String?,
        lastMessage: doc['last_message'] as String?,
        messageState: (doc['message_state'] as int?),
        name: doc['name'] as String?,
        online: doc['online'] as bool?,
        read: doc['read'] as bool?,
        surname: doc['surname'] as String?,
        time: doc['time'] as String?,
      );

  String get capitals => '${name?[0]}${surname?[0]}';

  static MessageState getState(int? messageState) {
    if (messageState == 1) return MessageState.NEW;
    if (messageState == 2) return MessageState.WAITING;
    if (messageState == 3) return MessageState.MEETING;
    if (messageState == 4) return MessageState.JOURNEY;
    if (messageState == 5) return MessageState.CAREING;
    return MessageState.UNKNOWN;
  }
}
