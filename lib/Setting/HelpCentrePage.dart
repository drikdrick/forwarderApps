import 'package:flutter/material.dart';

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
        leading: Icon(Icons.arrow_back_ios),
        title: Text(
          "Halaman Bantuan",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.chat_bubble_outline),
                    SizedBox(
                      width: 15,
                    ),
                    Text("Chat dengan CS kami.")
                  ],
                ),
              ),
            ),
          ),
          cardOption(Icon(Icons.email_outlined), "Hubungi kami melalui Email"),
          cardOption(Icon(Icons.navigation), "Hubungi kami melalui Whatsapp"),
          cardOption(Icon(Icons.phone_callback_outlined), "Hubungi kami melalui Telepon"),
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
