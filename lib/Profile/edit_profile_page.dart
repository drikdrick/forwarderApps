import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:bokshaulforwarder/Model/user.dart';
import 'package:bokshaulforwarder/Resource/stylesheet.dart';
import 'package:bokshaulforwarder/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class EditProfile extends StatefulWidget {
  final User currentUser;
  const EditProfile({required this.currentUser});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late String avatar;
  bool isVisible = true;
  bool isLoading = false;
  TextEditingController companyController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    avatar = Random().nextInt(15).toString();
    companyController.text = widget.currentUser.company;
    usernameController.text = widget.currentUser.username;
    emailController.text = widget.currentUser.email;
    phoneController.text = widget.currentUser.phone;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.currentUser.username);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Edit Profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  CircleAvatar(
                    backgroundColor: biruUtama,
                    radius: 50,
                    backgroundImage:
                        AssetImage("images/avatar/" + avatar + ".png"),
                  ),
                  // Text(
                  //   "Edit Profil",
                  //   style: TextStyle(
                  //     fontSize: 14,
                  //     fontWeight: FontWeight.w600,
                  //     color: biruUtama,
                  //   ),
                  // ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: companyController,
                    decoration: InputDecoration(
                      labelText: "Nama Perusahaan",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: inputBorder),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: biruUtama),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    // initialValue: "test",
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: "Username",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: inputBorder),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: biruUtama),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    // initialValue: "test",
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: inputBorder),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: biruUtama),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    // initialValue: "test",
                    controller: phoneController,
                    decoration: InputDecoration(
                      prefix: Text("+62"),
                      labelText: "Nomor Telepon",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: inputBorder),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: biruUtama),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  SizedBox(
                    height: height * 0.075,
                    width: width * 0.55,
                    child: ElevatedButton(
                      child: Text("SIMPAN"),
                      onPressed: () {
                        setState(() {
                          isLoading = true;
                        });

                        updateProfile();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: biruUtama,
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          isLoading
              ? Center(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: loadingProcess(height, width),
                  ),
                )
              : SizedBox(
                  height: 0,
                ),
        ],
      ),
    );
  }

  void updateProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;
    int userId = prefs.getInt("idUser")!;
    Map data = {
      "id_customer": userId.toString(),
      "company": companyController.text,
      "username": usernameController.text,
      "email": emailController.text,
      "phone": phoneController.text,
    };
    Uri url =
        Uri.parse("https://apiflutter.forwarder.boksman.co.id/updateprofil");

    var response = await http.post(
      url,
      headers: {'token': token},
      body: data,
    );
    var jsonResponse;
    setState(() {
      isLoading = false;
    });
    if (response.statusCode == 201) {
      jsonResponse = json.decode(response.body);
      print(jsonResponse);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Index(index: 3),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: biruUtama,
          content: Text("Profil berhasil diperbaharui."),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("Profil gagal diperbaharui."),
        ),
      );
    }
  }
}
