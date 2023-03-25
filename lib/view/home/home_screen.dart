import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/data/response/status.dart';
import 'package:getx_project/res/components/general_exception.dart';
import 'package:getx_project/res/components/internet_Exception.dart';
import 'package:getx_project/res/routes/routename.dart';
import 'package:getx_project/view_model/controller/homeController.dart';
import 'package:getx_project/view_model/controller/user_preferences_view_model.dart';
import 'package:getx_project/view_model/services/notification_services.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  NotificationServices notification = NotificationServices();
  final homeController = Get.put(HomeController());
  UserPreferences userPreferences = UserPreferences();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userListApi();
    notification.requestMessage();
    notification.getDeviceToken().then((value) {
      print('Token');
      print(value);
    });
    notification.refreshToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  userPreferences.removeUser();
                  Get.toNamed(RouteName.login);
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: Obx(() {
          switch (homeController.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(child: CircularProgressIndicator());
            case Status.ERROR:
              if (homeController.error.value == 'no internet') {
                return InternetException(onpress: () {
                  homeController.refreshListApi();
                });
              } else {
                return generalException(
                  onpress: () {
                    homeController.refreshListApi();
                  },
                );
              }
            case Status.COMPLETED:
              return ListView.builder(
                itemCount: homeController.userList.value.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(homeController
                          .userList.value.data![index].firstName
                          .toString()),
                      subtitle: Text(homeController
                          .userList.value.data![index].email
                          .toString()),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(homeController
                            .userList.value.data![index].avatar
                            .toString()),
                      ),
                    ),
                  );
                },
              );
          }
          return const SizedBox();
        }));
  }
}
