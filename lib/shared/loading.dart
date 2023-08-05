import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:easy_task_list/shared/colors.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: todoBackground,
      child: const Center(
        child: SpinKitFadingCircle(
          color: todoMint,
          size: 50.0,
        ),
      ),
    );
  }
}
