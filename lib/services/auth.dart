import 'package:firebase_auth/firebase_auth.dart';


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in  as anon
  Future signInAnon() async{
    try{
       UserCredential result = await _auth.signInAnonymously();
       User? user = result.user;
       return user;
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