import 'package:chat_room/providers/auth_provider.dart';
import 'package:chat_room/views/pages/launcher_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: Colors.blueGrey,
      child: ListView(
        children: [
          Container(
            height: 200,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            onTap: () {
              context.read<AuthProvider>().signOut().then(
                    (value) => Navigator.pushNamedAndRemoveUntil(
                        context, LauncherPage.routeName, (route) => false),
                  );
            },
            leading: const Icon(Icons.logout),
            title: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}
