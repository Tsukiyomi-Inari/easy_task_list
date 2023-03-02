import 'package:flutter/material.dart';
import 'package:easy_task_list/shared/colors.dart';



const textInputDecoration =  InputDecoration(
  fillColor: transparentMint,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: todoBackground, width:1.5),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: todoMint, width: 1.5),
  ),
);
