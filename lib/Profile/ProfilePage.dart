import 'package:bokshaulforwarder/Setting/AppSettingPage.dart';
import 'package:bokshaulforwarder/Setting/HelpCentrePage.dart';
import 'package:bokshaulforwarder/Setting/PrivatePolicyPage.dart';
import 'package:bokshaulforwarder/Setting/TermsAndConditionPage.dart';
import 'package:flutter/material.dart';

import '../Index.dart';
import 'EditProfilePage.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Nama Perusahaan"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  // Align(
                  //   alignment: Alignment.topCenter,
                  //   child: Text(
                  //     "Nama Perusahaan",
                  //     style: TextStyle(
                  //       fontSize: 14,
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //   ),
                  // ),
                  // Divider(),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: width * 0.075,
                      ),
                      SizedBox(
                        width: width * 0.05,
                      ),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            userProfile("Nama Lengkap", "No Telepon", "Email"),
                            Icon(Icons.edit_outlined),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  settingOption(
                    "Edit Profile",
                    EditProfile(),
                  ),
                  Divider(),
                  settingOption(
                    "Pengaturan Aplikasi",
                    Setting(),
                  ),
                  Divider(),
                  settingOption(
                    "Halaman Bantuan",
                    HelpCentre(),
                  ),
                  Divider(),
                  settingOption(
                    "Kebijakan Privasi",
                    PrivacyPolicy(),
                  ),
                  Divider(),
                  settingOption(
                    "Syarat dan Ketentuan",
                    TermCondition(),
                  ),
                  Divider(),
                  // settingOption(
                  //   "Halaman Bantuan",
                  //   ,
                  // ),
                  // Divider(),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  height: height * 0.05,
                  width: width * 1,
                  child: ElevatedButton(
                    child: Text("Log Out"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Index(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget settingOption(headline, screen) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return screen;
          }),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            headline,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 15,
          ),
        ],
      ),
    );
  }

  Widget userProfile(nama, noTelp, email) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nama,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          noTelp,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Color(0xFF767675),
          ),
        ),
        Text(
          email,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Color(0xFF767675),
          ),
        ),
      ],
    );
  }
}
