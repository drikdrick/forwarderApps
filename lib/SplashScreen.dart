import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'Authentication/LoginPage.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    //Lama nya splashscreen
    Future.delayed(Duration(milliseconds: 1850), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    });
    super.initState();
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
}
