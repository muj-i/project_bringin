import 'package:get/get.dart';
import 'package:project_bringin/presentation/state_holders/comments_controller.dart';
import 'package:project_bringin/presentation/state_holders/posts_controller.dart';
import 'package:project_bringin/presentation/state_holders/users_controller.dart';

class StateHolderBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(UsersController());
    Get.put(PostsController());
    Get.put(CommentsController());
  }
}
