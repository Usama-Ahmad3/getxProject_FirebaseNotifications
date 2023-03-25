import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/model/login/user_model.dart';
import 'package:getx_project/repository/login_repository.dart';
import 'package:getx_project/res/routes/routename.dart';
import 'package:getx_project/utils/utils.dart';
import 'package:getx_project/view_model/controller/user_preferences_view_model.dart';

class login extends GetxController {
  UserPreferences userPreferences = UserPreferences();
  final _api = LogInRepository();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final passwordFocus = FocusNode().obs;
  final emailFocus = FocusNode().obs;
  RxBool loading = false.obs;

  void loginApi() {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text
    };
    _api.loginApi(data).then((value) {
      if (value['error'] == 'user not found') {
        Utils.snackBar('Login', value['error']);
      } else {
        User_model user_model = User_model(token: value['token']);
        userPreferences.saveUser(user_model).then((value) {
          Get.toNamed(RouteName.home_view);
        }).onError((error, stackTrace) {
          Utils.toastMessage(error.toString());
        });
        Utils.snackBar('error', 'Login Successful');
      }
      loading.value = false;
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('error', error.toString());
    });
  }
}
