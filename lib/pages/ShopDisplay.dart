import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'shops.dart';
class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  List<shopsDetail> shops=[
    shopsDetail(shopname: 'Example1',location: 'abc street',ratings: '4'),
    shopsDetail(shopname: 'Example2',location: 'def street',ratings: '5'),
    shopsDetail(shopname: 'Example3',location: 'ghi street', ratings: '3'),
    shopsDetail(shopname: 'Example4',location: 'abc street',ratings: '4'),
    shopsDetail(shopname: 'Example5',location: 'def street',ratings: '5'),
    shopsDetail(shopname: 'Example6',location: 'ghi street', ratings: '3'),
    shopsDetail(shopname: 'Example7',location: 'abc street',ratings: '4'),
    shopsDetail(shopname: 'Example8',location: 'def street',ratings: '5'),
    shopsDetail(shopname: 'Example9',location: 'ghi street', ratings: '3'),
  ];

  // ignore: non_constant_identifier_names
  Widget ShopTemplate (shopsDetail){
    return ShopCard(ShopsDetail:shopsDetail);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        title: Center(child: Text('Service Stations',
          style: TextStyle(
            fontSize: 30.0,
            fontFamily: 'Lobster',
          ),)),
        backgroundColor: Colors.teal[400],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: shops.map((shop) => ShopTemplate(shop)).toList(),
        ),
      ),
    );
  }
}

class ShopCard extends StatelessWidget {
  final shopsDetail ShopsDetail;
  ShopCard({this.ShopsDetail});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                ShopsDetail.shopname,
                style: TextStyle(
                    fontFamily: 'Lobster',
                    fontSize: 15.0
                ),
              ),
              Text(
                ShopsDetail.location,
                style: TextStyle(
                    fontFamily: 'Lobster',
                    fontSize: 15.0
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(100.0,10.0,10.0,0.0),
                child: RaisedButton(onPressed: (){},
                  child:Text('view shop',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'Lobster',
                    ),),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0,0.0,0.0,0.0),
            child: Text(
              ShopsDetail.ratings,
              style: TextStyle(
                  fontFamily: 'Lobster',
                  fontSize: 15.0
              ),
            ),
          ),
          Icon(Icons.star,
            color: Colors.amber,
            size: 30.0,),
        ],
      ),
    );
  }
}
