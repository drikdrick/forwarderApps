import 'dart:ui';

import '../Model/invoice_detail.dart';
import '../Resource/invoice_card.dart';
import '../Resource/stylesheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class InvoiceDetail extends StatefulWidget {
  final DetailInvoice currentInvoice;
  const InvoiceDetail({Key? key, required this.currentInvoice})
      : super(key: key);

  @override
  _InvoiceDetailState createState() => _InvoiceDetailState();
}

class _InvoiceDetailState extends State<InvoiceDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Invoice Detail",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text("To:"),
                    Text(
                      widget.currentInvoice.dataCustomer[0].company,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(widget.currentInvoice.dataCustomer[0].address
                        .toLowerCase()),
                    RichText(
                      text: TextSpan(
                        text: widget.currentInvoice.dataCustomer[0].state + " ",
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                              text: widget
                                      .currentInvoice.dataCustomer[0].country +
                                  " "),
                          TextSpan(
                              text: widget
                                  .currentInvoice.dataCustomer[0].zipCode
                                  .toString()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: biruUtama,
            ),
            Container(
              color: biruUtama.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Invoice # ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text("1569/INV/BOKSHAUL/V/2021"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Invoice Date ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(widget.currentInvoice.dataCustomer[0].invoiceDate
                            .toString()
                            .split(' ')[0]),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Due Date ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(widget.currentInvoice.dataCustomer[0].dueDate
                            .toString()
                            .split(' ')[0]),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: biruUtama,
            ),
            Text(
              "Daftar Order",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            //Card Order List
            ...cardOrderList(widget.currentInvoice),
            SizedBox(
              height: 55,
            )
          ],
        ),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(
              color: biruUtama,
              width: 2,
            ),
          ),
        ),
        width: double.infinity,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Total Pembayaran",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "Rp " +
                        widget.currentInvoice.dataCustomer[0].invoiceAmount +
                        ",-",
                    style: TextStyle(
                      color: biruUtama,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: new BeveledRectangleBorder(
                    borderRadius: new BorderRadius.circular(0),
                  ),
                ),
                onPressed: () {},
                child: Text("Bayar Invoice"),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> cardOrderList(DetailInvoice invoice) {
    List<Widget> cardList = [];
    for (var i = 0; i < invoice.dataOrder.length; i++) {
      cardList.add(
        invoiceDetail(
            invoice.dataOrder[i].gkOrder,
            invoice.dataOrder[i].origin,
            invoice.dataOrder[i].destination,
            invoice.dataOrder[i].containerNumber,
            invoice.dataOrder[i].noPolisi,
            invoice.dataOrder[i].containerSize,
            invoice.dataOrder[i].grandtotal),
      );
    }
    return cardList;
  }
}
