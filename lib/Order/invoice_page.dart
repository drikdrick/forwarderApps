import 'dart:ui';

import 'package:bokshaulforwarder/Model/invoice.dart';
import 'package:bokshaulforwarder/Model/invoice_detail.dart';
import 'package:bokshaulforwarder/Order/invoice_detail_page.dart';
import 'package:bokshaulforwarder/Order/invoice_detail_paid.dart';
import 'package:bokshaulforwarder/Resource/error_return.dart';
import 'package:bokshaulforwarder/Resource/stylesheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import '../Resource/invoice_card.dart';

class Invoice extends StatefulWidget {
  const Invoice({Key? key}) : super(key: key);

  @override
  _InvoiceState createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  late Image imageNoUnpaid, imageNoPaid;
  bool isLoading = false;

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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
            body: Stack(
              children: [
                TabBarView(
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
                              // print(invoiceUnpaid);
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
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
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
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                isLoading = true;
                                              });
                                              getInvoiceDetail(
                                                      invoiceUnpaid.invoiceCode)
                                                  .then((value) {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        InvoiceDetail(
                                                      currentInvoice: value,
                                                    ),
                                                  ),
                                                );
                                                setState(() {
                                                  isLoading = false;
                                                });
                                              });
                                            },
                                            child: cardUnpaid(
                                              invoiceUnpaid.invoiceCode,
                                              invoiceUnpaid.dueDate,
                                              invoiceUnpaid.company,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                    .toList(),
                              );
                            } else if (snapshot.hasError) {
                              return throwError(context);
                            }
                            return new Center(
                              child: new Column(
                                children: <Widget>[
                                  new Padding(
                                      padding: new EdgeInsets.all(50.0)),
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
                              List? invoicePaid = snapshot.data;
                              // print(invoicePaid);
                              if (invoicePaid!.length == 0) {
                                return Center(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 100,
                                      ),
                                      Image.asset('images/null_paid.png'),
                                      Text(
                                        "Belum ada invoice yang dibayar.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              return Column(
                                children: invoicePaid
                                    .map(
                                      (invoicePaid) => Column(
                                        children: <Widget>[
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                isLoading = true;
                                              });
                                              getInvoiceDetail(
                                                      invoicePaid.invoiceCode)
                                                  .then((value) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          InvoiceDetaiPaid(
                                                              currentInvoice:
                                                                  value),
                                                    ));
                                                setState(() {
                                                  isLoading = false;
                                                });
                                              });
                                            },
                                            child: cardPaid(
                                              invoicePaid.invoiceCode,
                                              invoicePaid.dueDate,
                                              invoicePaid.company,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                    .toList(),
                              );
                            } else if (snapshot.hasError) {
                              return throwError(context);
                            }
                            return new Center(
                              child: new Column(
                                children: <Widget>[
                                  new Padding(
                                      padding: new EdgeInsets.all(50.0)),
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
                isLoading
                    ? Center(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: loadingProcess(height, width),
                        ),
                      )
                    : SizedBox(
                        height: 0,
                      ),
              ],
            )),
      ),
    );
  }
}
