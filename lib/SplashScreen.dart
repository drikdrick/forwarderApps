import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Authentication/LoginPage.dart';
import 'index.dart';
import 'package:http/http.dart' as http;

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    //Lama nya splashscreen
    Future.delayed(Duration(milliseconds: 1850), () {
      navigateUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Color(0xFF1FA7EC),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Image.asset(
              "images/Boksman_White.png",
              width: MediaQuery.of(context).size.width * 0.3,
            ),
            SizedBox(
              height: 300,
            ),
            SizedBox(
              width: 240,
              child: Lottie.asset('assets/splash-loading.json'),
            ),
          ],
        ),
      ),
    );
  }

  void navigateUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool('isLoggedIn') ?? false;
    // String token = prefs.getString('token') ?? "null"; //fetch Token

    // Uri url = Uri.parse(
    //     "https://apiflutter.forwarder.boksman.co.id/orderberlangsung/22");

    // var response = await http.get(url, headers: {'token': token});
    // var jsonResult;
    // jsonResult = jsonDecode(response.body);
    // print(jsonResult['status']);
    // print(jsonResult);
    print(status);
    if (status) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => Index(),
          ),
          (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
          (route) => false);
    }
  }
}
