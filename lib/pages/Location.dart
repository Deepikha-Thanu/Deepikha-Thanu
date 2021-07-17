import 'package:flutter/material.dart';
class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}
String loc='';
class _LocationState extends State<Location> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[100],
        appBar: AppBar(
          title: Center(child: Text('Location',
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
                Text('Address:',
                style: TextStyle(
                color: Colors.teal[900],
                letterSpacing: 2.0,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lobster',
                )),
                  SizedBox(height: 10.0),
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
                    },),
                  SizedBox(height: 30.0),
                  Text('City:',
                    style: TextStyle(
                      color: Colors.teal[900],
                      letterSpacing: 2.0,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lobster',
                    )),
                  SizedBox(height: 10.0),
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
                          setState(() => loc=val);
                        },
                  ),
                  SizedBox(height: 30.0),
                Text('Pincode:',
                    style: TextStyle(
                      color: Colors.teal[900],
                      letterSpacing: 2.0,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lobster',
                    )),
                  SizedBox(height: 10.0),
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
                  },),
                   SizedBox(height: 10.0),
                  Center(
                  child: RaisedButton(
                   splashColor: Colors.white,
                    child: Text('Enter',
                    style:TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Lobster',
                    ) ),
                    color: Colors.teal[800],
                    textColor: Colors.white,
                    onPressed:(){
                       if (_formKey.currentState.validate()) {
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('successful')));
                       }
                       else{
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Unsuccessful')));
                       }
                    }
                    ),)
                  ])
                  ),
          )
        ),
    );
  }
}
