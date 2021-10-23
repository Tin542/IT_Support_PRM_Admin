
import 'package:firebase_database/firebase_database.dart';

//admin account
DatabaseReference adminRef = FirebaseDatabase.instance.reference().child("adminaccount");

//Users
DatabaseReference usersRef = FirebaseDatabase.instance.reference().child("users");

//it_support
DatabaseReference itspRef = FirebaseDatabase.instance.reference().child("itsupportaccounts");


//Request
DatabaseReference reqRef = FirebaseDatabase.instance.reference().child("requests");
