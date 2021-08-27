import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
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
          "KEBIJAKAN PRIVASI",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
              Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam convallis quam ac hendrerit laoreet. Mauris consectetur pulvinar elementum. Suspendisse ornare sollicitudin augue. Maecenas rhoncus, turpis at mattis"),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam convallis quam ac hendrerit laoreet. Mauris consectetur pulvinar elementum. Suspendisse ornare sollicitudin augue. Maecenas rhoncus, turpis at mattis"),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam convallis quam ac hendrerit laoreet. Mauris consectetur pulvinar elementum. Suspendisse ornare sollicitudin augue. Maecenas rhoncus, turpis at mattis"),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam convallis quam ac hendrerit laoreet. Mauris consectetur pulvinar elementum. Suspendisse ornare sollicitudin augue. Maecenas rhoncus, turpis at mattis"),
            ],
          ),
        ),
      ),
    );
  }
}
