import 'package:flutter/material.dart';
import 'package:user_crud_flutter/components/colors.dart';

Widget appWithBar(String title, Widget body) {
  return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: primaryBlue(),
        leading: IconButton(
          onPressed: () => {},
          icon: const Icon(Icons.home),
        ),
      ),
      body: body);
}

Widget paddedContainer(String title, String body) {
  return Container(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text(title), const SizedBox(height: 16), Text(body)],
    ),
  );
}
