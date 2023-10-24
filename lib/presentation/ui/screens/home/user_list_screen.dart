import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_bringin/presentation/state_holders/comments_controller.dart';
import 'package:project_bringin/presentation/state_holders/users_controller.dart';
import 'package:project_bringin/presentation/ui/screens/home/posts_list_screen.dart';
import 'package:project_bringin/presentation/ui/widgets/appbar_theme_change_icon.dart';
import 'package:project_bringin/presentation/ui/widgets/home/user_card.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List Screen'),
        centerTitle: false,
        actions: const [AppBarThemeChangeIcon()],
      ),
      body: GetBuilder<UsersController>(
        builder: (usersController) {
          if (usersController.getUsersInProgress == false) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {});
            });
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              final usersList = usersController.usersList;
              final commentsList = Get.find<CommentsController>().commentsList;
              if (index < usersList.length && index < commentsList.length) {
                final user = usersList[index];
                final userPost = commentsList[index];
                return InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () => Get.to(() => PostListScreen(
                        userId: user.id!,
                        name: user.name!,
                        postId: userPost.id!,
                      )),
                  child: UserCard(
                    userModel: user,
                    name: 'Full Name: ${user.name ?? ''}',
                    userName: 'User Name: ${user.username ?? ''}',
                    address: 'Address: ${user.address!.city ?? ''}',
                    email: 'Email: ${user.email ?? ''}',
                    phone: 'Phone: ${user.phone ?? ''}',
                  ),
                );
              }
              return null;
            },
            itemCount: usersController.usersList.length,
          );
        },
      ),
    );
  }
}
