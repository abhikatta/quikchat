import 'package:flutter/material.dart';
import 'package:test_run_flutter/components/user_component.dart';
import 'package:test_run_flutter/pages/chat_page.dart';
import 'package:test_run_flutter/pages/profile_page.dart';
import 'package:test_run_flutter/services/auth/auth_service.dart';
import 'package:test_run_flutter/components/my_drawer.dart';
import 'package:test_run_flutter/services/chat/chat_service.dart';

class HomePage extends StatelessWidget {
  final AuthService _auth = AuthService();
  final ChatService _chatService = ChatService();

  HomePage({super.key});

  void logout() {
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      drawerEdgeDragWidth: 100,
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
        title: const Text(
          'Shit-Chant',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            icon: const Icon(
              Icons.person,
              size: 35,
            ),
          ),
          const SizedBox(
            width: 7,
          )
        ],
        centerTitle: true,
        titleTextStyle: const TextStyle(fontFamily: 'Arial', fontSize: 30),
      ),
      body: _buildUsersWidget(),
    );
  }

  Widget _buildUsersWidget() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error");
        } else if (snapshot.hasData) {
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading..');
        }
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  // individual user component
  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    if (userData['displayName'] != _auth.getCurrentUser()!.displayName) {
      return UserComponent(
          text: userData['displayName'],
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(
                    receiverID: userData['uid'],
                    email: userData['displayName'],
                  ),
                ));
          });
    } else {
      return const SizedBox();
    }
  }
}
