// import 'package:bokshaulforwarder/AnnouncementPage.dart';
// import 'package:bokshaulforwarder/Model/OrderJson.dart';
import 'package:bokshaulforwarder/Model/OrderJson.dart';
import 'package:bokshaulforwarder/Order/OrderPage.dart';
import 'package:bokshaulforwarder/Resource/stylesheet.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';

final List<String> imgList = [
  'images/profitGanda.jpeg',
  'images/freeMonitoring.jpeg',
  'images/jaminanUnitReady.jpeg',
];

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                child: CarouselSlider(
                  carouselController: _controller,
                  options: CarouselOptions(
                    viewportFraction: 1,
                    aspectRatio: 1.5 / 1,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(
                        () {
                          _current = index;
                        },
                      );
                    },
                  ),
                  items: imgList
                      .map(
                        (item) => Container(
                          child: Image.asset(
                            item,
                            fit: BoxFit.fill,
                            width: width,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 30.0,
                          height: 2.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(
                                  _current == entry.key ? 1 : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 35, right: 20),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.50),
                      child: IconButton(
                        onPressed: () async {
                          setState(() {});
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          var status = prefs.getString('token') ?? false;
                          print(status);
                        },
                        icon: Icon(
                          Icons.notifications_none_outlined,
                          color: Colors.black.withOpacity(0.75),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                width * 0.05, height * 0.025, width * 0.05, height * 0.025),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order Berlangsung",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return OrderPage();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Lihat Semua",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                FutureBuilder<List>(
                  future: fetchOrderBerlangsung(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List? freshOrders = snapshot.data;
                      return new Column(
                        children: freshOrders!
                            .map((freshOrders) => new Column(
                                  children: <Widget>[
                                    cardOnGoingOrder(
                                        freshOrders.gkOrder ?? "Uknown",
                                        freshOrders.name ?? "Uknown",
                                        freshOrders.noContainer ?? "Uknown",
                                        freshOrders.addressPort ?? "Uknown",
                                        freshOrders.namaPort ?? "Uknown",
                                        freshOrders.namaGudang ?? "Uknown",
                                        freshOrders.addressGudang ?? "Uknown")
                                  ],
                                ))
                            .toList(),
                      );
                    } else if (snapshot.hasError) {
                      return Text(
                        snapshot.error.toString(),
                      );
                    }
                    return new Center(
                      child: new Column(
                        children: <Widget>[
                          new Padding(padding: new EdgeInsets.all(50.0)),
                          new CircularProgressIndicator(),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget cardOnGoingOrder(orderId, driverName, containerId, addressPort,
      namePort, addressWarehouse, nameWarehouse) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        orderId,
                        style: TextStyle(
                            // color: Colors.black.withOpacity(0.8),
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            "Ongoing",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: hijau,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      )
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey,
                  ),
                ],
              ),
              Text(
                driverName,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                containerId,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      radius: 10,
                      child: Icon(
                        Icons.location_on_outlined,
                        size: 15,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            addressPort,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            namePort,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF6D6C6B),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Divider(
                thickness: 1,
                color: Colors.blue,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      radius: 10,
                      child: Icon(
                        Icons.lens_outlined,
                        size: 15,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            addressWarehouse,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            nameWarehouse,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF6D6C6B),
                            ),
                          ),
                          // Row(
                          //   children: [],
                          // )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
