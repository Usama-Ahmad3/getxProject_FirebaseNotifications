import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_project/res/routes/routename.dart';
import 'package:getx_project/view_model/controller/user_preferences_view_model.dart';

class SplashServices {
  UserPreferences userPreferences = UserPreferences();
  void isLogIn() {
    userPreferences.getUser().then((value) {
      if (value.token!.isEmpty || value.token.toString() == '') {
        Timer(const Duration(seconds: 3), () {
          Get.toNamed(RouteName.login);
        });
      } else {
        Timer(const Duration(seconds: 3), () {
          Get.toNamed(RouteName.home_view);
        });
      }
    });
  }
}
