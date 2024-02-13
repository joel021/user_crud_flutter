import 'package:flutter/material.dart';
import 'package:user_crud_flutter/components/colors.dart';

Widget button(String title, VoidCallback? callback) {
  return ElevatedButton(
    onPressed: callback,
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryBlue(),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 16.0, color: Color.fromARGB(255, 36, 35, 35)),
      ),
    ),
  );
}
