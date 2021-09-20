import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncer;

class HelpCentre extends StatefulWidget {
  const HelpCentre({Key? key}) : super(key: key);

  @override
  _HelpCentreState createState() => _HelpCentreState();
}

class _HelpCentreState extends State<HelpCentre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Halaman Bantuan",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // cardOption(Icon(Icons.chat_bubble_outline), "Chat dengan CS kami."),
          InkWell(
            child: cardOption(
                Icon(Icons.email_outlined), "Hubungi kami melalui Email"),
            onTap: () {
              UrlLauncer.launch("mailto:angel@boksman.com");
            },
          ),
          InkWell(
            child: cardOption(
                Icon(Icons.aod_outlined), "Hubungi kami melalui Whatsapp"),
            onTap: () {
              UrlLauncer.launch(
                  "https://api.whatsapp.com/send/?phone=%2B6281380188482");
            },
          ),
          InkWell(
            child: cardOption(Icon(Icons.phone_callback_outlined),
                "Hubungi kami melalui Telepon"),
            onTap: () {
              UrlLauncer.launch("tel:+6281380188482");
            },
          ),
        ],
      ),
    );
  }

  Widget cardOption(icon, email) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              icon,
              SizedBox(
                width: 15,
              ),
              Text(email)
            ],
          ),
        ),
      ),
    );
  }
}
