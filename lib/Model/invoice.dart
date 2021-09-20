import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Invoice invoiceFromJson(String str) => Invoice.fromJson(json.decode(str));

String invoiceToJson(Invoice data) => json.encode(data.toJson());

class Invoice {
  Invoice({
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

  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
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

Future<List<Invoice>> fetchInvoiceUnpaid() async {
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

  return (jsonResult["data"] as List).map((e) => Invoice.fromJson(e)).toList();
}

Future<List<Invoice>> fetchInvoicePaid() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token')!;
  int userId = prefs.getInt('idUser')!;

  Uri url = Uri.parse(
      "https://apiflutter.forwarder.boksman.co.id/invoice/paid/$userId");

  var response = await http.get(url, headers: {'token': token});
  var jsonResult;
  if (response.statusCode == 201) {
    jsonResult = jsonDecode(response.body);
  }
  return (jsonResult["data"] as List).map((e) => Invoice.fromJson(e)).toList();
}
