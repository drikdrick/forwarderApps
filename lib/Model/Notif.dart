import 'package:flutter/material.dart';

class Notif {
  Widget icon;
  String headline;
  String description;
  String waktu;
  bool isRead ;

  Notif({
    required this.icon,
    required this.headline,
    required this.description,
    required this.waktu,
    required this.isRead,
  });
}

var notifList = [
  Notif(
    icon: Icon(Icons.car_rental),
    headline: "Truck sedang dalam perjalanan kembali.",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut finibus vellit",
    waktu: "17:11 WIB",
    isRead: false,
  ),
  Notif(
    icon: Icon(Icons.contact_phone),
    headline: "Driver meminta untuk membalas chat.",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut finibus vellit",
    waktu: "15:22 WIB",
    isRead: false,
  ),
  Notif(
    icon: Icon(Icons.people),
    headline: "Driver dalam perjalanan menuju depo.",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut finibus vellit",
    waktu: "14:03 WIB",
    isRead: true,
  ),
  Notif(
    icon: Icon(Icons.people),
    headline: "Driver dalam meinggalkan port.",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut finibus vellit",
    waktu: "14:02 WIB",
    isRead: true,
  ),
  Notif(
    icon: Icon(Icons.perm_media_rounded),
    headline: "Tetap nyalakan data seluler anda.",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut finibus vellit",
    waktu: "11:00 WIB",
    isRead: true,
  ),
  Notif(
    icon: Icon(Icons.car_rental),
    headline: "Truck sedang dalam perjalanan kembali",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut finibus vellit",
    waktu: "15:00 WIB",
    isRead: true,
  ),
  Notif(
    icon: Icon(Icons.people),
    headline: "Driver dalam meinggalkan port.",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut finibus vellit",
    waktu: "14:02 WIB",
    isRead: true,
  ),
  Notif(
    icon: Icon(Icons.perm_media_rounded),
    headline: "Tetap nyalakan data seluler anda.",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut finibus vellit",
    waktu: "11:00 WIB",
    isRead: true,
  ),
  Notif(
    icon: Icon(Icons.car_rental),
    headline: "Truck sedang dalam perjalanan kembali",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut finibus vellit",
    waktu: "15:00 WIB",
    isRead: true,
  ),
  Notif(
    icon: Icon(Icons.people),
    headline: "Driver dalam meinggalkan port.",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut finibus vellit",
    waktu: "14:02 WIB",
    isRead: true,
  ),
  Notif(
    icon: Icon(Icons.perm_media_rounded),
    headline: "Tetap nyalakan data seluler anda.",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut finibus vellit",
    waktu: "11:00 WIB",
    isRead: true,
  ),
  Notif(
    icon: Icon(Icons.car_rental),
    headline: "Truck sedang dalam perjalanan kembali",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut finibus vellit",
    waktu: "15:00 WIB",
    isRead: true,
  ),
  Notif(
    icon: Icon(Icons.people),
    headline: "Driver dalam meinggalkan port.",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut finibus vellit",
    waktu: "14:02 WIB",
    isRead: true,
  ),
  Notif(
    icon: Icon(Icons.perm_media_rounded),
    headline: "Tetap nyalakan data seluler anda.",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut finibus vellit",
    waktu: "11:00 WIB",
    isRead: true,
  ),
  Notif(
    icon: Icon(Icons.car_rental),
    headline: "Truck sedang dalam perjalanan kembali",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut finibus vellit",
    waktu: "15:00 WIB",
    isRead: true,
  ),
  Notif(
    icon: Icon(Icons.people),
    headline: "Driver dalam meinggalkan port.",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut finibus vellit",
    waktu: "14:02 WIB",
    isRead: true,
  ),
  Notif(
    icon: Icon(Icons.perm_media_rounded),
    headline: "Tetap nyalakan data seluler anda.",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut finibus vellit",
    waktu: "11:00 WIB",
    isRead: true,
  ),
  Notif(
    icon: Icon(Icons.car_rental),
    headline: "Truck sedang dalam perjalanan kembali",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut finibus vellit",
    waktu: "15:00 WIB",
    isRead: true,
  ),
];
