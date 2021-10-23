import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:it_support/firebase_database/database.dart';
import 'package:it_support/screens/bottom_nav_bar_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                    width: 380,
                    height: 300,
                    child: Image.asset('assets/images/logo.jpg')
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Text(
                  "IT SUPPORT ADMIN",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 28),
                child: TextField(
                  controller: emailTextEditingController,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                      labelText: "EMAIL",
                      labelStyle:
                          TextStyle(color: Color(0xff888888), fontSize: 15)),
                ),
              ),
              Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                    child: TextField(
                      controller: passwordTextEditingController,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Mật Khẩu",
                          labelStyle: TextStyle(
                              color: Color(0xff888888), fontSize: 15)),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: RaisedButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    onPressed: () {
                      if (!emailTextEditingController.text.contains("@")) {
                        displayToastMessage("Email không hợp lệ", context);
                      } else if (passwordTextEditingController.text.isEmpty) {
                        displayToastMessage(
                            "Mật khẩu không thể để trống", context);
                      } else {
                        loginUser(context);
                      }
                    },
                    child: Text(
                      "ĐĂNG NHẬP",
                      style: TextStyle(color: Colors.white, fontSize: 16),
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

  final FirebaseAuth _firebaseAuth =
      FirebaseAuth.instance; // authen vao firebase

  void loginUser(BuildContext context) async {
    final User? firebaseUser = (await _firebaseAuth
            .signInWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((errMsg) {
      displayToastMessage("Error: " + errMsg.toString(), context);
    }))
        .user;

    if (firebaseUser != null) {
      adminRef.child(firebaseUser.uid).once().then((DataSnapshot snap) {
        if (snap.value != null) {
          displayToastMessage("Đăng nhập thành công", context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => BottomNavScreen()));
        } else {
          _firebaseAuth.signOut();
          displayToastMessage(
              "Tài khoản của bạn không có, hãy tạo tài khoản", context);
        }
      });
    } else {
      displayToastMessage("Đang có lỗi gì đó.", context);
    }
  }

  displayToastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}
