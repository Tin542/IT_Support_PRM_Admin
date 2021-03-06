import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListCustomerPage extends StatefulWidget {
  ListCustomerPage({Key? key}) : super(key: key);

  @override
  _ListCustomerPageState createState() => _ListCustomerPageState();
}

class _ListCustomerPageState extends State<ListCustomerPage> {
  deleteUser(id) {
    print("User Deleted $id");
  }

  late Query _ref;
  DatabaseReference reference =
      FirebaseDatabase.instance.reference().child('users');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance
        .reference()
        .child('users')
        .orderByChild('email');
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late final users = FirebaseDatabase.instance.reference();
  late DatabaseReference databaseReference;

  @override
  Widget _buildContactItem({Map? contact}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      height: 200,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.mail,
                color: Colors.redAccent[100],
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                contact!['email'],
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.redAccent[100],
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.phone_android,
                color: Colors.greenAccent[400],
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                contact['phone'],
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.greenAccent[400],
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.person,
                color: Colors.deepOrange[100],
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                contact['name'],
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.deepOrange[100],
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 30,
              ),
              Icon(
                Icons.transgender,
                color: Colors.purple,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                contact['gender'],
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.purple,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.date_range,
                color: Colors.blue[700],
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                contact['dob'],
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue[700],
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  _showDeleteDialog(contact: contact);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red[700],
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Delete',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.red[700],
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog({Map? contact}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Delete ${contact!['email']}'),
            content: Text('You really want to delete this customer ?'),
            actions: [
              FlatButton(
                  onPressed: () {
                    reference
                        .child(contact['key'])
                        .remove()
                        .whenComplete(() => Navigator.pop(context));
                  },
                  child: Text('Delete')),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map contact = snapshot.value;
            contact['key'] = snapshot.key;
            return _buildContactItem(contact: contact);
          },
        ),
      ),
    );
  }
}
