import 'package:get/get.dart';
import 'package:project_bringin/data/models/comments_model.dart';
import 'package:project_bringin/data/services/network_caller.dart';
import 'package:project_bringin/data/services/network_response.dart';
import 'package:project_bringin/data/utils/urls.dart';

class CommentsController extends GetxController {
  bool _getCommentsInProgress = false;
  String _errorMessage = '';
  final List<CommentsModel> _commentsList = [];

  bool get getCommentsInProgress => _getCommentsInProgress;
  String get errorMessage => _errorMessage;
  List<CommentsModel> get commentsList => _commentsList;

  Future<void> getCommentsList() async {
    _getCommentsInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.comments);

    _getCommentsInProgress = false;
    update();
    if (response.isSuccess) {
      var data = response.responseBody as List<dynamic>;
      _commentsList.clear();
      for (Map<String, dynamic> userPostCommentsMap in data) {
        _commentsList.add(CommentsModel.fromJson(userPostCommentsMap));
      }
    } else {
      _errorMessage = 'Comments data fetch failed!';
    }
  }
}
