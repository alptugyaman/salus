import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:salus/core/utils/date_calculation.dart';

import 'package:salus/view/messages/client/model/client_model.dart';
import 'package:salus/view/messages/message_detail/model/message_model.dart';

class FirebaseManager {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // * ADD NEW USER
  Future<void> saveUserToFirestore() async {
    try {
      var db = _firestore.collection('message_list');
      var _id = 'SAkfj3349SkIkMM3zXv';

      var user = db.doc('$_id');
      user.set({
        'count': null,
        'hash_number': '#941658722',
        'id': _id,
        'imageUrl': null,
        'last_message': 'Tamam',
        'message_state': 2,
        'name': 'Zeynep',
        'online': true,
        'read': true,
        'surname': 'Yener',
        'time': '11:52'
      });
    } on Exception catch (e) {
      if (kDebugMode) print('Failed saveUserToFirestore: $e');
    }
  }

  // * GET MESAGGE LIST
  Stream<QuerySnapshot<Client>> getClientList() {
    final client = FirebaseFirestore.instance
        .collection('message_list')
        .withConverter<Client>(
          fromFirestore: (snapshots, _) => Client.fromJson(snapshots.data()!),
          toFirestore: (client, _) => client.toJson(),
        );

    return client.snapshots();
  }

  // * GET CHAT MESSAGE
  Stream<QuerySnapshot<MessageModel>> getUsersMessages(String hashNumber) {
    final message = FirebaseFirestore.instance
        .collection('message')
        .doc(dotenv.env['DOCUMENT'])
        .collection(hashNumber == '#941658722' ? 'channel' : 'channel 2')
        .orderBy('send_time', descending: false)
        .withConverter<MessageModel>(
          fromFirestore: (snapshots, _) =>
              MessageModel.fromJson(snapshots.data()!),
          toFirestore: (message, _) => message.toJson(),
        );

    return message.snapshots();
  }

  // * SEND CHAT MESSAGE
  Future<void> addMessage(String message, String hashNumber) {
    return FirebaseFirestore.instance
        .collection('message')
        .doc(dotenv.env['DOCUMENT'])
        .collection(hashNumber == '#941658722' ? 'channel' : 'channel 2')
        .add({
          'send_time': DateCalculation.convertingToString(DateTime.now()),
          'to': 'hhEjpOCV1RfQU1RffAwL',
          'message': message,
          'from': dotenv.env['FROM'],
        })
        .then((value) => print("Message sent"))
        .catchError((error) => print("Failed to send message: $error"));
  }

  // * SEND CHAT MESSAGE
  Future<void> addMessageLeft(String message) {
    return FirebaseFirestore.instance
        .collection('message')
        .doc(dotenv.env['DOCUMENT'])
        .collection('channel')
        .add({
          'send_time': DateCalculation.convertingToString(DateTime.now()),
          'from': 'hhEjpOCV1RfQU1RffAwL',
          'message': message,
          'to': dotenv.env['FROM'],
        })
        .then((value) => print("Message sent"))
        .catchError((error) => print("Failed to send message: $error"));
  }
}
