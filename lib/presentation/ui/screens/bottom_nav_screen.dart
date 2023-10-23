import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:project_bringin/presentation/state_holders/comments_controller.dart';
import 'package:project_bringin/presentation/state_holders/posts_controller.dart';
import 'package:project_bringin/presentation/state_holders/users_controller.dart';
import 'package:project_bringin/presentation/ui/screens/home/user_list_screen.dart';
import 'package:project_bringin/presentation/ui/screens/search/search_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedScreenIndex = 0;
  final List<Widget> _screens = const [
    UserListScreen(),
    SearchScreen(),
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<UsersController>().getUsersList();
      Get.find<PostsController>().getPostsList();
      Get.find<CommentsController>().getCommentsList();
    });
    super.initState();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _checkInternetConnectivity();
  // }

  // Future<void> _checkInternetConnectivity() async {
  //   final connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.mobile ||
  //       connectivityResult == ConnectivityResult.wifi) {
  //     setState(() {
  //       _selectedScreenIndex = 0;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedScreenIndex,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        showUnselectedLabels: true,
        onTap: (int index) {
          setState(() {
            _selectedScreenIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              IconlyBroken.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconlyBroken.search,
            ),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}
