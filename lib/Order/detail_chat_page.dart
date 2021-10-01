import 'package:bokshaulforwarder/Resource/stylesheet.dart';
import 'package:flutter/material.dart';

class DetailChat extends StatefulWidget {
  const DetailChat({Key? key}) : super(key: key);

  @override
  _DetailChatState createState() => _DetailChatState();
}

class _DetailChatState extends State<DetailChat> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Nama Forwarder, Nama Driver, Nama Trucker",
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('images/pp.jpg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text("Saya sdg prjalan meunuju warehouse"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: biruUtama.withOpacity(0.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text("OK"),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('images/pp.jpg'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: width,
            height: 50,
            decoration: BoxDecoration(
              border: Border.symmetric(horizontal: BorderSide(width: 1)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Ketik Pesan.. "),
                  Row(
                    children: [
                      Icon(Icons.attachment),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.camera_alt_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.send),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
