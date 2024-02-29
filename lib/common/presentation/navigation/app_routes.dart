import 'package:flutter/material.dart';
import 'package:layout_based_dual_screen/common/presentation/pages/container_page.dart';
import 'package:layout_based_dual_screen/home/presentation/pages/home_page.dart';
import 'package:layout_based_dual_screen/login/presentation/pages/login_page.dart';

class AppRoutes {
  static const String containerPage = '/container_page';

  static const String homePage = '/home_page';

  static const String loginPage = '/login_page';

  static Map<String, WidgetBuilder> routes = {
    containerPage: (context) => const ContainerPage(),
    homePage: (context) => const HomePage(),
    loginPage: (context) => const LoginPage(),
  };
}
