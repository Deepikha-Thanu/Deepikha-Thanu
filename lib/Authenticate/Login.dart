import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mech_assist/services/auth.dart';
import 'package:mech_assist/shared/loading.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email='';
  String password='';
  String error='';

  @override
  Widget build(BuildContext context) {
    return loading? Loading() : Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        title:  Center(child: Text('Login',
          style: TextStyle(
            fontSize: 30.0,
            fontFamily: 'Lobster',
          ),)),
        backgroundColor: Colors.teal[400],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child:SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Center(
                  child: Icon(
                    Icons.account_circle_rounded,
                    color: Colors.teal[900],
                    size:150.0,
                  ),
                ),
                Text('Username:',
                    style: TextStyle(
                      color: Colors.teal[900],
                      letterSpacing: 2.0,
                      fontSize: 20.0,
                      fontFamily: 'Lobster',
                    )),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'abc@mail.com',
                  ),
                  validator: (String value){
                  if(value.isEmpty)
                  {
                  return 'Please Enter';
                  }
                  if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                  return 'Please a valid Email';
                  }
                  return null;
                  },
                  onChanged: (val){
                     setState(() => email = val);
                  },
                ),
                SizedBox(height: 10.0),
                Text('Password:',
                    style: TextStyle(
                      color: Colors.teal[900],
                      letterSpacing: 2.0,
                      fontSize: 20.0,
                      fontFamily: "Lobster",
                    )),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter the password',
                  ),
                  validator: (String value){
                    if(value.isEmpty){
                      return "* Required";
                    }
                    if (value.length<=6 || value.length>=15){
                      return "Must be greater than 6 and less than 15";
                    }
                    return null;
                  },
                  onChanged: (val){
                    setState(() => password = val );
                  },
                ),
                SizedBox(height: 20.0),
                Center(
                  child: RaisedButton(
                      splashColor: Colors.white,
                      child: Text('Login',
                          style:TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Lobster',
                          ) ),
                      color: Colors.teal[800],
                      textColor: Colors.white,
                      onPressed:() async {
                        if(_formKey.currentState.validate()) {
                          setState(() => loading=true);
                          dynamic result = await _auth
                              .signInWithEmailAndPassword(email, password);
                        if(result==null)
                          setState(() {
                            error = 'Could not sign in with these credentials';
                            loading = false;
                          });
                       }
                      }
                  ),
                ),
                SizedBox(height: 12.0,),
                Text(
                  error,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 20.0),
                Center(
                  child: Text('New User click here to register',
                      style: TextStyle(
                          color: Colors.teal[900],
                          letterSpacing: 2.0,
                          fontSize: 15.0,
                          fontFamily: 'Lobster'
                      )),
                ),
                Center(
                  child: RaisedButton(
                      splashColor: Colors.white,
                      child: Text('Register',
                          style:TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Lobster'
                          ) ),
                      color: Colors.teal[800],
                      textColor: Colors.white,
                      onPressed:(){
                        Navigator.pushNamed(context, '/register');
                      }
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
