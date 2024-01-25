import 'package:flutter/material.dart';
import 'package:user_crud_flutter/components/colors.dart';

Widget appWithBar(String title, actions, Widget body) {
  return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: primaryBlue(),
        leading: IconButton(
          onPressed: () => {},
          icon: const Icon(Icons.home),
        ),
        actions: actions,
      ),
      body: body);
}
