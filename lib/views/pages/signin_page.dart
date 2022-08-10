import 'package:chat_room/providers/auth_provider.dart';
import 'package:chat_room/views/pages/launcher_page.dart';
import 'package:chat_room/views/pages/profile_page.dart';
import 'package:chat_room/views/pages/user_list_page.dart';
import 'package:chat_room/views/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/loading_widget.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/login';
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                const Text(
                  'Welcome  to chat room',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                CircleAvatar(
                  radius: 40,
                  child: Text(
                    'CR',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),

                //  text form fields
                CustomFormField(
                  controller: emailTextEditingController,
                  icon: Icons.email,
                  hintText: 'Email',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomFormField(
                  controller: passwordTextEditingController,
                  icon: Icons.lock,
                  hintText: 'Password',
                  isPassword: true,
                ),
                const SizedBox(
                  height: 15,
                ),

                /*
                * Sign In button*/
                ElevatedButton(
                  onPressed: () {
                    showLoadingDialog(context);
                    // set email
                    context
                        .read<AuthProvider>()
                        .setEmail(emailTextEditingController.text);
                    //set password
                    context
                        .read<AuthProvider>()
                        .setPassword(passwordTextEditingController.text);
                    // authenticating user
                    context
                        .read<AuthProvider>()
                        .authenticate(
                            validate: formKey.currentState!.validate())
                        .then((value) {
                      Navigator.pushNamedAndRemoveUntil(context, LauncherPage.routeName, (route) => false);
                    });

                    // Navigator.pushReplacementNamed(
                    //     context, UserListPage.routeName);
                  },
                  child: const Text('Sign In'),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?'),
                    const SizedBox(
                      width: 5,
                    ),
                    /*
                    * Sign Up button*/
                    TextButton(
                      onPressed: () {
                        // set email
                        context
                            .read<AuthProvider>()
                            .setEmail(emailTextEditingController.text);

                        // set password
                        context
                            .read<AuthProvider>()
                            .setPassword(passwordTextEditingController.text);

                        // authenticate user
                        context.read<AuthProvider>().authenticate(
                            validate: formKey.currentState!.validate(),
                            isSignIn: false);
                        // Navigator.pushReplacementNamed(
                        //     context, UserListPage.routeName);
                      },
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
                // showing error message
                Center(
                  child: Consumer<AuthProvider>(
                    builder: (context, authProvider, child) => Text(
                      authProvider.errorMessage,
                      style: TextStyle(
                        color: Theme.of(context).errorColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
