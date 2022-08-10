import 'package:chat_room/views/pages/chat_room_page.dart';
import 'package:flutter/material.dart';

class UserListPage extends StatelessWidget {
  static const String routeName = '/user_list';
  const UserListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          leading: CircleAvatar(
            child: Text('T'),
          ),
          title: Text('Tariqul', style: Theme.of(context).textTheme.headline5?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),),
        ),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) =>  ListTile(
          onTap: (){
            Navigator.pushNamed(context, ChatRoomPage.routeName);
          },
          leading: const CircleAvatar(
            child: Text('T'),
          ),
          title: const Text('User name'),
          subtitle: const Text('Message'),
          trailing: const CircleAvatar(
            backgroundColor: Colors.green,
            radius: 3,
          )
        ),
      ),
    );
  }
}
