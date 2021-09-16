import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

InvoiceUnpaid invoiceUnpaidFromJson(String str) =>
    InvoiceUnpaid.fromJson(json.decode(str));

String invoiceUnpaidToJson(InvoiceUnpaid data) => json.encode(data.toJson());

class InvoiceUnpaid {
  InvoiceUnpaid({
    required this.invoiceCode,
    required this.company,
    required this.invoiceDate,
    required this.dueDateInvoice,
    required this.dueDate,
  });

  String invoiceCode;
  String company;
  DateTime invoiceDate;
  String dueDateInvoice;
  DateTime dueDate;

  factory InvoiceUnpaid.fromJson(Map<String, dynamic> json) => InvoiceUnpaid(
        invoiceCode: json["invoice_code"],
        company: json["company"],
        invoiceDate: DateTime.parse(json["invoice_date"]),
        dueDateInvoice: json["due_date_invoice"],
        dueDate: DateTime.parse(json["due_date"]),
      );

  Map<String, dynamic> toJson() => {
        "invoice_code": invoiceCode,
        "company": company,
        "invoice_date": invoiceDate.toIso8601String(),
        "due_date_invoice": dueDateInvoice,
        "due_date": dueDate.toIso8601String(),
      };
}

Future<List<InvoiceUnpaid>> fetchInvoiceUnpaid() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token')!;
  int userId = prefs.getInt('idUser')!;

  Uri url = Uri.parse(
      "https://apiflutter.forwarder.boksman.co.id/invoice/unpaid/$userId");

  var response = await http.get(url, headers: {'token': token});
  var jsonResult;
  if (response.statusCode == 201) {
    jsonResult = jsonDecode(response.body);
  }

  return (jsonResult["data"] as List).map((e) => InvoiceUnpaid.fromJson(e)).toList();
}
