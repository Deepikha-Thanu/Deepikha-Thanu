import 'package:flutter/material.dart';
import 'package:mech_assist/pages/User_List.dart';
import 'package:mech_assist/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Userdata extends StatefulWidget {
  @override
  _UserdataState createState() => _UserdataState();
}

class _UserdataState extends State<Userdata> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().users,
      child: Scaffold(
          backgroundColor: Colors.teal[100],
          appBar: AppBar(
            title:  Center(child: Text('Profile',
              style: TextStyle(
                fontSize: 30.0,
                fontFamily: 'Lobster',
              ),)),
            backgroundColor: Colors.teal[400],
          ),
          body: UserDataList(),
      ),
    );
  }
}
