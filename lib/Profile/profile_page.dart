import 'package:bokshaulforwarder/Model/user.dart';
import 'package:bokshaulforwarder/Services/Authenticationi.dart';
import 'package:bokshaulforwarder/Setting/AppSettingPage.dart';
import 'package:bokshaulforwarder/Setting/HelpCentrePage.dart';
import 'package:bokshaulforwarder/Setting/PrivatePolicyPage.dart';
import 'package:bokshaulforwarder/Setting/TermsAndConditionPage.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:math';

// import '../Index.dart';
import 'edit_profile_page.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _isLoading = false;
  late User user;
  late String avatar;

  void initState() {
    super.initState();
    loadData();
    avatar = Random().nextInt(15).toString();
    print(avatar);
  }

  Future loadData() async {
    setState(() {
      _isLoading = true;
    });
    user = await getUserProfile();
    print(user.company);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: _isLoading
            ? CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(user.company),
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
                  _isLoading
                      ? SizedBox(
                          height: 60,
                          child: CircularProgressIndicator(),
                        )
                      : userProfile(user.username, user.phone, user.email),
                  Divider(),
                  settingOption(
                      context, "Edit Profile", EditProfile(), Icon(Icons.edit)),
                  Divider(),
                  settingOption(context, "Pengaturan Aplikasi", Setting(),
                      Icon(Icons.settings)),
                  Divider(),
                  settingOption(context, "Halaman Bantuan", HelpCentre(),
                      Icon(Icons.help_center)),
                  Divider(),
                  settingOption(context, "Kebijakan Privasi", PrivacyPolicy(),
                      Icon(Icons.privacy_tip)),
                  Divider(),
                  settingOption(context, "Syarat dan Ketentuan",
                      TermCondition(), Icon(Icons.quiz)),
                  Divider(),
                  InkWell(
                    onTap: () {
                      reset(context);
                    },
                    child: SizedBox(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(Icons.logout_rounded),
                              ),
                              Text(
                                "Logout",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                ],
              ),
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: Container(
              //     decoration: BoxDecoration(
              //       boxShadow: [
              //         BoxShadow(
              //           color: Colors.grey.withOpacity(0.5),
              //           spreadRadius: 2,
              //           blurRadius: 5,
              //           offset: Offset(0, 3), // changes position of shadow
              //         ),
              //       ],
              //     ),
              //     height: height * 0.05,
              //     width: width * 1,
              //     child: ElevatedButton(
              //       child: Text("Log Out"),
              //       onPressed: () {
              //         reset(context);
              //       },
              //       style: ElevatedButton.styleFrom(
              //         primary: Colors.red,
              //         textStyle: TextStyle(
              //           fontWeight: FontWeight.w400,
              //           color: Colors.white,
              //           fontSize: 18,
              //         ),
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget settingOption(context, headline, screen, iconData) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return screen;
          }),
        );
      },
      child: SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: iconData,
                ),
                Text(
                  headline,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          ],
        ),
      ),
    );
  }

  Widget userProfile(nama, noTelp, email) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 35,
          backgroundImage: AssetImage("images/avatar/" + avatar + ".png"),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nama,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              noTelp,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF767675),
              ),
            ),
            Text(
              email,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF767675),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget userShimmer() {
    return Column(
      children: [
        Shimmer(
          child: Container(
            width: double.infinity,
            height: 25,
            color: Colors.blue,
          ),
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0),
              Colors.white.withOpacity(0.5),
              Colors.black
            ],
          ),
        )
      ],
    );
  }
}
