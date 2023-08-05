/// @authors  Katherine Bellman
/// @date    February 13th 2023
/// @description  Listens for any auth changes, shows associated view
///
import 'package:flutter/material.dart';
import 'package:easy_task_list/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'authenticate/authenticate.dart';
import 'package:easy_task_list/model/usermodel.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});


  @override
  Widget build(BuildContext context) {

    final userModel = Provider.of<UserModel?>(context);

    //return either home or Authenticate widget
    if(userModel != null){
      return const Home();
    }else{
      return  const Authenticate();
    }


  }
}
