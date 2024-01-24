import 'package:flutter/material.dart';

Widget text(String value) {
  return Container(
    width: double.maxFinite,
    margin: const EdgeInsets.fromLTRB(20, 25, 0, 2),
    child: const Text("Login",
        style: TextStyle(fontSize: 12), textAlign: TextAlign.center),
  );
}
