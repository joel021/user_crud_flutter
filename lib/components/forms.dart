import 'package:flutter/material.dart';

import '../helper/validator.dart';

Widget inputField(String labelText, String hintText,
    TextEditingController controller, bool isPassword, bool enabled) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextFormField(
          controller: controller,
          enabled: enabled,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hintText,
            label: Text(labelText),
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

Widget singleInputButton(
    String hint,
    String buttonText,
    TextEditingController textEditingController,
    Key? formKey,
    VoidCallback? onSubmit) {
  return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: hint,
                ),
                validator: (value) {
                  return Validator.stringValidation(hint, value);
                },
              ),
            ),
            const SizedBox(width: 16),
            TextButton(
              onPressed: onSubmit,
              child: Text(buttonText),
            ),
          ],
        ),
      ));
}
