

import 'package:bokshaulforwarder/Authentication/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Logout
Future reset(context) async {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => LoginPage(),
    ),
  );
  prefs.clear();
}



//getProfile
