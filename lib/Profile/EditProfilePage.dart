import 'package:bokshaulforwarder/Resource/stylesheet.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// import '../Authentication/EmailVerificationPage.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
          "Edit Profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 25,
              ),
              CircleAvatar(
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/150'),
                backgroundColor: Colors.blue,
                radius: 50,
              ),
              Text(
                "Edit Profil",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Nama Lengkap",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: inputBorder),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Text(
              //     "Contoh nama perusahaan : Boksman Asia_PT",
              //     style: TextStyle(
              //       fontSize: 10,
              //       color: Colors.grey,
              //     ),
              //   ),
              // ),
              TextFormField(
                decoration: InputDecoration(
                  prefix: Text("+62"),
                  labelText: "No. Handphone",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: inputBorder),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Username",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: inputBorder),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: inputBorder),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              // TextFormField(
              //   obscureText: isVisible,
              //   decoration: InputDecoration(
              //     labelText: "Kata Sandi",
              //     enabledBorder: OutlineInputBorder(
              //       borderSide: BorderSide(color: inputBorder),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: BorderSide(color: Colors.blue),
              //     ),
              //     suffixIcon: IconButton(
              //       onPressed: () {
              //         setState(() {
              //           isVisible == true ? isVisible = false : isVisible = true;
              //         });
              //       },
              //       icon: Icon(
              //           isVisible ? Icons.visibility_off : Icons.remove_red_eye),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: height * 0.1,
              ),
              SizedBox(
                height: height * 0.075,
                width: width * 0.55,
                child: ElevatedButton(
                  child: Text("SIMPAN"),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => EmailVerification(),
                    //   ),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
