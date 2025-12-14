import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../palletes/colors/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 20,
      child: Center(
        child: Platform.isIOS
            ? const CupertinoActivityIndicator()
            : CircularProgressIndicator(
          color: kWhite,
          strokeWidth: 3,
        ),
      ),
    );
  }
}

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS
          ? const CupertinoActivityIndicator(radius: 14)
          : CircularProgressIndicator(
        color: kPrimary,
        // backgroundColor: const Color.fromARGB(255, 146, 206, 255),
      ),
    );
  }
}
