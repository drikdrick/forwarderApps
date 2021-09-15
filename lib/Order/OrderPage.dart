import 'package:bokshaulforwarder/Model/OrderJson.dart';
import 'package:bokshaulforwarder/Model/OrderDetailJson.dart';
import 'package:bokshaulforwarder/Order/PendingOrderPage.dart';
import 'package:bokshaulforwarder/Order/SuccessOrderPage.dart';
import 'package:bokshaulforwarder/Resource/OrderCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  late Image imageOrderDone, imageOrderPending, imageOrderOngoing;
  
  @override
  void initState(){
    super.initState();
    imageOrderDone = Image.asset('images/null_done.png');
    imageOrderPending = Image.asset('images/null_pending.png');
    imageOrderOngoing = Image.asset('images/null_ongoing.png');
  }
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    precacheImage(imageOrderDone.image, context);
    precacheImage(imageOrderPending.image, context);
    precacheImage(imageOrderOngoing.image, context);
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(
                text: "Berlangsung",
              ),
              Tab(
                text: "Pending",
              ),
              Tab(
                text: "Selesai",
              ),
            ],
          ),
          body: TabBarView(
            children: [
              //Order Berlangsung
              ListView(
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
                              SizedBox(
                                height: 100,
                              ),
                              imageOrderOngoing,
                              Text(
                                "Belum ada order yang berlangsung.",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ],
                          );
                        }
                        return new Column(
                          children: freshOrders
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
              //Order Pending
              ListView(
                padding: EdgeInsets.zero,
                children: [
                  FutureBuilder<List>(
                    future: fetchOrderPending(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List? freshOrders = snapshot.data;
                        if (freshOrders!.length == 0) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 100,
                              ),
                              imageOrderPending,
                              Text(
                                "Belum ada order yang ditunda.",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ],
                          );
                        }
                        return new Column(
                          children: freshOrders
                              .map((freshOrders) => new Column(
                                    children: <Widget>[
                                      InkWell(
                                        child: cardPendingOrder(
                                          freshOrders.gkOrder,
                                          freshOrders.name,
                                          freshOrders.noContainer,
                                          freshOrders.addressPort,
                                          freshOrders.namaPort,
                                          freshOrders.addressGudang,
                                          freshOrders.namaGudang,
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  PendingOrder(
                                                      freshOrder: freshOrders),
                                            ),
                                          );
                                        },
                                      )
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
              //Order Selesai
              ListView(
                padding: EdgeInsets.zero,
                children: [
                  FutureBuilder<List>(
                    future: fetchOrderDone(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List? freshOrders = snapshot.data;
                        if (freshOrders!.length == 0) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 100,
                              ),
                              imageOrderDone,
                              Text(
                                "Belum ada order yang selesai.",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ],
                          );
                        }
                        print(freshOrders);
                        return new Column(
                          children: freshOrders
                              .map(
                                (freshOrders) => new Column(
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SuccessOrder(
                                                freshOrder: freshOrders),
                                          ),
                                        );
                                      },
                                      child: cardDoneOrder(
                                          freshOrders.gkOrder ?? "Uknown",
                                          freshOrders.name ?? "Uknown",
                                          freshOrders.noContainer ?? "Uknown",
                                          freshOrders.addressPort ?? "Uknown",
                                          freshOrders.namaPort ?? "Uknown",
                                          freshOrders.addressGudang ?? "Uknown",
                                          freshOrders.namaGudang ?? "Uknown"),
                                    )
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
            ],
          ),
        ),
      ),
    );
  }
}
