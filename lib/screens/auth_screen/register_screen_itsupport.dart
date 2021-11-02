import 'package:firebase_auth/firebase_auth.dart';
import 'package:animated_textformfields/animated_textformfield/animated_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:it_support/firebase_database/database.dart';
import 'package:it_support/screens/auth_screen/login_screen.dart';
import 'package:it_support/screens/components/bottom_nav_bar.dart';

class RegisterScreenIT extends StatefulWidget {
  const RegisterScreenIT({Key? key}) : super(key: key);

  @override
  _RegisterScreenITState createState() => _RegisterScreenITState();
}

class _RegisterScreenITState extends State<RegisterScreenIT> {
  FocusNode myFocusNode1 = FocusNode();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController dobTextEditingController = TextEditingController();
  late String _choosegender = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: const BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 80, 0, 40),
                child: Text(
                  "Tạo tài khoản,\ncho IT Support !",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: TextField(
                  controller: nameTextEditingController,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                      labelText: "HỌ VÀ TÊN",
                      labelStyle:
                          TextStyle(color: Color(0xff888888), fontSize: 15)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text(
                  "GIỚI TÍNH",
                  style: TextStyle(color: Color(0xff888888), fontSize: 15),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 10, 0, 0),
                child: Container(
                  height: 30,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _gender('Nam'),
                      SizedBox(
                        width: 10,
                      ),
                      _gender('Nữ'),
                      SizedBox(
                        width: 10,
                      ),
                      _gender('Khác'),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: TextField(
                    controller: phoneTextEditingController,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                        labelText: "SỐ ĐIỆN THOẠI",
                        labelStyle:
                            TextStyle(color: Color(0xff888888), fontSize: 15)),
                    keyboardType: TextInputType.phone),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: TextField(
                  controller: emailTextEditingController,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                      labelText: "EMAIL",
                      labelStyle:
                          TextStyle(color: Color(0xff888888), fontSize: 15)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: TextField(
                  controller: passwordTextEditingController,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "MẬT KHẨU",
                      labelStyle:
                          TextStyle(color: Color(0xff888888), fontSize: 15)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("NGÀY SINH",
                        style:
                            TextStyle(color: Color(0xff888888), fontSize: 15)),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Icon(
                      Icons.calendar_today_rounded,
                      size: 30,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AnimatedTextFormField(
                          width: 235,
                          height: 48.0,
                          inputType: TextInputType.text,
                          hintText: "Thêm ngày sinh của bạn",
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'pick date';
                            }
                            return null;
                          },
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                          controller: dobTextEditingController,
                          focusNode: myFocusNode1,
                          cornerRadius: BorderRadius.circular(14.0),
                          onTap: () async {
                            DateTime date = DateTime(1900);
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            date = (await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100)))!;
                            var formattedDate =
                                "${date.day}-${date.month}-${date.year}";
                            dobTextEditingController.text =
                                formattedDate.toString();
                          },
                        ),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: RaisedButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    onPressed: () {
                      if (nameTextEditingController.text.length < 1) {
                        displayToastMessage("Tên ít nhất 2 kí tự", context);
                      } else if (emailTextEditingController.text.isEmpty) {
                        displayToastMessage(
                            "Email không thể để trống", context);
                      } else if (!emailTextEditingController.text
                          .contains("@")) {
                        displayToastMessage("Email không hợp lệ", context);
                      } else if (dobTextEditingController.text.isEmpty) {
                        displayToastMessage(
                            "Vui lòng nhập ngày sinh của bạn", context);
                      } else if (passwordTextEditingController.text.length <
                          7) {
                        displayToastMessage(
                            "Password ít nhất 8 kí tự", context);
                      } else {
                        registerNewUser(context);
                      }
                    },
                    child: Text(
                      "ĐĂNG KÝ",
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

  Widget _gender(String title) {
    return InkWell(
      child: Container(
        height: 30,
        width: 80,
        decoration: BoxDecoration(
          color: _choosegender == title
              ? Colors.green
              : Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          _choosegender = title;
        });
      },
    );
  }

  final FirebaseAuth _firebaseAuth =
      FirebaseAuth.instance; // authen vao firebase
  void registerNewUser(BuildContext context) async {
    final User? firebaseUser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((errMsg) {
      displayToastMessage("Error: " + errMsg.toString(), context);
    }))
        .user;

    if (firebaseUser != null) {
      //luu thong tin user len database
      Map userDataMap = {
        "name": nameTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(),
        "phone": phoneTextEditingController.text.trim(),
        "gender": _choosegender,
        "dob": dobTextEditingController.text.trim(),
      };

      itspRef.child(firebaseUser.uid).set(userDataMap);
      displayToastMessage("Tài khoản đã được tạo", context);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BottomNavBar()));
    } else {
      displayToastMessage("Người dùng mới không được tạo", context);
    }
  }

  displayToastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}
