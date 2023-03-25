import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/res/components/round_button.dart';
import 'package:getx_project/utils/utils.dart';
import 'package:getx_project/view_model/controller/login_view_model.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final loginViewModel = Get.put(login());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'.tr),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'email_hint'.tr,
                      border: const OutlineInputBorder(),
                    ),
                    controller: loginViewModel.emailController.value,
                    focusNode: loginViewModel.emailFocus.value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.snackBar('email_hint'.tr, 'email'.tr);
                      }
                    },
                    onFieldSubmitted: (value) {
                      Utils.fieldFocusChange(
                          context,
                          loginViewModel.emailFocus.value,
                          loginViewModel.passwordFocus.value);
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'pass_hint'.tr,
                      border: const OutlineInputBorder(),
                    ),
                    obscureText: true,
                    controller: loginViewModel.passwordController.value,
                    focusNode: loginViewModel.passwordFocus.value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.snackBar('pass_hint'.tr, 'password'.tr);
                      }
                    },
                    onFieldSubmitted: (value) {
                      Utils.fieldFocusChange(
                          context,
                          loginViewModel.emailFocus.value,
                          loginViewModel.passwordFocus.value);
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
          Obx(() => RoundButton(
                loading: loginViewModel.loading.value,
                title: 'login'.tr,
                onPress: () {
                  if (_formKey.currentState!.validate()) {
                    loginViewModel.loginApi();
                  }
                },
                width: 200,
              ))
        ],
      ),
    );
  }
}
