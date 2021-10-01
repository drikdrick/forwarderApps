import 'package:flutter/material.dart';

class TermCondition extends StatefulWidget {
  const TermCondition({Key? key}) : super(key: key);

  @override
  _TermConditionState createState() => _TermConditionState();
}

class _TermConditionState extends State<TermCondition> {
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
          "SYARAT DAN KETENTUAN",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Terms and Conditions",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "These terms and conditions outline the rules and regulations for the use of BoksMan's app.",
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "By accessing this website we assume you accept these terms and conditions. Do not continue to use bokshaul if you do not agree to take all of the terms and conditions stated on this page.",
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: "
                  'Client'
                  ", "
                  'You'
                  " and "
                  'Your'
                  " refers to you, the person log on this website and compliant to the Company’s terms and conditions. "
                  'The Company'
                  ", "
                  'Ourselves'
                  ", "
                  'We'
                  ", "
                  'Our'
                  " and "
                  'Us'
                  ", refers to our Company. "
                  'Party'
                  ", "
                  'Parties'
                  ", or "
                  'Us'
                  ", refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client’s needs in respect of provision of the Company’s stated services, in accordance with and subject to, prevailing law of Netherlands. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same.",
                  textAlign: TextAlign.justify,
                ),
                Divider(),
                Text(
                  "License",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Unless otherwise stated, BoksMan and/or its licensors own the intellectual property rights for all material on bokshaul. All intellectual property rights are reserved. You may access this from bokshaul for your own personal use subjected to restrictions set in these terms and conditions.",
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Parts of this website offer an opportunity for users to post and exchange opinions and information in certain areas of the website. BoksMan does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of BoksMan,its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions. To the extent permitted by applicable laws, BoksMan shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this website.",
                  textAlign: TextAlign.justify,
                ),
                Divider(),
                Text(
                  "BoksMan reserves the right to monitor all Comments and to remove any Comments which can be considered inappropriate, offensive or causes breach of these Terms and Conditions.",
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "You hereby grant BoksMan a non-exclusive license to use, reproduce, edit and authorize others to use, reproduce and edit any of your Comments in any and all forms, formats or media.",
                  textAlign: TextAlign.justify,
                ),
                Divider(),
                Text(
                  "Hyperlinking to our Content",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "We will approve link requests from these organizations if we decide that: (a) the link would not make us look unfavorably to ourselves or to our accredited businesses; (b) the organization does not have any negative records with us; (c) the benefit to us from the visibility of the hyperlink compensates the absence of BoksMan; and (d) the link is in the context of general resource information.",
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "These organizations may link to our home page so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products or services; and (c) fits within the context of the linking party’s site.",
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
