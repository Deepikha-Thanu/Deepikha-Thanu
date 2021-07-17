import 'package:firebase_auth/firebase_auth.dart';
import 'package:mech_assist/model/User.dart';
import 'package:mech_assist/services/database.dart';
import 'package:mech_assist/Authenticate/Register.dart';
import 'package:mech_assist/pages/Location.dart';
class AuthService
{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFireBase(FirebaseUser user)
  {
    return user!=null ? User(uid: user.uid) : null;
  }
  //auth change user stream
  Stream<User> get user{
    return _auth.onAuthStateChanged.map(_userFromFireBase);
  }
 //Sign in anon
   Future signInAnon() async{
     try{
       AuthResult result = await _auth.signInAnonymously();
       FirebaseUser user=result.user;
       return _userFromFireBase(user);
     }catch(e){
       print(e.toString());
       return null;
     }
   }

  //sign in with email and
  Future signInWithEmailAndPassword(String email,String password) async{
    try{
      AuthResult result= await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user= result.user;
      return _userFromFireBase(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //register with email and password
  Future registerWithEmailAndPassword(String email,String password) async{
    try{
      AuthResult result= await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user= result.user;
      //create a new document for the uid
      await DatabaseService(uid: user.uid).updateUserData(name, phno, loc, 'not updated', 0);
      return _userFromFireBase(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  // sign out
   Future SignOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
   }
}