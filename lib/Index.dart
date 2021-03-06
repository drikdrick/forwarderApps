import 'Resource/stylesheet.dart';
import 'home_page.dart';
import 'Order/order_page.dart';
import 'Profile/profile_page.dart';
import 'Order/invoice_page.dart';
import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  final int index;
  const Index({required this.index});
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  late int bottomIndex;

  @override
  void initState() {
    super.initState();
    bottomIndex = widget.index;
  }

  List<BottomNavigationBarItem> _bottomItems = [
    BottomNavigationBarItem(
      label: 'Home',
      icon: Icon(
        Icons.home_outlined,
      ),
      activeIcon: Icon(
        Icons.home,
        color: biruUtama,
      ),
    ),
    BottomNavigationBarItem(
      label: 'Order',
      icon: Icon(
        Icons.directions_car_filled_outlined,
      ),
      activeIcon: Icon(
        Icons.directions_car,
        color: biruUtama,
      ),
    ),
    BottomNavigationBarItem(
      label: 'Invoice',
      icon: Icon(
        Icons.article_outlined,
      ),
      activeIcon: Icon(
        Icons.article,
        color: biruUtama,
      ),
    ),
    BottomNavigationBarItem(
      label: 'Profile',
      icon: Icon(
        Icons.account_circle_outlined,
      ),
      activeIcon: Icon(
        Icons.account_circle,
        color: biruUtama,
      ),
    ),
  ];

  //Pages
  List<Widget> _widget = [
    Home(),
    OrderPage(),
    Invoice(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Inter',
      ),
      home: Scaffold(
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
