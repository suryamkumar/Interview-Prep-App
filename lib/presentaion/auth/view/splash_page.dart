// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:quiz_app/core/utils/extensions/mediaquery.dart';
import 'package:quiz_app/core/utils/extensions/navigation.dart';
import 'package:quiz_app/presentaion/auth/view/onboarding_page.dart';

import '../../../core/palletes/colors/colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 2200), () {
      context.pushAndRemoveUntil(page: OnboardingPage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: Center(
        child:
        Image.asset("assets/images/splash_screen.png",
          fit: BoxFit.cover,
        )
            .animate(delay: Duration(milliseconds: 300))
            .fadeIn(duration: Duration(milliseconds: 800)),
      ),
    );
  }
}
