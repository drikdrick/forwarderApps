import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

OrderBerlangsung orderBerlangsungFromJson(String str) =>
    OrderBerlangsung.fromJson(json.decode(str));

String orderBerlangsungToJson(OrderBerlangsung data) =>
    json.encode(data.toJson());

class OrderBerlangsung {
  OrderBerlangsung({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  Data data;

  factory OrderBerlangsung.fromJson(Map<String, dynamic> json) =>
      OrderBerlangsung(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.freshorder,
    required this.trackTrace,
  });

  List<Freshorder> freshorder;
  List<dynamic> trackTrace;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        freshorder: List<Freshorder>.from(
            json["freshorder"].map((x) => Freshorder.fromJson(x))),
        trackTrace: List<dynamic>.from(json["track_trace"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "freshorder": List<dynamic>.from(freshorder.map((x) => x.toJson())),
        "track_trace": List<dynamic>.from(trackTrace.map((x) => x)),
      };
}

class Freshorder {
  Freshorder({
    required this.gkOrder,
    required this.etd,
    required this.noContainer,
    required this.statusOrder,
    required this.slName,
    required this.vesselName,
    required this.voyageNumber,
    required this.name,
    required this.noPolisi,
    required this.namaPort,
    required this.addressPort,
    required this.namaGudang,
    required this.addressGudang,
  });

  String gkOrder;
  DateTime etd;
  String? noContainer;
  int statusOrder;
  String slName;
  String vesselName;
  String voyageNumber;
  String name;
  String noPolisi;
  String namaPort;
  String addressPort;
  String namaGudang;
  String addressGudang;

  factory Freshorder.fromJson(Map<String, dynamic> json) => Freshorder(
        gkOrder: json["gk_order"] ?? null,
        etd: DateTime.parse(json["ETD"] ?? ""),
        noContainer: json["no_container"] ?? "",
        statusOrder: json["status_order"] ?? "",
        slName: json["sl_name"] ?? "",
        vesselName: json["vessel_name"] ?? "",
        voyageNumber: json["voyage_number"] ?? "",
        name: json["name"] ?? "",
        noPolisi: json["no_polisi"] ?? "",
        namaPort: json["nama_port"],
        addressPort: json["address_port"] ?? "",
        namaGudang: json["nama_gudang"] ?? "",
        addressGudang: json["address_gudang"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "gk_order": gkOrder,
        "ETD": etd.toIso8601String(),
        "no_container": noContainer,
        "status_order": statusOrder,
        "sl_name": slName,
        "vessel_name": vesselName,
        "voyage_number": voyageNumber,
        "name": name,
        "no_polisi": noPolisi,
        "nama_port": namaPort,
        "address_port": addressPort,
        "nama_gudang": namaGudang,
        "address_gudang": addressGudang,
      };
}

Future<List<Freshorder>> fetchOrderBerlangsung() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token')!; //fetch Token
  int userId = prefs.getInt('idUser')!; //fetch User ID

  Uri url = Uri.parse(
      "https://apiflutter.forwarder.boksman.co.id/orderberlangsung/$userId");

  var response = await http.get(url, headers: {'token': token});
  var jsonResult;
  if (response.statusCode == 201) {
    jsonResult = jsonDecode(response.body);
  }
  return (jsonResult["data"]["freshorder"] as List)
      .map((e) => Freshorder.fromJson(e))
      .toList();

  // return freshOrders;
}

Future<List<Freshorder>> fetchOrderBerlangsungLimit() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token')!; //fetch Token
  int userId = prefs.getInt('idUser')!; //fetch User ID

  Uri url = Uri.parse(
      "https://apiflutter.forwarder.boksman.co.id/orderberlangsung/limit/$userId");

  var response = await http.get(url, headers: {'token': token});
  var jsonResult;
  if (response.statusCode == 201) {
    jsonResult = jsonDecode(response.body);
  }
  return (jsonResult["data"]["freshorder"] as List)
      .map((e) => Freshorder.fromJson(e))
      .toList();

  // return freshOrders;
}

Future<List<Freshorder>> fetchOrderPending() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token')!; //fetch Token
  int userId = prefs.getInt('idUser')!; //fetch User ID

  Uri url = Uri.parse(
      "https://apiflutter.forwarder.boksman.co.id/ordermenunggu/$userId");

  var response = await http.get(url, headers: {'token': token});
  var jsonResult;
  if (response.statusCode == 201) {
    jsonResult = jsonDecode(response.body);
  }
  return (jsonResult["data"]["freshorder"] as List)
      .map((e) => Freshorder.fromJson(e))
      .toList();

  // return freshOrders;
}

Future<List<Freshorder>> fetchOrderDone() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token')!; //fetch Token
  int userId = prefs.getInt('idUser')!; //fetch User ID

  Uri url = Uri.parse(
      "https://apiflutter.forwarder.boksman.co.id/orderselesai/$userId");

  var response = await http.get(url, headers: {'token': token});
  var jsonResult;
  if (response.statusCode == 201) {
    jsonResult = jsonDecode(response.body);
  }
  return (jsonResult["data"]["freshorder"] as List)
      .map((e) => Freshorder.fromJson(e))
      .toList();
}
