import 'package:chat_room/views/pages/chat_room_page.dart';
import 'package:chat_room/views/pages/chat_room_page.dart';
import 'package:chat_room/views/pages/chat_room_page.dart';
import 'package:chat_room/views/pages/launcher_page.dart';
import 'package:chat_room/views/pages/signin_page.dart';
import 'package:chat_room/views/pages/profile_page.dart';
import 'package:chat_room/views/pages/user_list_page.dart';
import 'package:flutter/material.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LauncherPage.routeName,
      routes: {
        LauncherPage.routeName: (context) => const LauncherPage(),
        LoginPage.routeName: (context) => LoginPage(),
        ProfilePage.routeName: (context) => const ProfilePage(),
        UserListPage.routeName: (context) => const UserListPage(),
        ChatRoomPage.routeName: (context) => ChatRoomPage(),
      },
    );
  }
}
