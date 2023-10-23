import 'package:flutter/material.dart';
import 'package:project_bringin/data/models/comments_model.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({
    super.key,
    required this.commentsModel,
    required this.name,
    required this.email,
    required this.comment,
  });

  final CommentsModel commentsModel;
  final String name;
  final String email;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                email,
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                comment,
                style: const TextStyle(fontSize: 17),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
