import 'package:flutter/material.dart';
// import 'package:it_support/screens/admin_screen/add_student_screen.dart';
import 'package:it_support/screens/admin_screen/list_customer_screen.dart';
// import 'package:it_support/screens/components/body.dart';

import 'dart:ui';

// import 'components/load_image.dart';

class HomeScreenCustomer extends StatefulWidget {
  const HomeScreenCustomer({Key? key}) : super(key: key);

  @override
  _HomeScreenCustomerState createState() => new _HomeScreenCustomerState();
}

class _HomeScreenCustomerState extends State<HomeScreenCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('List Custormer'),
              // ElevatedButton(
              //   onPressed: () => {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => AddStudentPage()),
              //     )
              //   },
              //   child: Text('Add', style: TextStyle(fontSize: 20.0)),
              //   style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
              // )
            ],
          ),
        ),
        body: ListCustomerPage());
  }
}
