import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Promo promoFromJson(String str) => Promo.fromJson(json.decode(str));

String promoToJson(Promo data) => json.encode(data.toJson());

class Promo {
  Promo({
    required this.id,
    required this.inboxId,
    required this.reciever,
    required this.recieverType,
    required this.createdAt,
    required this.title,
    required this.content,
    required this.icon,
    required this.banner,
  });

  int id;
  int inboxId;
  String reciever;
  String recieverType;
  DateTime createdAt;
  String title;
  String content;
  String icon;
  String banner;

  factory Promo.fromJson(Map<String, dynamic> json) => Promo(
        id: json["id"],
        inboxId: json["inbox_id"],
        reciever: json["reciever"],
        recieverType: json["reciever_type"],
        createdAt: DateTime.parse(json["created_at"]),
        title: json["title"],
        content: json["content"],
        icon: json["icon"] ?? "https://boksman.com/frontend/images/logo/boksman_logo.png",
        banner: json["banner"] ?? "https://via.placeholder.com/300x150",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "inbox_id": inboxId,
        "reciever": reciever,
        "reciever_type": recieverType,
        "created_at": createdAt.toIso8601String(),
        "title": title,
        "content": content,
        "icon": icon,
        "banner": banner,
      };
}

Future<List<Promo>> fetchPromo() async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  String token = pref.getString('token')!;
  int userId = pref.getInt('idUser')!;
  print(userId.toString());

  Uri url =
      Uri.parse('https://apiflutter.forwarder.boksman.co.id/inbox/$userId');

  var response = await http.get(url, headers: {'token': token});
  var jsonResult;
  if (response.statusCode == 201) {
    jsonResult = jsonDecode(response.body);
    print(jsonResult["data"]);
  } else {
    jsonResult = [];
  }

  return (jsonResult["data"] as List).map((e) => Promo.fromJson(e)).toList();
}
