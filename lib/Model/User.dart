// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.company,
    required this.address,
    required this.contact,
    required this.phone,
    required this.email,
    required this.username,
  });

  String company;
  String address;
  String contact;
  String phone;
  String email;
  String username;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      company: json["company"],
      address: json["address"] ?? "Unknown",
      contact: json["contact"] ?? "Unknown",
      phone: json["phone"],
      email: json["email"],
      username: json["username"],
    );
  }


  Map<String, dynamic> toJson() => {
        "company": company,
        "address": address,
        "contact": contact,
        "phone": phone,
        "email": email,
        "username": username,
      };
}

Future<User> getUserProfile() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token')!; //fetch Token
  int userId = prefs.getInt('idUser')!;

  Uri url = Uri.parse(
      "https://apiflutter.forwarder.boksman.co.id/dataprofil/$userId");
  var jsonResponse = await http.get(url, headers: {'token': token});
  var jsonObject = jsonDecode(jsonResponse.body);

  var userData = (jsonObject as Map<String, dynamic>)['data'];
  // print(userData[0]);
  return User.fromJson(userData[0]);
}
