import 'package:flutter/material.dart';
import 'package:quikchat/components/user_component.dart';
import 'package:quikchat/pages/chat_page.dart';
import 'package:quikchat/pages/profile_page.dart';
import 'package:quikchat/services/auth/auth_service.dart';
import 'package:quikchat/components/my_drawer.dart';
import 'package:quikchat/services/chat/chat_service.dart';

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
          'QuikChat',
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
        titleTextStyle: const TextStyle(fontFamily: 'LexendDeca', fontSize: 30),
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
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Text(
              'Loading..',
              style: TextStyle(fontSize: 30),
            ),
          );
        } else if (snapshot.hasData) {
          return ListView(
            children: [
              const SizedBox(height: 10),
              ...snapshot.data!.map<Widget>(
                  (userData) => _buildUserListItem(userData, context))
            ],
          );
        }
        return const Center(
          child: Text('No Users found'),
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
                    displayName: userData['displayName'],
                  ),
                ));
          });
    } else {
      return const SizedBox();
    }
  }
}
