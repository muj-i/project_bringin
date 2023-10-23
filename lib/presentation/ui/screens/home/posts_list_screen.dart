import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_bringin/data/models/posts_model.dart';
import 'package:project_bringin/presentation/state_holders/posts_controller.dart';
import 'package:project_bringin/presentation/ui/screens/home/comments_list_screen.dart';
import 'package:project_bringin/presentation/ui/widgets/post_card.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen(
      {super.key,
      required this.userId,
      required this.postId,
      required this.name});
  final int userId;
  final String name;
  final int postId;

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  List<PostsModel> userPosts = [];

  @override
  void initState() {
    super.initState();

    userPosts = getUsersPostsForUser(widget.userId);
  }

  List<PostsModel> getUsersPostsForUser(int userId) {
    return Get.find<PostsController>()
        .postsList
        .where((post) => post.userId == userId)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.name}\'s posts'),
      ),
      body: ListView.builder(
        itemCount: userPosts.length,
        itemBuilder: (context, index) {
          var posts = userPosts[index];
          return InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => Get.to(() => CommentListScreen(
                  postId: posts.id!,
                  postTitle: posts.title!,
                )),
            child: PostCard(
              postsModel: userPosts[index],
              postTitle: 'Post Title: ${userPosts[index].title ?? ' '}',
              postDescription:
                  'Post Description: ${userPosts[index].body ?? ''}',
            ),
          );
        },
      ),
    );
  }
}
