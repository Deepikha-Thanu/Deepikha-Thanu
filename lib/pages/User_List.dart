import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '';
class UserDataList extends StatefulWidget {
  @override
  _UserDataListState createState() => _UserDataListState();
}

class _UserDataListState extends State<UserDataList> {

  @override
  Widget build(BuildContext context) {
    final userList = Provider.of<QuerySnapshot>(context);
    //print(userList.documents);
    for( var doc in userList.documents)
      {
        print(doc.data);
      }
    return Container(
    );
  }
}
