import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = '/profile';
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          leading: CircleAvatar(

          ),
          title: Text('Tariqul'),
        ),
      ),
      body: ListView(
        children: [

        ],
      ),
    );
  }
}
