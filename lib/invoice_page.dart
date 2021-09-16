import 'package:bokshaulforwarder/Model/invoice_unpaid.dart';
import 'package:bokshaulforwarder/Resource/stylesheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class Invoice extends StatefulWidget {
  const Invoice({Key? key}) : super(key: key);

  @override
  _InvoiceState createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
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
                        List? invoiceUpdate = snapshot.data;
                        if (invoiceUpdate!.length == 0) {
                          return Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 100,
                                ),
                                Text(
                                  "Belum ada invoice terbaru.",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          );
                        }
                        return Column(
                          children: invoiceUpdate
                              .map(
                                (invoiceUpdate) => Column(
                                  children: <Widget>[
                                    cardUnpaid(
                                      "invoiceId",
                                      "tglTempo",
                                      "perusahaan",
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
                children: [
                  cardPaid(),
                  cardPaid(),
                  cardPaid(),
                  cardPaid(),
                  cardPaid(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardUnpaid(invoiceId, tglTempo, perusahaan) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
      child: Card(
        shadowColor: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(perusahaan),
                      Text(
                        invoiceId,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.chevron_right),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tanggal jatuh tempo",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Jumlah tagihan",
                        style: TextStyle(
                            color: abuProfile, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "No. Tagihan",
                        style: TextStyle(
                            color: abuProfile, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "No. Kontainer",
                        style: TextStyle(
                            color: abuProfile, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        tglTempo.toString(),
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Jumlah tagihan",
                        style: TextStyle(
                            color: abuProfile, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "No. Tagihan",
                        style: TextStyle(
                            color: abuProfile, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "No. Kontainer",
                        style: TextStyle(
                            color: abuProfile, fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget cardPaid() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
      child: Card(
        shadowColor: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Tanggal Pembuatan"),
                      Text(
                        "Invoide ID",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.chevron_right),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jumlah tagihan",
                        style: TextStyle(
                            color: abuProfile, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "No. Tagihan",
                        style: TextStyle(
                            color: abuProfile, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "No. Kontainer",
                        style: TextStyle(
                            color: abuProfile, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Jumlah tagihan",
                        style: TextStyle(
                            color: abuProfile, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "No. Tagihan",
                        style: TextStyle(
                            color: abuProfile, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "No. Kontainer",
                        style: TextStyle(
                            color: abuProfile, fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
