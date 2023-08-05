/// @authors  Katherine Bellman
/// @date    February 14th 2023
/// @description Root Authentication widget - Unauthenticated users passed to Signin/signout
///

import 'package:easy_task_list/screens/authenticate/register.dart';
import 'package:easy_task_list/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn){
      return SignIn(toggleView:toggleView);
    }else{
      return Register(toggleView: toggleView);
    }
  }

}