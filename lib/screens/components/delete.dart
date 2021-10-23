import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RealtimeDatabaseDelete extends StatefulWidget {
  RealtimeDatabaseDelete({Key? key}) : super(key: key);

  @override
  _RealtimeDatabaseDeleteState createState() => _RealtimeDatabaseDeleteState();
}

class _RealtimeDatabaseDeleteState extends State<RealtimeDatabaseDelete> {
  final _ref = FirebaseDatabase.instance.reference().child("users");

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late final users = FirebaseDatabase.instance.reference();
  late DatabaseReference databaseReference;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            return ListTile(
              title: Text(snapshot.value['email']),
              subtitle: Text(snapshot.value['name']),
              trailing: IconButton(
                onPressed: () {
                  var key = snapshot.key;
                  print(key);
                },
                icon: Icon(Icons.delete),
              ),
            );
          },
        ),
      ),
    );
  }
}
