import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_crud_flutter/components/forms.dart';
import 'package:user_crud_flutter/components/layouts.dart';
import 'package:user_crud_flutter/model/comment.dart';
import 'package:user_crud_flutter/model/post.dart';
import 'package:user_crud_flutter/views/add_comment/add_comment_args.dart';
import 'package:user_crud_flutter/views/add_comment/add_comment_state.dart';
import 'package:user_crud_flutter/views/login/login_state.dart';

import '../../model/user.dart';

class AddComment extends StatefulWidget {
  const AddComment({super.key});

  @override
  State<StatefulWidget> createState() {
    return AddCommentStateFull();
  }
}

class AddCommentStateFull extends State<AddComment> {
  final textEditingController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final AddCommentArgs args =
        ModalRoute.of(context)!.settings.arguments as AddCommentArgs;
    final Post post = args.post;
    final stateProvider =
        Provider.of<AddCommentStateProvider>(context, listen: false);
    stateProvider.updateComments(post);

    final User? userFromProvider =
        Provider.of<LoginStateProvider>(context, listen: false).user;
    final User user = User(
        userFromProvider?.id ?? 0,
        userFromProvider?.name,
        userFromProvider?.username ?? "",
        userFromProvider?.phone ?? "",
        userFromProvider?.email);
    return appWithBar("Comentários na Postagem", buildBody(post, user));
  }

  Widget buildBody(Post post, User user) {
    return Consumer<AddCommentStateProvider>(
        builder: (context, provider, _) => Column(
              children: [
                paddedContainer(post.title, post.title),
                const Divider(),
                singleInputButton(
                    "Comente",
                    "Comentar",
                    textEditingController,
                    formKey,
                    () => onCommentButtonPressed(
                        provider, textEditingController, post.id ?? 0, user)),
                const Divider(),
                buildListContext(provider)
              ],
            ));
  }

  Widget buildListContext(AddCommentStateProvider provider) {
    return Expanded(
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
    );
  }

  onCommentButtonPressed(AddCommentStateProvider provider,
      TextEditingController textEditingController, int postId, User user) {
    if (formKey.currentState?.validate() ?? false) {
      final Comment comment = Comment(postId, null, user.name ?? "",
          user.email ?? "", textEditingController.text);

      provider.postComment(comment);
    }
  }
}
