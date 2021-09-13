import 'package:bokshaulforwarder/Model/OrderJson.dart';
import 'package:bokshaulforwarder/Model/OrderDetailJson.dart';
import 'package:bokshaulforwarder/Order/PendingOrderPage.dart';
import 'package:bokshaulforwarder/Order/SuccessOrderPage.dart';
import 'package:bokshaulforwarder/Resource/OrderCard.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
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
              //Order Pending
              ListView(
                padding: EdgeInsets.zero,
                children: [
                  FutureBuilder<List>(
                    future: fetchOrderPending(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List? freshOrders = snapshot.data;
                        return new Column(
                          children: freshOrders!
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
                        return new Column(
                          children: freshOrders!
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
