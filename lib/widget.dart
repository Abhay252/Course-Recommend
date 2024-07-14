import 'package:flutter/material.dart';

TextField reusableTextField(
  String text,
  IconData icon,
  bool isPasswordType,
  TextEditingController controller,
) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: isPasswordType,
    decoration: InputDecoration(
        labelText: text,
        prefixIcon:Icon(icon),
        border: OutlineInputBorder(
          gapPadding: 10,
          borderRadius: BorderRadius.circular(15),
        )),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}
