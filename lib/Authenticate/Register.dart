import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mech_assist/services/auth.dart';
import 'package:mech_assist/shared/loading.dart';
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}
String email='';
String pass='';
String error='';
int phno = 0;
String name='';
class _RegisterState extends State<Register> {
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = new AuthService();
  bool loading =false;

  @override
  void dispose() {
    // TODO: implement dispose
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
        backgroundColor: Colors.teal[100],
        appBar: AppBar(
          title: Center(child: Text('Register',
            style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'Lobster',
            ),)),
          backgroundColor: Colors.teal[400],
        ),
        body: Padding(
            padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
            child: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Name:',
                              style: TextStyle(
                                color: Colors.teal[900],
                                letterSpacing: 2.0,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lobster',
                              )),
                          TextFormField(
                              maxLines: 1,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'First Name',
                              ),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Please Enter';
                                }
                                return null;
                              },
                            onChanged: (val){
                         setState(() => name= val);
                          },
                          ),
                          TextFormField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Last Name',
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text('Mail ID:',
                              style: TextStyle(
                                color: Colors.teal[900],
                                letterSpacing: 2.0,
                                fontSize: 15.0,
                                fontFamily: 'Lobster',
                                fontWeight: FontWeight.bold,
                              )),
                          TextFormField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
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
                              setState(() => email= val);
                            },
                          ),
                          SizedBox(height: 10.0),
                          Text('Personal Contact Number:',
                              style: TextStyle(
                                color: Colors.teal[900],
                                letterSpacing: 2.0,
                                fontSize: 15.0,
                                fontFamily: 'Lobster',
                                fontWeight: FontWeight.bold,
                              )),
                          TextFormField(
                              maxLines: 1,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Please Enter';
                                }
                                return null;
                              },
                            onChanged: (val){
                                setState(() => phno= int.parse(val) );
                            },
                          ),
                          SizedBox(height: 10.0),
                          Text('Password:',
                              style: TextStyle(
                                color: Colors.teal[900],
                                letterSpacing: 2.0,
                                fontSize: 15.0,
                                fontFamily: 'Lobster',
                                fontWeight: FontWeight.bold,
                              )),
                          TextFormField(
                            obscureText: true,
                            controller: password,
                            keyboardType:TextInputType.text,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password'),
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
                              setState(() => pass = val);
                            },
                          ),
                          SizedBox(height: 10.0,),
                          TextFormField(
                            obscureText: true,
                            controller: confirmPassword,
                            keyboardType:TextInputType.text,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Confirm Password'),
                            validator: (String value){
                              if(value.isEmpty){
                                return "* Required";
                              }
                              if (value.length<=6 || value.length>=15)
                              {
                                return "Must be greater than 6 and less than 15";
                              }
                              if(password.text!=confirmPassword.text)
                              {
                                return "Password doesn't match";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10.0,),
                          Center(
                            child: RaisedButton(
                                splashColor: Colors.white,
                                child: Text('Submit',
                                    style:TextStyle(
                                      fontSize: 20.0,
                                      fontFamily: 'Lobster',
                                    ) ),
                                color: Colors.teal[800],
                                textColor: Colors.white,
                                onPressed:() async{
                                  if (_formKey.currentState.validate()) {
                                    setState(() => loading = true);
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('successful')));
                                    dynamic result = await  _auth.registerWithEmailAndPassword(email, pass);
                                    if(result==null)
                                      {
                                        setState(() {
                                          error = 'Please enter a valid mail id';
                                          loading = false;
                                        });
                                      }
                                  }
                                  else{
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Unsuccessful')));
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
                        ]
                    )
                )
            ))
    );
  }
}
