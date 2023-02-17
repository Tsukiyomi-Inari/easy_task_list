import 'package:easy_task_list/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:easy_task_list/constants/colors.dart';


class SignIn  extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth =  AuthService();

  // Text field state
  String email = '';
  String password = '';

  // show the password or not
  bool _isObscure = true;

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
   //Anon Sign In
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
    /*child: Form(
      child: Column(
        children:  <Widget>[
          const SizedBox(height: 20.0),
          TextFormField(
            onChanged: (val) {
              setState(() => email = val);
            },
            decoration: const InputDecoration(
              hintText: 'E-mail',
            ),
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            obscureText: _isObscure,
            onChanged: (val) {
              setState(() => password = val);
            },
            decoration: InputDecoration(
              hintText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              )
            ),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
          onPressed: ()async {
            print(email );
          },
              style: ElevatedButton.styleFrom(
              backgroundColor: todoMint,
              minimumSize: const Size(60, 60),
              elevation: 10),
            child:const Text('Sign In',
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    ),*/
),
    );
  }
}
