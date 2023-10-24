import 'package:flutter/material.dart';
import 'package:project_bringin/data/models/posts_model.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.postsModel,
    required this.postTitle,
    required this.postDescription,
  });

  final PostsModel postsModel;
  final String postTitle;
  final String postDescription;

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
                postTitle,
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                postDescription,
                style: const TextStyle(fontSize: 17),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
