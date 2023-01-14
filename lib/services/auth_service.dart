import 'package:firebase_auth/firebase_auth.dart';
import 'package:gas_pod/models/usermodel.dart';

class AuthServices{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on firebase user
  UserModel? _userFromFirebaseUser(User? user){
    return user != null ? UserModel(uid:user.uid)
        : null;
  }

  //sign in anonymous
  Future signInAnon() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);

    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign in with email password


  //reg with email, password


  //sign out
}

