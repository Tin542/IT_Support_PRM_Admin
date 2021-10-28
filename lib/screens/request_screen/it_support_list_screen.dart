import 'package:flutter/material.dart';
import 'package:it_support/constant.dart';
// import 'package:it_support/screens/admin_screen/add_student_screen.dart';
import 'package:it_support/screens/admin_screen/list_it_support_screen.dart';
// import 'package:it_support/screens/components/it_card.dart';

class ListItScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('List IT Support'),
            ],
          ),
        ),
        body: ListITPage());
  }
}
