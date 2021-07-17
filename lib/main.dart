import 'package:flutter/material.dart';
import 'package:mech_assist/pages/profile.dart';
import 'package:mech_assist/services/auth.dart';
import 'package:mech_assist/pages/home.dart';
import 'package:mech_assist/pages/wrapper.dart';
import 'package:provider/provider.dart';
import 'Authenticate/Login.dart';
import 'Authenticate/Register.dart';
import 'pages/ShopDisplay.dart';
import 'pages/Location.dart';
import 'services/auth.dart';
import 'model/User.dart';


void main() => runApp(MyApp());
class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
          routes: {
            '/': (context) => Wrapper(),
            '/home': (context) => Home(),
            '/Login': (context) => Login(),
            '/register': (context) => Register(),
            '/ShopDisplay': (context) => ShopPage(),
            '/Location': (context) => Location(),
            '/Profile' : (context) => Userdata(),
          }
      ),
    );
  }
}