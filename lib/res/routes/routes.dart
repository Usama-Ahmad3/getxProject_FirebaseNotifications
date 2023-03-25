import 'package:get/get.dart';
import 'package:getx_project/res/routes/routename.dart';
import 'package:getx_project/view/home/home_screen.dart';
import 'package:getx_project/view/login.dart';

import '../../view/splash_screen.dart';

class Routes {
  static appRoutes() => [
        GetPage(
            name: RouteName.splashscreen,
            page: () => const SplashScreen(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 250)),
        GetPage(
            name: RouteName.login,
            page: () => const LogIn(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 250)),
        GetPage(
            name: RouteName.home_view,
            page: () => const HomeView(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 250))
      ];
}
