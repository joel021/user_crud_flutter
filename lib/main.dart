import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_crud_flutter/components/colors.dart';
import 'package:user_crud_flutter/config/routes.dart';
import 'package:user_crud_flutter/views/add_comment/add_comment.dart';
import 'package:user_crud_flutter/views/list_posts/list_posts.dart';
import 'package:user_crud_flutter/views/list_posts/list_posts_state.dart';
import 'package:user_crud_flutter/views/login/login.dart';
import 'package:user_crud_flutter/views/login/login_state.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => LoginStateProvider()),
          ChangeNotifierProvider(create: (context) => ListPostsStateProvider()),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Posts',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryBlue()),
        useMaterial3: true,
      ),
      home: const LoginPage(),
      routes: {
        Routes.LIST_POSTS: (context) => const ListPosts(),
        Routes.ADD_COMMENT: (context) => const AddComment()
      },
    );
  }
}
