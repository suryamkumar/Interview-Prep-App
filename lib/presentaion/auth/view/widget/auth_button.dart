import 'package:flutter/material.dart';

class AuthButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;
  final Color? color;
  const AuthButtonWidget({
    super.key,
    this.onPressed,
    required this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: Center(child: child),
      ),
    );
  }
}
