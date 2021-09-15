// import 'package:bokshaulforwarder/LoginPage.dart';
import 'package:bokshaulforwarder/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.blue.withOpacity(0.2),
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Inter',
        primaryColor: Colors.black,
        textTheme: TextTheme()
            .apply(bodyColor: Colors.black, displayColor: Colors.black),
      ),
      home: Splashscreen(),
    );
  }
}
