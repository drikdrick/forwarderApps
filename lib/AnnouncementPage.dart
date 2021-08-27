import 'package:bokshaulforwarder/Promotion.dart';
import 'package:flutter/material.dart';
import 'NotificationPage.dart';

class Announcement extends StatefulWidget {
  const Announcement({Key? key}) : super(key: key);

  @override
  _AnnouncementState createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                labelColor: Colors.black,
                tabs: [
                  Tab(
                    text: "Promo",
                  ),
                  Tab(
                    text: "Notifikasi",
                  ),
                ],
              ),
              backgroundColor: Colors.white,
              title: Text(
                "Info",
                style: TextStyle(color: Colors.black),
              ),
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              elevation: 1,
            ),
            body: TabBarView(children: [
              Promotion(),
              NotificationPage(),
              // Notification()
            ])),
      ),
    );
  }

  Widget notifContent(){
    return ListView();
  }
}
