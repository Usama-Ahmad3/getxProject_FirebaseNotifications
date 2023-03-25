import 'package:getx_project/data/network/networkServices.dart';
import 'package:getx_project/model/userListModel/userListModel.dart';
import 'package:getx_project/res/appUrl/app_url.dart';

class HomeRepository {
  final _apiServices = NetworkServices();
  Future<dynamic> userListApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.getUrl);
    return UserListModel.fromJson(response);
  }
}
