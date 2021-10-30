import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddService extends StatefulWidget {
  AddService({Key? key}) : super(key: key);

  @override
  _AddServiceState createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  late TextEditingController _level, _servicePrice;
  late String _typeSelected = '';

  late DatabaseReference _ref;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _level = TextEditingController();
    _servicePrice = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('prices');
  }

  Widget _basisType(String title) {
    return InkWell(
      child: Container(
        height: 40,
        width: 90,
        decoration: BoxDecoration(
          color: _typeSelected == title
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
          _typeSelected = title;
        });
      },
    );
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
            Container(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _basisType('IOS'),
                  SizedBox(
                    width: 10,
                  ),
                  _basisType('android'),
                  SizedBox(
                    width: 10,
                  ),
                  _basisType('Windown'),
                  SizedBox(
                    width: 10,
                  ),
                  _basisType('MacOS'),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
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

    Map<String, String> service = {
      'level': level,
      'category': _typeSelected,
      'price': price,
    };

    _ref.push().set(service).then((value) {
      Navigator.pop(context);
    });
  }
}
