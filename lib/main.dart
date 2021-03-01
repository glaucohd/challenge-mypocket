import 'package:flutter/material.dart';
import 'package:pocket_app/routes/app_routes.dart';
import 'package:pocket_app/views/home_view.dart';
import 'package:pocket_app/views/login_view.dart';
import 'package:pocket_app/views/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyPocket',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      routes: {
        AppRouters.LOGIN_VIEW: (context) => LoginView(),
        AppRouters.HOME_VIEW: (context) => HomeView(),
      },
    );
  }
}
