import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mech_assist/services/auth.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  final AuthService _auth = AuthService();

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
        child:Scaffold(
          drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.teal[400],
                  ),
                  child: Column(
                    children: [
                      Center(child: Icon(Icons.account_circle,color: Colors.white,size: 100.0,)),
                      Text('USERNAME',
                        style:TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Lobster',
                            color: Colors.white),),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home,size: 30.0,),
                  title: Text('Home',
                    style:TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Lobster',
                        color: Colors.teal[400]),),
                  onTap: () {
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.location_on,size: 30.0,),
                  title: Text('Location',
                    style:TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Lobster',
                        color: Colors.teal[400]),),
                  onTap: () {
                    Navigator.pushNamed(context, '/Location');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.account_box_rounded,size: 30.0,),
                  title: Text('Profile',
                    style:TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Lobster',
                        color: Colors.teal[400]),),
                  onTap: () {
                    Navigator.pushNamed(context, '/Profile');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.phone,size: 30.0,),
                  title: Text('Contact us',
                    style:TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Lobster',
                        color: Colors.teal[400]),),
                  onTap: () {
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.help,size: 30.0,),
                  title: Text('Help',
                    style:TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Lobster',
                        color: Colors.teal[400]),),
                  onTap: () {
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout,size: 30.0,),
                  title: Text('Logout',style:TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Lobster',
                      color: Colors.teal[400]),),
                  onTap: () async{
                    await _auth.SignOut();
                  },
                ),
              ],
            ),
          ),
          backgroundColor: Colors.teal[100],
            appBar: AppBar(
             title:  Center(child: Text('Services',
             style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'Lobster',
          ),)),
            bottom: TabBar(
              tabs: [
              Tab(icon: Icon(Icons.directions_car,size: 40.0,),),
              Tab(icon: Icon(Icons.directions_bike,size: 40.0,)),
              ],
              ),
        backgroundColor: Colors.teal[400],
        ),
      body: Padding(
           padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
         child: TabBarView(
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                         Image(image: AssetImage('pictures/car-repair.png'),
                         width: 110,
                         height: 110,),
                         RaisedButton(onPressed: (){
                           Navigator.pushNamed(context, '/ShopDisplay');
                         },
                           child: Text(
                               'Car Service',
                              style:TextStyle(
                                fontSize: 30.0,
                                fontFamily: 'Lobster',
                                color: Colors.white
                                ),
                             ),
                           color: Colors.teal[800],
                           splashColor: Colors.white,),
                       ],
                   ),
                  SizedBox(height: 40.0,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RaisedButton(onPressed: (){
                        Navigator.pushNamed(context, '/ShopDisplay');
                      },
                          child: Text(
                            'Car Wash',
                            style:TextStyle(
                              fontSize: 30.0,
                              fontFamily: 'Lobster',
                                color: Colors.white,
                            ),
                          ),
                        color: Colors.teal[800],
                        splashColor: Colors.white,
                      ),
                      Image(image: AssetImage('pictures/car-wash.png'),
                        width: 100,
                        height: 100,),
                    ],
                  ),
                  SizedBox(height: 40.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(image: AssetImage('pictures/tow-truck.png'),
                        width: 110,
                        height: 110,),
                      RaisedButton(onPressed: () {
                        Navigator.pushNamed(context, '/ShopDisplay');
                      },
                          child: Text(
                            'Roadside\nAssistance',
                            style:TextStyle(
                              fontSize: 30.0,
                              fontFamily: 'Lobster',
                              color: Colors.white,
                            ),
                          ),
                        color: Colors.teal[800],
                        splashColor: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(image: AssetImage('pictures/bike.png'),
                        width: 110,
                        height: 110,),
                      RaisedButton(onPressed: (){
                        Navigator.pushNamed(context, '/ShopDisplay');
                      },
                          child: Text(
                            'Bike Service',
                            style:TextStyle(
                              fontSize: 30.0,
                              fontFamily: 'Lobster',
                              color: Colors.white,
                            ),
                          ),
                        color: Colors.teal[800],
                        splashColor: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 40.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RaisedButton(onPressed: (){},
                          child: Text(
                            'Bike Wash',
                            style:TextStyle(
                              fontSize: 30.0,
                              fontFamily: 'Lobster',
                              color: Colors.white,
                            ),
                          ),
                        color: Colors.teal[800],
                        splashColor: Colors.white,
                      ),
                      Image(image: AssetImage('pictures/cleaning-staff.png'),
                        width: 100,
                        height: 100,),
                    ],
                  ),
                  SizedBox(height: 40.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(image: AssetImage('pictures/tow-truck.png'),
                        width: 100,
                        height: 100,),
                      RaisedButton(onPressed: (){},
                        child: Text(
                          'Roadside\nAssistance',
                          style:TextStyle(
                            fontSize: 30.0,
                            fontFamily: 'Lobster',
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.teal[800],
                        splashColor: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
             ],
            )
),
    ),
    );
  }
}
