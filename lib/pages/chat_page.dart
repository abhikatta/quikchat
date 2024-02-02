import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_run_flutter/components/my_input.dart';
import 'package:test_run_flutter/services/auth/auth_service.dart';
import 'package:test_run_flutter/services/chat/chat_service.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key, required this.email, required this.receiverID});

  final String email;
  final String receiverID;
  final TextEditingController _messageController = TextEditingController();

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(receiverID, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
        title: Text(email),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(child: _buildMessageList()),
        _buildUserInput(context),
        const SizedBox(
          height: 10,
        ),
      ]),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: _chatService.getMessages(receiverID, senderID),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error while getting data.\n ${snapshot.error}');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('Loading chat...'));
          } else if (snapshot.data!.size == 0) {
            return const Center(child: Text('No previous chats found...'));
          } else {
            return ListView(children: [
              const SizedBox(
                height: 19,
              ),
              ...snapshot.data!.docs
                  .map((doc) => _buildMessageItem(doc, context)),
            ]);
          }
        });
  }

  Widget _buildMessageItem(DocumentSnapshot doc, BuildContext context) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    var timestamp = data['timestamp'].toDate();
    var time =
        timestamp.toString().split(' ')[1].split(':').sublist(0, 2).join(':');
    var month = timestamp.month.toString();
    var day = timestamp.day.toString();

    return Align(
      alignment:
          _authService.getCurrentUser()!.displayName == data['senderUserName']
              ? Alignment.centerRight
              : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(
            top: 5,
            bottom: 5,
            left: _authService.getCurrentUser()!.displayName ==
                    data['senderUserName']
                ? 100
                : 10,
            right: _authService.getCurrentUser()!.displayName ==
                    data['senderUserName']
                ? 10
                : 100),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data['message'],
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "$day/$month | $time",
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInput(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: MyInput(
          hintText: 'Enter a message...',
          inputController: _messageController,
          obscureText: false,
        )),
        IconButton(
            splashRadius: 2,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).colorScheme.primary),
                padding: const MaterialStatePropertyAll<EdgeInsets>(
                    EdgeInsets.all(10)),
                alignment: Alignment.center,
                iconColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).colorScheme.inversePrimary)),
            onPressed: sendMessage,
            icon: const Icon(Icons.arrow_forward_rounded, size: 35)),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
