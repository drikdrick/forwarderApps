import 'dart:ui';

import 'package:bokshaulforwarder/Model/invoice_detail.dart';
import 'package:bokshaulforwarder/Resource/invoice_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class InvoiceDetaiPaid extends StatefulWidget {
  final DetailInvoice currentInvoice;
  const InvoiceDetaiPaid({Key? key, required this.currentInvoice})
      : super(key: key);

  @override
  _InvoiceDetaiPaidState createState() => _InvoiceDetaiPaidState();
}

class _InvoiceDetaiPaidState extends State<InvoiceDetaiPaid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Invoice Detail"),
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
                    Text("To:"),
                    Text(
                      widget.currentInvoice.dataCustomer[0].company,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(widget.currentInvoice.dataCustomer[0].address),
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
              color: Colors.blue,
            ),
            Container(
              color: Colors.blue.withOpacity(0.1),
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
              color: Colors.blue,
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
              color: Colors.blue,
              width: 2,
            ),
          ),
        ),
        width: double.infinity,
        height: 50,
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
                color: Colors.blue,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
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
