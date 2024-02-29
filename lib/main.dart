import 'package:flutter/material.dart';
import 'package:layout_based_dual_screen/common/presentation/navigation/app_routes.dart';
import 'package:layout_based_dual_screen/common/presentation/state/controller_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.black,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      initialRoute: AppRoutes.loginPage,
      routes: AppRoutes.routes,
    );
  }
}
