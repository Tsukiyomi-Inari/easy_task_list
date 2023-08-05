/// @authors  Katherine Bellman
/// @date    February 13th 2023
/// @description  Signin widget with form
///
import 'package:easy_task_list/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:easy_task_list/shared/colors.dart';
import 'package:easy_task_list/shared/elements.dart';

import '../../shared/loading.dart';


class SignIn  extends StatefulWidget {

  final Function toggleView;
  const SignIn({super.key, required this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth =  AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // Text field state
  String email = '';
  String password = '';
  String error = '';

  // show the password or not
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return loading ? const Loading() : Scaffold(
    backgroundColor: transparentMint,
    appBar: AppBar(
      backgroundColor: todoMint,
      elevation: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
        Text('Sign in',
        style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),)
      ],),
      actions: <Widget>[
        TextButton.icon(
          onPressed: (){widget.toggleView();},
          style: TextButton.styleFrom(
            foregroundColor: Colors.white
          ),
          icon: const Icon(Icons.person),
          label: const Text('Sign Up'),
        )],
),
  body: Container(
    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
   /*//Anon Sign In
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
    ),*/
    child: Form(
      key: _formKey,
    child: SingleChildScrollView(
    padding: const EdgeInsets.all(16),
      child: Column(
        children:  <Widget>[
          const SizedBox(height: 20.0),
          TextFormField(
            validator: (val) => val!.isEmpty? 'Enter an email': null,
            onChanged: (val) {
              setState(() => email = val);
            },
            decoration: textInputDecoration.copyWith(hintText: 'E-mail'),
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            obscureText: _isObscure,
            validator: (val) => val!.isEmpty? 'Enter a password 6+ chars long': null,
            onChanged: (val) {
              setState(() => password = val);

            },
            decoration: textInputDecoration.copyWith(hintText: 'Password',
              suffixIcon: IconButton(
              icon: Icon(
                  _isObscure ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
              focusColor: todoMint,
                color: todoMint,
            ),)
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
          onPressed: ()async {
            if(_formKey.currentState!.validate()){
              setState( ()=> loading = true);
              dynamic result = await _auth.signIn(email, password);
              if(result == null){
                setState(() {
                  error = 'Could not sign in with those credentials';
                  loading = false;
                });
              }
            }
          },
              style: ElevatedButton.styleFrom(
              backgroundColor: todoMint,
              minimumSize: const Size(60, 60),
              elevation: 10),
            child:const Text('Sign In',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 12.0),
          Text(
            error,
            style: const TextStyle(color: todoRed, fontSize: 14.0),
          )
        ],
      ),
    ),
    ),
),
    );
  }
}
