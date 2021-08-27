import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _isCheckedNotif = false;
  bool _isCheckedNotifEmail = false;
  bool _isCheckedNotifTelepon = false;
  bool _isCheckedFontSize = false;
  bool _isCheckedAssistHour = false;

  Widget listSetting(title, desc, status) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              desc,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Checkbox(
          value: status,
          activeColor: Colors.blue,
          onChanged: (bool? newValue) {
            setState(() {
              status = newValue!;
            });
            setState(() {
              status = newValue!;
            });
          },
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

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
          "Pengaturan",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Notifikasi
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Notifikasi",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "Aktifkan notifikasi di perangkat yang digunakan.",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Checkbox(
                      value: _isCheckedNotif,
                      activeColor: Colors.blue,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _isCheckedNotif = newValue!;
                        });
                      },
                    )
                  ],
                ),
                Divider(),
                //Notifikasi Email
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Notifikasi Email",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "Aktifkan notifikasi yang dikirimkan ke email",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Checkbox(
                      value: _isCheckedNotifEmail,
                      activeColor: Colors.blue,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _isCheckedNotifEmail = newValue!;
                        });
                      },
                    )
                  ],
                ),
                Divider(),
                //Notifikasi Telepon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Notifikasi ke No. Handphone",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "Aktifkan notifikasi yang dikirim ke No. Handphone",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Checkbox(
                      value: _isCheckedNotifTelepon,
                      activeColor: Colors.blue,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _isCheckedNotifTelepon = newValue!;
                        });
                      },
                    )
                  ],
                ),
                Divider(),
                //Ukuran teks
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ukuran tulisan",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "Sedang",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Checkbox(
                      value: _isCheckedFontSize,
                      activeColor: Colors.blue,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _isCheckedFontSize = newValue!;
                        });
                      },
                    )
                  ],
                ),
                Divider(),
                //Notifikasi Jam Tenang
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Aktifkan Jam Tenang",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "Notifikasi tidak akan muncul selama jam tenang berlangsung",
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Checkbox(
                      value: _isCheckedAssistHour,
                      activeColor: Colors.blue,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _isCheckedAssistHour = newValue!;
                        });
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Atur Jam Tenang",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "22:00 - 04:00 WIB",
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(_isCheckedNotif.toString()),
                Text(_isCheckedNotifEmail.toString()),
                Text(_isCheckedNotifTelepon.toString()),
                Text(_isCheckedFontSize.toString()),
                Text(_isCheckedAssistHour.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
