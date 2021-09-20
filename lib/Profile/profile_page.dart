import 'package:bokshaulforwarder/Model/user.dart';
import 'package:bokshaulforwarder/Profile/edit_password_page.dart';
import 'package:bokshaulforwarder/Services/Authenticationi.dart';
import 'package:bokshaulforwarder/Setting/AppSettingPage.dart';
import 'package:bokshaulforwarder/Setting/HelpCentrePage.dart';
import 'package:bokshaulforwarder/Setting/PrivatePolicyPage.dart';
import 'package:bokshaulforwarder/Setting/TermsAndConditionPage.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
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
  }

  Future loadData() async {
    setState(() {
      _isLoading = true;
    });
    user = await getUserProfile();
    // print(user.company);
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
        child: SingleChildScrollView(
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
                    _isLoading
                        ? Container()
                        : settingOption(
                            context,
                            "Edit Profile",
                            EditProfile(
                              currentUser: user,
                            ),
                            Icon(Icons.edit)),
                    // Divider(),
                    // settingOption(context, "Pengaturan Aplikasi", Setting(),
                    //     Icon(Icons.settings)),
                    Divider(),
                    settingOption(context, "Ganti Password", EditPassword(),
                        Icon(Icons.lock)),
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
              ],
            ),
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
              "+62" + noTelp,
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
