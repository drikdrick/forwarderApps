import 'package:bokshaulforwarder/HomePage.dart';
// import 'package:bokshaulforwarder/InvoicePage.dart';
import 'package:bokshaulforwarder/Order/OrderPage.dart';
import 'package:bokshaulforwarder/Profile/ProfilePage.dart';
import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  late int bottomIndex;

  @override
  void initState() {
    super.initState();
    bottomIndex = 0;
  }

  List<BottomNavigationBarItem> _bottomItems = [
    BottomNavigationBarItem(
      label: 'Home',
      icon: Icon(
        Icons.home_outlined,
      ),
      activeIcon: Icon(
        Icons.home,
        color: Colors.blue,
      ),
    ),
    BottomNavigationBarItem(
      label: 'Order',
      icon: Icon(
        Icons.directions_car_filled_outlined,
      ),
      activeIcon: Icon(
        Icons.directions_car,
        color: Colors.blue,
      ),
    ),
    // BottomNavigationBarItem(
    //   label: 'Invoice',
    //   icon: Icon(
    //     Icons.article_outlined,
    //   ),
    //   activeIcon: Icon(
    //     Icons.article,
    //     color: Colors.blue,
    //   ),
    // ),
    BottomNavigationBarItem(
      label: 'Profile',
      icon: Icon(
        Icons.account_circle_outlined,
      ),
      activeIcon: Icon(
        Icons.account_circle,
        color: Colors.blue,
      ),
    ),
  ];

  //Pages
  List<Widget> _widget = [
    Home(),
    OrderPage(),
    // Invoice(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: Scaffold(
        //Top Bar
        // appBar: AppBar(
        //   elevation: 0,
        //   leading: Icon(Icons.menu),
        //   title: Text(
        //     bottomIndex == 2 ? "Profil" : "Joko Susilo",
        //     style: TextStyle(
        //       fontWeight: FontWeight.w500,
        //       fontSize: 22,
        //     ),
        //   ),
        //   centerTitle: true,
        //   actions: [
        //     IconButton(
        //       onPressed: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //             builder: (context) => Notifications(),
        //           ),
        //         );
        //       },
        //       icon: Icon(Icons.notifications),
        //     ),
        //   ],
        // ),
        body: _widget[bottomIndex],
        //Bottom NavBar
        bottomNavigationBar: BottomNavigationBar(
          items: _bottomItems,
          type: BottomNavigationBarType.fixed,
          currentIndex: bottomIndex,
          onTap: (value) {
            setState(() {
              bottomIndex = value;
            });
          },
        ),
      ),
    );
  }
}
