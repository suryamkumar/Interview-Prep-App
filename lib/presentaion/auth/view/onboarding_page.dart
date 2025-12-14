import 'package:flutter/material.dart';
import 'package:quiz_app/core/utils/extensions/mediaquery.dart';
import 'package:quiz_app/core/utils/extensions/navigation.dart';
import 'package:quiz_app/core/utils/extensions/styles.dart';

import '../../../core/palletes/colors/colors.dart';
import '../../../core/utils/constants/constants.dart';
import 'login_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        width: double.infinity,
        height: context.height * 0.25,
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Padding(
          padding: kPadding16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Text(
                "Welcome to",
                style: context.headLineLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "QuizWhiz",
                style: context.headLineLarge.copyWith(
                  fontWeight: FontWeight.bold,
                  color: kPrimary,
                ),
              ),
              const SizedBox(height: 18),
              // Text(
              //   "Continue as a",
              //   style: context.bodyLarge.copyWith(fontWeight: FontWeight.bold),
              // ),

              // const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: kPrimary),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () {
                          context.push(page: LoginPage());
                        },
                        child: Text(
                          "Login",
                          style: context.bodyLarge.copyWith(
                            fontWeight: FontWeight.w600,
                            color: kPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 24),

                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimary,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () {
                          context.push(page: LoginPage());
                        },
                        child: Text(
                          "Register",
                          style: context.bodyLarge.copyWith(
                            fontWeight: FontWeight.w600,
                            color: kWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              // SizedBox(
              //   height: 50,
              //   width: double.infinity,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: kWhite,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadiusGeometry.circular(100),
              //         side: BorderSide(color: kPrimary),
              //       ),
              //     ),

              //     onPressed: () {
              //       context.push(page: ParentLoginPage());
              //     },
              //     child: Text(
              //       "Parent",
              //       style: context.bodyLarge.copyWith(
              //         fontWeight: FontWeight.bold,
              //         color: kPrimary,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      backgroundColor: kWhite,
      body: Container(
        height: context.height * 1,
        width: context.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentGeometry.topCenter,
            end: AlignmentGeometry.center,
            colors: [kPrimary, kWhite],
          ),
        ),
        child: Image.asset("assets/images/onboard.png"),
      ),
    );
  }
}
