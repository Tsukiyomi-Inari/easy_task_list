
import 'package:easy_task_list/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';


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

  //register with email + pass

  //sign out
}