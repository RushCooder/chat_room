import 'package:chat_room/providers/auth_provider.dart';
import 'package:chat_room/views/pages/profile_page.dart';
import 'package:chat_room/views/pages/user_list_page.dart';
import 'package:chat_room/views/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/login';
  final TextEditingController emailTextEditingController = TextEditingController();
  final TextEditingController passwordTextEditingController = TextEditingController();
  LoginPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<AuthProvider>(
          builder: (context, authProvider, child) => Form(
            key: authProvider.formKey,
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

                  ElevatedButton(
                    onPressed: () {
                      authProvider.setEmail(emailTextEditingController.text);
                      authProvider.setPassword(passwordTextEditingController.text);
                      authProvider.authenticate();
                      Navigator.pushReplacementNamed(
                          context, UserListPage.routeName);
                    },
                    child: const Text('Login'),
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
                      TextButton(
                        onPressed: () {
                          authProvider.setEmail(emailTextEditingController.text);
                          authProvider.setPassword(passwordTextEditingController.text);
                          authProvider.authenticate();
                          Navigator.pushReplacementNamed(
                              context, UserListPage.routeName);
                        },
                        child: const Text('Register'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
