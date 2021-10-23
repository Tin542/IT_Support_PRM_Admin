import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:it_support/constant.dart';
import 'package:it_support/firebase_database/database.dart';
import 'package:it_support/screens/auth_screen/login_screen.dart';
import 'package:it_support/screens/profile_screen/edit_profile_screen.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  displayToastMessage(String message, BuildContext context){
    Fluttertoast.showToast(msg:message);
  }

  Widget textfield({@required hintText, @required icon, onTap}) {
    return Material(
      elevation: 4,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: TextField(
          readOnly: true,
          onTap: onTap,
          decoration: InputDecoration(
              hintText: hintText,
              icon: Icon(icon),
              hintStyle: TextStyle(
                letterSpacing: 2,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
              fillColor: Colors.white30,
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.0),
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 5),
                          shape: BoxShape.circle,
                          color: kBackgroundColor,
                          image: DecorationImage(
                            image:
                            AssetImage('assets/images/Yeti.png'),
                          ),
                        ),
                      ),
                      Text(
                        "Nguyen Van A",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 120, left: 160),
                    child: CircleAvatar(
                      backgroundColor: Colors.black54,
                      child: IconButton(
                        icon: Icon(Icons.camera_alt_outlined,
                            color: Colors.white, size: 25),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 22,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 500,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: kBlueColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: Icon(Icons.person, color: kWhiteColor,),
                              ),
                              Text(
                                "Tài khoản",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: kWhiteColor,
                                ),
                              ),
                              SizedBox(
                                width: 68,
                              ),
                              RawMaterialButton(
                                onPressed: () => {
                                  Get.to(() => EditProfile(),
                                      transition:
                                      Transition.rightToLeftWithFade,
                                      duration: Duration(milliseconds: 600))
                                },
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
                                  child: Icon(
                                    Icons.edit,
                                    color: kWhiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        textfield(
                          hintText: 'user@gmail.com',
                          icon: Icons.email_outlined,
                        ),
                        textfield(
                          hintText: '10/07/2000',
                          icon: Icons.date_range,
                        ),
                        textfield(
                          hintText: '+84 123456789',
                          icon: Icons.phone,
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: kBlueColor,
                            //Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: Icon(Icons.contact_support, color: kWhiteColor,),
                              ),
                              Text(
                                "Giới tính",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: kWhiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        textfield(
                          hintText: 'Lịch sử',
                          icon: Icons.history,
                        ),
                        textfield(
                          hintText: 'Hỗ trợ',
                          icon: Icons.contact_support_outlined,
                        ),
                        textfield(
                          hintText: 'Đăng Xuất',
                          icon: Icons.logout,
                          onTap: () => {
                            Get.offAll(() => LoginScreen(),
                                duration: Duration(microseconds: 600)),
                          displayToastMessage("Bạn đã đăng xuất.", context),
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
