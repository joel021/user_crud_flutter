import 'package:flutter/material.dart';

import '../helper/validator.dart';

Widget inputField(String labelText, String hintText,
    TextEditingController controller, bool isPassword, bool enabled) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        labelText,
        style: const TextStyle(fontSize: 16.0),
      ),
      const SizedBox(height: 8.0),
      TextFormField(
          controller: controller,
          enabled: enabled,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hintText,
            border: const OutlineInputBorder(),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
          validator: (value) {
            return Validator.stringValidation(labelText, value);
          }),
    ],
  );
}
