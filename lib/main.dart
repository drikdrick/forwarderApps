// import 'package:bokshaulforwarder/LoginPage.dart';
import 'package:bokshaulforwarder/Resource/stylesheet.dart';
import 'package:bokshaulforwarder/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: biruUtama.withOpacity(0.2),
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Inter',
        primarySwatch: Colors.lightBlue,
        // textTheme: Theme.of(context).textTheme.(),
      ),
      home: Splashscreen(),
    );
  }
}
