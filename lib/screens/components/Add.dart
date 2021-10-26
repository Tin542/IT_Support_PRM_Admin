import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddService extends StatefulWidget {
  AddService({Key? key}) : super(key: key);

  @override
  _AddServiceState createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  late TextEditingController _device, _problem, _servicePrice;
  late String _typeSelected = '';
  late String _typeSelected2 = '';

  late DatabaseReference _ref;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _device = TextEditingController();
    _problem = TextEditingController();
    _servicePrice = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('services');
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

  Widget _basisType2(String title) {
    return InkWell(
      child: Container(
        height: 40,
        width: 90,
        decoration: BoxDecoration(
          color: _typeSelected2 == title
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
          _typeSelected2 = title;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Service'),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _device,
              decoration: InputDecoration(
                hintText: 'Hãng',
                prefixIcon: Icon(
                  Icons.devices,
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
              controller: _problem,
              decoration: InputDecoration(
                hintText: 'Vấn đề',
                prefixIcon: Icon(
                  Icons.report_problem,
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
            Container(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _basisType2('Iphone'),
                  SizedBox(
                    width: 10,
                  ),
                  _basisType2('Ipad'),
                  SizedBox(
                    width: 10,
                  ),
                  _basisType2('Điện thoại'),
                  SizedBox(
                    width: 10,
                  ),
                  _basisType2('Tablet'),
                  SizedBox(
                    width: 10,
                  ),
                  _basisType2('Laptop'),
                  SizedBox(
                    width: 10,
                  ),
                  _basisType2('PC'),
                  SizedBox(
                    width: 10,
                  ),
                  _basisType2('MacBook'),
                  SizedBox(
                    width: 10,
                  ),
                  _basisType2('IMac'),
                  SizedBox(
                    width: 10,
                  ),
                  _basisType2('Thiết bị khác'),
                ],
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
                  'Add Service',
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
    String device = _device.text;
    String problem = _problem.text;
    String price = _servicePrice.text;

    Map<String, String> service = {
      'agency': device,
      'problem': problem,
      'operating system': _typeSelected,
      'deviceType': _typeSelected2,
      'price': price,
    };

    _ref.push().set(service).then((value) {
      Navigator.pop(context);
    });
  }
}
