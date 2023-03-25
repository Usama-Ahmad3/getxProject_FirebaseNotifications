import 'package:get/get.dart';
import 'package:getx_project/data/response/status.dart';
import 'package:getx_project/model/userListModel/userListModel.dart';
import 'package:getx_project/repository/userListRepository.dart';

class HomeController extends GetxController {
  final _api = HomeRepository();
  RxString error = ''.obs;
  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserListModel().obs;
  void setRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(UserListModel _value) => userList.value = _value;
  void setError(String value) => error.value = value;
  void userListApi() {
    _api.userListApi().then((value) {
      setRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRequestStatus(Status.ERROR);
    });
  }
  void refreshListApi() {
    setRequestStatus(Status.LOADING);
    _api.userListApi().then((value) {
      setRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRequestStatus(Status.ERROR);
    });
  }
}
