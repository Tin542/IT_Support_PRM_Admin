import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddService extends StatefulWidget {
  AddService({Key? key}) : super(key: key);

  @override
  _AddServiceState createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  late TextEditingController _level, _servicePrice, _des;

  late DatabaseReference _ref;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _level = TextEditingController();
    _servicePrice = TextEditingController();
    _des = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('prices');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Level'),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _level,
              decoration: InputDecoration(
                hintText: 'Level',
                prefixIcon: Icon(
                  Icons.star,
                  color: Colors.yellow[900],
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
              controller: _des,
              decoration: InputDecoration(
                hintText: 'Mô tả',
                prefixIcon: Icon(
                  Icons.description,
                  color: Colors.blue,
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
              controller: _servicePrice,
              decoration: InputDecoration(
                hintText: 'Giá Dịch vụ',
                prefixIcon: Icon(
                  Icons.money,
                  color: Colors.green,
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
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: RaisedButton(
                child: Text(
                  'Add Level',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  saveService();
                },
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void saveService() {
    String level = _level.text;
    String price = _servicePrice.text;
    String des = _des.text;

    Map<String, String> service = {
      'des': des,
      'level': level,
      'price': price,
    };

    _ref.push().set(service).then((value) {
      Navigator.pop(context);
    });
  }
}
