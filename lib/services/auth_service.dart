import 'package:firebase_auth/firebase_auth.dart';
import 'package:gas_pod/models/usermodel.dart';
import 'package:gas_pod/services/database.dart';

class AuthServices{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on firebase user
  UserModel? _userFromFirebaseUser(User? user){
    return user != null ? UserModel(uid:user.uid)
        : null;
  }

  //auth change user stream
  Stream<UserModel?> get user {
    return _auth.authStateChanges()
        .map((_userFromFirebaseUser));
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
  Future signinWithEmailandPw(String email, String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user= result.user;
      return _userFromFirebaseUser(user);

    }catch(e){
      print(e.toString());
      return null;
    }
  }


  //reg with email, password
  Future registerWithEmailandPw(String email, String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user= result.user;
      //create a new document for user GasWeight in firebase
      await DatabaseService(uid : user?.uid).updateUserData( 0.4,0.6,);
      return _userFromFirebaseUser(user);
      
    }catch(e){
      print(e.toString());
      return null;
    }
  }


  //sign out
  Future signOut() async{
    try{
        return await _auth.signOut();
    }catch(e){
        print(e.toString());
        return null;
    }
  }
}

