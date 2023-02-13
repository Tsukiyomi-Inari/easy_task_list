import 'package:flutter/material.dart';
import 'package:easy_task_list/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //return either home or Authenticate widget
    return  Home();
  }
}
