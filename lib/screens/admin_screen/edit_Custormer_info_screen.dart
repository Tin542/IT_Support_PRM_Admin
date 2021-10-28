import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Edit2 extends StatefulWidget {
  String contactKey;

  Edit2({
    Key? key,
    required this.contactKey,
  }) : super(key: key);

  @override
  _Edit2State createState() => _Edit2State();
}

class _Edit2State extends State<Edit2> {
  late TextEditingController _dob, _email, _name, _gender, _phone;
  // String _typeSelected = '';

  late DatabaseReference _ref;

  @override
  void initState() {
    super.initState();
    _dob = TextEditingController();
    _email = TextEditingController();
    _name = TextEditingController();
    _gender = TextEditingController();
    _phone = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('users');
    getContactDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update customer info'),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _email,
              decoration: InputDecoration(
                hintText: 'Enter email',
                prefixIcon: Icon(
                  Icons.email,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _name,
              decoration: InputDecoration(
                hintText: 'Enter name',
                prefixIcon: Icon(
                  Icons.person,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _gender,
              decoration: InputDecoration(
                hintText: 'Enter gender',
                prefixIcon: Icon(
                  Icons.transgender,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _phone,
              decoration: InputDecoration(
                hintText: 'Enter phone',
                prefixIcon: Icon(
                  Icons.phone_android,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _dob,
              decoration: InputDecoration(
                hintText: 'Enter dob',
                prefixIcon: Icon(
                  Icons.date_range,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: RaisedButton(
                child: Text(
                  'Update',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  save();
                },
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  getContactDetail() async {
    DataSnapshot snapshot = await _ref.child(widget.contactKey).once();
    Map contact = snapshot.value;
    _name.text = contact['name'];
    _email.text = contact['email'];
    _dob.text = contact['dob'];
    _gender.text = contact['gender'];
    _phone.text = contact['phone'];
  }

  void save() {
    String email = _email.text;
    String name = _name.text;
    String gender = _gender.text;
    String dob = _dob.text;
    String phone = _phone.text;

    Map<String, String> contact = {
      'name': name,
      'email': email,
      'gender': gender,
      'dob': dob,
      'phone': phone,
    };
    _ref.child(widget.contactKey).update(contact).then((value) {
      Navigator.pop(context);
    });
  }
}
