
import 'package:flutter/material.dart';
import 'package:quiz_app/core/utils/extensions/styles.dart';
import '../../palletes/colors/colors.dart';

void showCustomSnackBar(
    BuildContext context, {
      required String message,
      Color backgroundColor = kPrimary,
      bool floating = true,
      Duration duration = const Duration(seconds: 3),
    }) {
  final snackBar = SnackBar(
    content: Padding(
      padding: const EdgeInsets.all(6.0),
      child: Text(
        message,
        style: context.bodyMedium.copyWith(
          fontWeight: FontWeight.w500,
          color: kWhite,
        ),
      ),
    ),
    backgroundColor: backgroundColor,
    behavior: floating ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
    duration: duration,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: floating ? const EdgeInsets.all(16) : null,
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
