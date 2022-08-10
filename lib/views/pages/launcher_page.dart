import 'package:chat_room/auth/auth_service.dart';
import 'package:chat_room/views/pages/signin_page.dart';
import 'package:chat_room/views/pages/profile_page.dart';
import 'package:flutter/material.dart';

class LauncherPage extends StatefulWidget {
  static const String routeName = '/launcher_page';
  const LauncherPage({Key? key}) : super(key: key);

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if (AuthService.user != null){
        Navigator.pushReplacementNamed(context, ProfilePage.routeName);
      }else{
        Navigator.pushReplacementNamed(context, LoginPage.routeName);
      }
    },);
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
