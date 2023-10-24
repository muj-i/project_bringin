import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_bringin/data/models/comments_model.dart';
import 'package:project_bringin/presentation/state_holders/comments_controller.dart';
import 'package:project_bringin/presentation/ui/widgets/home/comment_card.dart';

class CommentListScreen extends StatefulWidget {
  const CommentListScreen(
      {Key? key, required this.postId, required this.postTitle})
      : super(key: key);

  final int postId;
  final String postTitle;

  @override
  State<CommentListScreen> createState() => _CommentListScreenState();
}

class _CommentListScreenState extends State<CommentListScreen> {
  List<CommentsModel> postComments = []; // List to hold comments

  @override
  void initState() {
    super.initState();

    postComments = getUserPostCommentsForPost(widget.postId);
  }

  List<CommentsModel> getUserPostCommentsForPost(int postId) {
    return Get.find<CommentsController>()
        .commentsList
        .where((comment) => comment.postId == postId)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.postTitle}\'s comments'),
      ),
      body: ListView.builder(
        itemCount: postComments.length,
        itemBuilder: (context, index) {
          return CommentCard(
              commentsModel: postComments[index],
              name: 'Name: ${postComments[index].name ?? ''}',
              email: 'Email: ${postComments[index].email ?? ''}',
              comment: 'Comment: ${postComments[index].body ?? ''}');
        },
      ),
    );
  }
}
