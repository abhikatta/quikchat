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
      body: Column(
          children: [Expanded(child: _buildMessageList()), _buildUserInput()]),
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
            return ListView(
              children: snapshot.data!.docs
                  .map((doc) => _buildMessageItem(doc, context))
                  .toList(),
            );
          }
        });
  }

  Widget _buildMessageItem(DocumentSnapshot doc, BuildContext context) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Text(
                    data['senderUserName'] ?? 'no senderusername',
                    style: TextStyle(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const Text(' : '),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                // color: Theme.of(context).colorScheme.inversePrimary),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: Text(
                    data['message'],
                  ),
                ),
              ),
            ]));
  }

  Widget _buildUserInput() {
    return Row(
      children: [
        Expanded(
            child: MyInput(
          hintText: 'Enter a message...',
          inputController: _messageController,
          obscureText: false,
        )),
        IconButton(
            onPressed: sendMessage, icon: const Icon(Icons.send_outlined))
      ],
    );
  }
}
