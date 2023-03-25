import 'package:getx_project/data/network/networkServices.dart';
import 'package:getx_project/res/appUrl/app_url.dart';

class LogInRepository {
  final _apiServices = NetworkServices();
  Future<dynamic> loginApi(
    var data,
  ) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.endPoint);
    return response;
  }
}
