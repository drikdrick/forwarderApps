import 'package:bokshaulforwarder/announcement_page.dart';
import 'package:bokshaulforwarder/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'Model/order_json.dart';
import 'Resource/order_card.dart';

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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Announcement(),
                            ),
                          );
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
                          return Index(
                            index: 1,
                          );
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
                      if (freshOrders!.length == 0) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('images/null_ongoing.png'),
                            Text(
                              "Belum ada order yang berlangsung.",
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ],
                        );
                      }
                      return new Column(
                        children: freshOrders
                            .map(
                              (freshOrders) => new Column(
                                children: <Widget>[
                                  cardOnGoingOrder(
                                      freshOrders.gkOrder,
                                      freshOrders.name,
                                      freshOrders.noContainer,
                                      freshOrders.addressPort,
                                      freshOrders.namaPort,
                                      freshOrders.namaGudang,
                                      freshOrders.addressGudang)
                                ],
                              ),
                            )
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
}
