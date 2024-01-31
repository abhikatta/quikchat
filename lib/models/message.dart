import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderID;
  final String? senderEmail;
  final String receiverID;
  final String message;
  final String senderUserName;
  final Timestamp timestamp;
  Message(
      {required this.message,
      required this.timestamp,
      required this.receiverID,
      required this.senderEmail,
      required this.senderUserName,
      required this.senderID});

  // so this can be directly added as data for doc creation in firestore.
  Map<String, dynamic> toMap() {
    return {
      'senderID': senderID,
      'senderEmail': senderEmail,
      'receiverID': receiverID,
      'message': message,
      'senderUserName': senderUserName,
      'timestamp': timestamp,
    };
  }
}
