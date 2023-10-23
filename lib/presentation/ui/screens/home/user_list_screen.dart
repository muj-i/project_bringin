import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_bringin/presentation/state_holders/comments_controller.dart';
import 'package:project_bringin/presentation/state_holders/users_controller.dart';
import 'package:project_bringin/presentation/ui/screens/home/posts_list_screen.dart';
import 'package:project_bringin/presentation/ui/widgets/appbar_icon.dart';
import 'package:project_bringin/presentation/ui/widgets/user_card.dart';

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
        title: const Text('Home Screen'),
        centerTitle: false,
        actions: const [AppBarIcon()],
      ),
      body: GetBuilder<UsersController>(
        builder: (usersController) {
          return Visibility(
            visible: usersController.getUsersInProgress == false,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: ListView.builder(
              itemBuilder: (context, index) {
                final user = usersController.usersList[index];
                final userPost =
                    Get.find<CommentsController>().commentsList[index];
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
              },
              itemCount: usersController.usersList.length,
            ),
          );
        },
      ),
    );
  }
}
