import 'package:easy_task_list/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:easy_task_list/constants/colors.dart';


class SignIn  extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth =  AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: transparentMint,
    appBar: AppBar(
      backgroundColor: todoMint,
      elevation: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
        Text('Sign in to Easy Task List',
        style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),)
      ],
      )
),
  body: Container(
    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
    child: ElevatedButton(
      onPressed: () async {
        dynamic result = await _auth.signInAnon();
        if (result == null) {
          print('error sign in');
        }else{
          print('signed in');
          print(result);
        }
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: todoMint,
        minimumSize: const Size(60, 60),
        elevation: 10
      ),
      child: const Text('Sign In Anon',style: TextStyle(fontSize: 20),),
    ),
),
    );
  }
}
