import 'package:get/get.dart';
import 'package:project_bringin/data/models/users_model.dart';
import 'package:project_bringin/data/services/network_caller.dart';
import 'package:project_bringin/data/services/network_response.dart';
import 'package:project_bringin/data/utils/urls.dart';

class UsersController extends GetxController {
  bool _getUsersInProgress = false;
  String _errorMessage = '';
  final List<UsersModel> _usersList = [];

  bool get getUsersInProgress => _getUsersInProgress;
  String get errorMessage => _errorMessage;
  List<UsersModel> get usersList => _usersList;

  Future<void> getUsersList() async {
    _getUsersInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.users);

    _getUsersInProgress = false;
    update();
    if (response.isSuccess) {
      var data = response.responseBody as List<dynamic>;
      _usersList.clear();
      for (Map<String, dynamic> usersMap in data) {
        _usersList.add(UsersModel.fromJson(usersMap));
      }
    } else {
      _errorMessage = 'Users data fetch failed!';
    }
  }
}
