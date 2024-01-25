import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_crud_flutter/model/comment.dart';
import 'package:user_crud_flutter/model/post.dart';
import 'package:user_crud_flutter/views/add_comment/add_comment_args.dart';
import 'package:user_crud_flutter/views/add_comment/add_comment_state.dart';

class AddComment extends StatefulWidget {
  const AddComment({super.key});

  @override
  State<StatefulWidget> createState() {
    return AddCommentStateFull();
  }
}

class AddCommentStateFull extends State<AddComment> {
  final commentController = TextEditingController();

  Future<void> updateState(BuildContext context) async {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final AddCommentArgs args =
        ModalRoute.of(context)!.settings.arguments as AddCommentArgs;
    final Post post = args.post;
    final stateProvider = Provider.of<AddCommentState>(context);
    stateProvider.updateComments(post);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
      ),
      body: Consumer<AddCommentState>(
        builder: (context, provider, _) => Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post.title),
                  const SizedBox(height: 16),
                  Text(post.body)
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: commentController,
                      decoration: const InputDecoration(
                        hintText: 'Add a comment',
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  TextButton(
                    onPressed: () => {
                      //stateProvider.addComment(Comment(post.id, null, null, email, body))
                    },
                    child: const Text('Comment'),
                  ),
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: provider.commentList.length,
                itemBuilder: (context, index) {
                  final Comment comment = provider.commentList[index];
                  return ListTile(
                    title: Text(comment.name),
                    subtitle: Text(comment.body),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
