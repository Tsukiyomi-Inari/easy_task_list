/// @authors  Katherine Bellman
/// @date    February 13th 2023
/// @description  Auth Service to interact with Firebase Authentication - methods etc
///

import 'package:easy_task_list/services/database.dart';
import 'package:easy_task_list/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:easy_task_list/model/task.dart';



class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;


  //create userModel obj on Firebase User
  UserModel? _userModelFromFirebase(User? user){
    if (user != null){
      return UserModel(uid: user.uid);
    }else{
      return null;
    }
  }

  // auth change user stream
Stream<UserModel?> get onAuthStateChanged{
    return _auth.authStateChanges()
    .map(_userModelFromFirebase);
}

  // Sign in  as anon
  Future signInAnon() async{
    try{
       UserCredential result = await _auth.signInAnonymously();
       User? user = result.user;
       return _userModelFromFirebase(user);
  }on FirebaseAuthException catch(error){
    switch (error.code) {
      case "operation-not-allowed":
        print(error.toString());
        break;
      default:
        print('Unknown error');
    }

    }
  }


  //sign in  with email + pass
Future signIn(String email, String password) async {
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    }catch(error){
      print(error.toString());
      return null;
    }
}


  //register with email + pass
  Future registerWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user!;

    /*  //Create a new document for user with their uid
         await DatabaseService(uid: user.uid).updateUserData(Task.taskList().first) + DatabaseService(uid: user.uid).updateUserData(Task.taskList().last);
*/
      return _userModelFromFirebase(user);
    }catch(error) {
      print(error.toString());
      return null;
    }
  }



  //sign out

  Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(error){
      print(error.toString());
      return null;
    }
  }
}