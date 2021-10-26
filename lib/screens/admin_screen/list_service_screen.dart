import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it_support/screens/components/Add.dart';

class ListService extends StatefulWidget {
  ListService({Key? key}) : super(key: key);

  @override
  _ListServiceState createState() => _ListServiceState();
}

class _ListServiceState extends State<ListService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mangage service and price'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return AddService();
          }));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
