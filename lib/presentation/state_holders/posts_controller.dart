import 'package:get/get.dart';
import 'package:project_bringin/data/models/posts_model.dart';
import 'package:project_bringin/data/services/network_caller.dart';
import 'package:project_bringin/data/services/network_response.dart';
import 'package:project_bringin/data/utils/urls.dart';

class PostsController extends GetxController {
  bool _getPostsInProgress = false;
  String _errorMessage = '';
  final List<PostsModel> _postsList = [];

  bool get getPostsInProgress => _getPostsInProgress;
  String get errorMessage => _errorMessage;
  List<PostsModel> get postsList => _postsList;

  Future<void> getPostsList() async {
    _getPostsInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.posts);

    _getPostsInProgress = false;
    update();
    if (response.isSuccess) {
      var data = response.responseBody as List<dynamic>;
      _postsList.clear();
      for (Map<String, dynamic> postsMap in data) {
        _postsList.add(PostsModel.fromJson(postsMap));
      }
    } else {
      _errorMessage = 'Posts data fetch failed!';
    }
  }
}
