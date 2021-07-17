import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});
  //Collection reference
  final CollectionReference userCollection = Firestore.instance.collection('UserDetails');

  Future updateUserData(String name,int phoneNo,String location,String vehicle,int noOfVehicles) async {
    return await userCollection.document(uid).setData({
      'Name' : name,
      'Phone no': phoneNo,
      'Location' : location,
      'Vehicle' : vehicle,
      'NoOfVehicles' : noOfVehicles,
    });
  }

  //get User streams
Stream<QuerySnapshot> get users{
    return userCollection.snapshots();
}
}