import 'package:flutter/material.dart';


class SignIn  extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.cyanAccent,
    appBar: AppBar(
      backgroundColor: Colors.cyan,
      elevation: 0.0,
      title: const Text('Sign in to Easy Task List'),
),
  /*body: Container(
    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
    child: const ElevatedButton(
      onPressed: () async {

      },
      child: Text('Sigin In Anon'),
    ),
),*/
    );
  }
}
