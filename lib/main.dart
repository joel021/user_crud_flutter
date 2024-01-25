import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_crud_flutter/components/colors.dart';
import 'package:user_crud_flutter/config/routes.dart';
import 'package:user_crud_flutter/views/add_comment/add_comment.dart';
import 'package:user_crud_flutter/views/add_comment/add_comment_state.dart';
import 'package:user_crud_flutter/views/list_posts/list_posts.dart';
import 'package:user_crud_flutter/views/list_posts/list_posts_state.dart';
import 'package:user_crud_flutter/views/login/login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ListPostsState()),
        ChangeNotifierProvider(create: (_) => AddCommentState())
      ],
      child: MaterialApp(
        title: 'User Posts',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: primaryBlue()),
          useMaterial3: true,
        ),
        home: LoginPage(),
        routes: {
          Routes.LIST_POSTS: (context) => const ListPosts(),
          Routes.ADD_COMMENT: (context) => const AddComment()
        },
      ),
    );
  }
}
