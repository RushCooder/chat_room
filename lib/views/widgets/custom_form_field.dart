import 'package:chat_room/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  bool isPassword;
  final IconData icon;
  final String hintText;
  CustomFormField({
    required this.controller,
    required this.icon,
    required this.hintText,
    this.isPassword = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hintText,
        prefixIcon:  Icon(icon),
        suffixIcon: isPassword
            ? Consumer<AuthProvider>(
                builder: (context, authProvider, child) {
                  if (authProvider.isVisible) {
                    return IconButton(
                        onPressed: authProvider.changeVisibility,
                        icon: Icon(Icons.visibility));
                  } else {
                    return IconButton(
                        onPressed: authProvider.changeVisibility,
                        icon: Icon(Icons.visibility_off));
                  }
                },
              )
            : null,
      ),
      obscureText: isPassword ? Provider.of<AuthProvider>(context, listen: false).isObscure : false,

    );
  }
}
