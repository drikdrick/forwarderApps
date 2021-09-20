import 'dart:ui';

import 'package:bokshaulforwarder/Resource/stylesheet.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                        borderSide: BorderSide(color: Colors.blue),
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
                        icon: Icon(isVisible
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
                        borderSide: BorderSide(color: Colors.blue),
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
                        icon: Icon(isVisible
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
                        borderSide: BorderSide(color: Colors.blue),
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
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
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
                      sigmaX: 10,
                      sigmaY: 10,
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

    String token = prefs.getString('token')!;
    int userId = prefs.getInt('idUser')!;
  }
}
