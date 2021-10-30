import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class EditService extends StatefulWidget {
  String contactKey;

  EditService({
    Key? key,
    required this.contactKey,
  }) : super(key: key);

  @override
  _EditServiceState createState() => _EditServiceState();
}

class _EditServiceState extends State<EditService> {
  late TextEditingController _level, _servicePrice;

  late DatabaseReference _ref;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _level = TextEditingController();
    _servicePrice = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('prices');
    getContactDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Level'),
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
                  'Save ',
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

  getContactDetail() async {
    DataSnapshot snapshot = await _ref.child(widget.contactKey).once();
    Map contact = snapshot.value;
    _level.text = contact['level'];
    _servicePrice.text = contact['price'];
  }

  void saveService() {
    String level = _level.text;
    String price = _servicePrice.text;

    Map<String, String> service = {
      'level': level,
      'price': price,
    };

    _ref.child(widget.contactKey).update(service).then((value) {
      Navigator.pop(context);
    });
  }
}
