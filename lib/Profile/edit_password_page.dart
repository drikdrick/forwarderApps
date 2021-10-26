import 'dart:convert';
import 'dart:ui';

import '../Resource/stylesheet.dart';
import '../Services/config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class EditPassword extends StatefulWidget {
  const EditPassword({Key? key}) : super(key: key);

  @override
  _EditPasswordState createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  bool isVisible = true;
  bool isVisible2 = true;
  bool isVisible3 = true;
  bool isLoading = false;
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController retypePassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
          "Ganti Password",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: oldPassword,
                    obscureText: isVisible,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible == true
                                ? isVisible = false
                                : isVisible = true;
                          });
                        },
                        icon: Icon(isVisible
                            ? Icons.visibility_off_outlined
                            : Icons.remove_red_eye_outlined),
                      ),
                      labelText: "Password Lama",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: inputBorder,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: biruUtama),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password lama tidak boleh kosong.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: newPassword,
                    obscureText: isVisible2,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible2 == true
                                ? isVisible2 = false
                                : isVisible2 = true;
                          });
                        },
                        icon: Icon(isVisible2
                            ? Icons.visibility_off_outlined
                            : Icons.remove_red_eye_outlined),
                      ),
                      labelText: "Password Baru",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: inputBorder,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: biruUtama),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password baru tidak boleh kosong.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: retypePassword,
                    obscureText: isVisible3,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible3 == true
                                ? isVisible3 = false
                                : isVisible3 = true;
                          });
                        },
                        icon: Icon(isVisible3
                            ? Icons.visibility_off_outlined
                            : Icons.remove_red_eye_outlined),
                      ),
                      labelText: "Ulangi Password Baru",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: inputBorder,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: biruUtama),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ulangi password.';
                      } else if (value != newPassword.text) {
                        return 'Kedua password tidak sama.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  SizedBox(
                    height: height * 0.05,
                    width: width * 0.5,
                    child: ElevatedButton(
                      child: Text("SIMPAN"),
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          updatePassword();
                        }
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
                    filter: ImageFilter.blur(
                      sigmaX: 5,
                      sigmaY: 5,
                    ),
                    child: loadingProcess(
                      height,
                      width,
                    ),
                  ),
                )
              : SizedBox(
                  height: 0,
                ),
        ],
      ),
    );
  }

  void updatePassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int userId = prefs.getInt('idUser')!;

    Uri url =
        Uri.parse(baseUrl + "/profil/resetpassword");
    var response = await http.post(url, body: {
      "id_customer": userId.toString(),
      "old_password": oldPassword.text,
      "password": newPassword.text,
      "repassword": retypePassword.text,
    });
    var jsonResponse = jsonDecode(response.body);
    setState(() {
      isLoading = false;
    });
    if (jsonResponse["success"]) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: biruUtama,
          behavior: SnackBarBehavior.floating,
          content: Text("Password berhasil diperbaharui."),
        ),
      );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: merah,
          behavior: SnackBarBehavior.floating,
          content: Text("Password lama salah. Coba lagi."),
        ),
      );
    }
  }
}
