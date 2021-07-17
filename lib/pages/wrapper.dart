import 'package:flutter/material.dart';
import 'package:mech_assist/Authenticate/Login.dart';
import 'package:mech_assist/pages/home.dart';
import 'package:provider/provider.dart';
import 'package:mech_assist/model/User.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either home or login
    final user=Provider.of<User>(context);

    if(user==null) {
      return Login();
    }
    else{
      return Home();
    }
  }
}
