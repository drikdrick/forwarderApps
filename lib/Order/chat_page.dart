import 'package:bokshaulforwarder/Order/detail_chat_page.dart';
import 'package:bokshaulforwarder/Resource/stylesheet.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Chat",
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return DetailChat();
                    },
                  ),
                );
              },
              child: Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('images/pp.jpg'),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "GK-123456789",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "Nama Forwarder, Nama Trucker, Nama Driver",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "11:00 PM",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: biruUtama,
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              "1",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('images/pp.jpg'),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "GK-123456789",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "Nama Forwarder, Nama Trucker, Nama Driver",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "11:00 PM",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: biruUtama,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            "2",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('images/pp.jpg'),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "GK-123456789",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "Nama Forwarder, Nama Trucker, Nama Driver",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "11:00 PM",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //     color: biruUtama,
                      //     borderRadius: BorderRadius.all(
                      //       Radius.circular(50),
                      //     ),
                      //   ),
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(5),
                      //     child: Text(
                      //       "10",
                      //       style: TextStyle(
                      //         fontSize: 12,
                      //         fontWeight: FontWeight.w600,
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('images/pp.jpg'),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "GK-123456789",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "Nama Forwarder, Nama Trucker, Nama Driver",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "11:00 PM",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: biruUtama,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            "10",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
