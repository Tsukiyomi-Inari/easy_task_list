import 'package:flutter/material.dart';
import 'package:easy_task_list/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'authenticate/authenticate.dart';
import 'package:easy_task_list/model/usermodel.dart';

class Wrapper extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final userModel = Provider.of<UserModel?>(context);

    if(userModel == null){
      return  Authenticate();
    }else{
      return Home();
    }
    //return either home or Authenticate widget

  }
}
