import 'package:bokshaulforwarder/Model/invoice.dart';
import 'package:bokshaulforwarder/Resource/stylesheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import 'Resource/invoice_card.dart';

class Invoice extends StatefulWidget {
  const Invoice({Key? key}) : super(key: key);

  @override
  _InvoiceState createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  late Image imageNoUnpaid, imageNoPaid;

  @override
  void initState() {
    super.initState();
    imageNoUnpaid = Image.asset('images/null_unpaid.png');
    imageNoPaid = Image.asset('images/null_paid.png');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(imageNoUnpaid.image, context);
    precacheImage(imageNoPaid.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(
                text: "Unpaid",
              ),
              Tab(
                text: "Paid",
              ),
            ],
          ),
          body: TabBarView(
            children: [
              //Unpaid
              ListView(
                padding: EdgeInsets.zero,
                children: [
                  FutureBuilder<List>(
                    future: fetchInvoiceUnpaid(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List? invoiceUnpaid = snapshot.data;
                        print(invoiceUnpaid);
                        if (invoiceUnpaid!.length == 0) {
                          return Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 100,
                                ),
                                Image.asset('images/null_unpaid.png'),
                                Text(
                                  "Semua invoice sudah dibayar.",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          );
                        }
                        return Column(
                          children: invoiceUnpaid
                              .map(
                                (invoiceUnpaid) => Column(
                                  children: <Widget>[
                                    cardUnpaid(
                                      invoiceUnpaid.invoiceCode,
                                      invoiceUnpaid.dueDate,
                                      invoiceUnpaid.company,
                                    )
                                  ],
                                ),
                              )
                              .toList(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
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
              //Paid
              ListView(
                padding: EdgeInsets.zero,
                children: [
                  FutureBuilder<List>(
                    future: fetchInvoicePaid(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List? invoiceUnpaid = snapshot.data;
                        print(invoiceUnpaid);
                        if (invoiceUnpaid!.length == 0) {
                          return Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 100,
                                ),
                                Image.asset('images/null_paid.png'),
                                Text(
                                  "Belum ada invoice yang dibayar.",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          );
                        }
                        return Column(
                          children: invoiceUnpaid
                              .map(
                                (invoiceUnpaid) => Column(
                                  children: <Widget>[
                                    cardPaid(
                                      invoiceUnpaid.invoiceCode,
                                      invoiceUnpaid.dueDate,
                                      invoiceUnpaid.company,
                                    )
                                  ],
                                ),
                              )
                              .toList(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
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
