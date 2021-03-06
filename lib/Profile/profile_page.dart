import '../Model/user.dart';
import 'edit_password_page.dart';
import '../Resource/stylesheet.dart';
import '../Services/Authenticationi.dart';
import '../Setting/HelpCentrePage.dart';
import '../Setting/PrivatePolicyPage.dart';
import '../Setting/TermsAndConditionPage.dart';
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

  @override
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
    return Scaffold(
      appBar: AppBar(
        title: _isLoading
            ? CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(user.company),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      userProfile(user.username, user.phone, user.email),
                      Divider(),
                      settingOption(
                        context,
                        "Edit Profile",
                        EditProfile(
                          currentUser: user,
                        ),
                        Icon(Icons.edit),
                      ),
                      Divider(),
                      settingOption(
                        context,
                        "Ganti Password",
                        EditPassword(),
                        Icon(Icons.lock),
                      ),
                      Divider(),
                      settingOption(
                        context,
                        "Halaman Bantuan",
                        HelpCentre(),
                        Icon(Icons.help_center),
                      ),
                      Divider(),
                      settingOption(
                        context,
                        "Kebijakan Privasi",
                        PrivacyPolicy(),
                        Icon(Icons.privacy_tip),
                      ),
                      Divider(),
                      settingOption(
                        context,
                        "Syarat dan Ketentuan",
                        TermCondition(),
                        Icon(Icons.quiz),
                      ),
                      Divider(),
                    ],
                  ),
                  SizedBox(
                    width: 115,
                    height: 50,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: merah,
                        side: BorderSide(color: merah),
                      ),
                      onPressed: () {
                        reset(context);
                      },
                      child: Text("Log Out"),
                    ),
                  ),
                ],
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
          backgroundColor: biruUtama,
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
            color: biruUtama,
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
