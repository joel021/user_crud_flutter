import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_crud_flutter/components/layouts.dart';
import 'package:user_crud_flutter/config/routes.dart';
import 'package:user_crud_flutter/model/post.dart';
import 'package:user_crud_flutter/views/add_comment/add_comment_args.dart';
import 'package:user_crud_flutter/views/list_posts/list_posts_state.dart';
import 'package:user_crud_flutter/views/login/login_state.dart';

class ListPosts extends StatefulWidget {
  const ListPosts({super.key});

  @override
  State<StatefulWidget> createState() {
    return ListPostsStateFull();
  }
}

class ListPostsStateFull extends State<ListPosts> {
  @override
  Widget build(BuildContext context) {
    final ListPostsStateProvider provider =
        Provider.of<ListPostsStateProvider>(context, listen: false);
    provider.setUser(Provider.of<LoginStateProvider>(context).user);
    provider.findAllPosts();

    return appWithBar("Lista de Posts", buildBody());
  }

  List<Widget> barActions(BuildContext context) {
    return <Widget>[
      IconButton(
          onPressed: () async {
            Navigator.of(context)
                .pushNamed(Routes.ADD_POST)
                .then((value) => setState(() {
                      Provider.of<ListPostsStateProvider>(context)
                          .findAllPosts();
                    }));
          },
          icon: const Icon(Icons.add))
    ];
  }

  Widget buildBody() {
    return Consumer<ListPostsStateProvider>(
        builder: (context, provider, _) => buildList(context, provider));
  }

  Widget buildList(BuildContext context, ListPostsStateProvider provider) {
    return Column(children: [
      Expanded(
          child: ListView.builder(
        itemCount: provider.postList.length,
        itemBuilder: (context, index) {
          return buildItemList(provider, index);
        },
      ))
    ]);
  }

  void onAddCommentPressedButton(BuildContext context, Post post) {
    Navigator.pushNamed(context, Routes.ADD_COMMENT,
            arguments: AddCommentArgs(post))
        .then((value) => setState(() {
              context.read<ListPostsStateProvider>().findAllPosts();
            }));
  }

  Widget buildItemList(ListPostsStateProvider provider, int index) {
    final Post post = provider.postList[index];

    return Card(
      child: ListTile(
        title: Text(post.title),
        subtitle: Text(post.body),
        trailing: Wrap(children: [
          IconButton(
              onPressed: () => {onAddCommentPressedButton(context, post)},
              icon: const Icon(Icons.comment))
        ]),
      ),
    );
  }
}
