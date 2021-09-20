import 'dart:math';

import 'package:bokshaulforwarder/Model/user.dart';
import 'package:bokshaulforwarder/Resource/stylesheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  final User currentUser;
  const EditProfile({required this.currentUser});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late String avatar;
  bool isVisible = true;
  TextEditingController namaController = TextEditingController();
  TextEditingController noHandphone = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    avatar = Random().nextInt(15).toString();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.currentUser.company);
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
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 25,
              ),
              CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 50,
                backgroundImage: AssetImage("images/avatar/" + avatar + ".png"),
              ),
              Text(
                "Edit Profil",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: namaController,
                decoration: InputDecoration(
                  labelText: "Nama Lengkap",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: inputBorder),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.currentUser.phone,
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    OutlinedButton(
                      child: Text("Ubah"),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Username",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: inputBorder),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.currentUser.email,
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    OutlinedButton(
                      child: Text("Ubah"),
                      onPressed: () {},
                    ),
                  ],
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
                  onPressed: () {},
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
    );
  }
}
