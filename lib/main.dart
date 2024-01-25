import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_crud_flutter/components/colors.dart';
import 'package:user_crud_flutter/config/routes.dart';
import 'package:user_crud_flutter/views/list_posts/list_posts.dart';
import 'package:user_crud_flutter/views/list_posts/list_posts_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ListPostsState())],
      child: MaterialApp(
        title: 'User Posts',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: primaryBlue()),
          useMaterial3: true,
        ),
        home: const MyHomePageState(),
        routes: {Routes.LIST_POSTS: (context) => const ListPosts()},
      ),
    );
  }
}

class MyHomePageState extends StatelessWidget {
  const MyHomePageState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("User Posts"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('hello'),
            Text('Hello', style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.LIST_POSTS);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
