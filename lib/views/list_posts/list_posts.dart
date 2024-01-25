import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_crud_flutter/components/layouts.dart';
import 'package:user_crud_flutter/model/post.dart';
import 'package:user_crud_flutter/views/list_posts/list_posts_state.dart';

class ListPosts extends StatefulWidget {
  const ListPosts({super.key});

  @override
  State<StatefulWidget> createState() {
    return ListPostsStateFull();
  }
}

class ListPostsStateFull extends State<ListPosts> {
  Future<void> updateState(BuildContext context) async {
    setState(() {});
  }

  @override
  void initState() {
    print("initState");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return appWithBar(
        "Lista de Posts", buildActions(context), buildBody(context));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    setState(() {
      Provider.of<ListPostsState>(context, listen: false).findAllPosts();
    });
  }

  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          onPressed: () async {
            /*
            Navigator.of(context)
                .pushNamed(Routes.ADD_POST)
                .then((value) => setState(() {
                      Provider.of<ListPostsState>(context, listen: false)
                          .findAllPosts();
                    }));
                    */
          },
          icon: const Icon(Icons.add))
    ];
  }

  Widget buildBody(BuildContext context) {
    return Consumer<ListPostsState>(
        builder: (_, data, __) => Expanded(
                child: ListView.builder(
              itemCount: Provider.of<ListPostsState>(context, listen: false)
                  .postList
                  .length,
              itemBuilder: (context, index) {
                final post =
                    Provider.of<ListPostsState>(context).postList[index];

                return Card(
                  child: ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
                    trailing: Wrap(children: [
                      IconButton(
                          onPressed: () async {
                            onAddComment(context, post);
                          },
                          icon: const Icon(Icons.comment))
                    ]),
                  ),
                );
              },
            )));
  }

  void onAddComment(BuildContext context, Post post) async {
    /*
    Navigator.pushNamed(context, Routes.ADD_COMMENT,
            arguments: AddCommentArgs(post))
        .then((value) => setState(() {
              Provider.of<ListPostsState>(context, listen: false)
                  .postList
                  .length;
            }));
            */
  }
}
