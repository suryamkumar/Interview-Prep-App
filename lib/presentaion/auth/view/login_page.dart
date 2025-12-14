import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/utils/extensions/navigation.dart';
import 'package:quiz_app/presentaion/auth/view/widget/auth_button.dart';
import 'package:quiz_app/presentaion/auth/view/widget/custom_text_field.dart';
import '../../../core/di/init_dependencies.dart';
import '../../../core/palletes/colors/colors.dart';
import '../../../core/utils/constants/constants.dart';
import '../../../core/utils/extensions/mediaquery.dart';
import '../../../core/utils/extensions/styles.dart';
import '../../../core/utils/helper/input_restrictors.dart';
import '../../../core/utils/helper/validators.dart';
import '../../../core/utils/widget/container_icon.dart';
import '../../../core/utils/widget/loading_widget.dart';
import '../../../core/utils/widget/toast.dart';
import '../bloc/auth_bloc.dart';
import '../../home/view/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AuthBloc>(),
      child: Form(
        key: _formKey,
        child: Scaffold(
          backgroundColor: kWhite,

          bottomSheet: Container(
            width: double.infinity,
            height: context.height * 0.5,
            decoration: const BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Padding(
              padding: kPadding16,
              child: Column(
                children: [
                  const SizedBox(height: 36),

                  CustomTextFormField(
                    controller: _emailController,
                    hintText: "Enter your email",
                    inputFormatters: [InputRestrictors.noSpaces],
                    validator: FormValidators.email,
                  ),

                  const SizedBox(height: 12),

                  CustomTextFormField(
                    controller: _passController,
                    hintText: "Enter your password",
                    obscureText: true,
                    inputFormatters: [InputRestrictors.noSpaces],
                    validator: FormValidators.password,
                  ),

                  const SizedBox(height: 4),

                  Align(
                    alignment: Alignment.topRight,
                    child: Text('Forgot your password?', style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: kPrimary
                    ))
                  ),

                  const SizedBox(height: 24),

                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthFailure) {
                        log(state.message);
                        showCustomSnackBar(
                          context,
                          message: state.message,
                        );
                      }

                      if (state is LoginSuccess) {
                        context.pushAndRemoveUntil(
                          page: const HomePage(),
                        );
                        showCustomSnackBar(
                          context,
                          message: "Welcome Back ${state.name}",
                        );
                      }
                    },
                    builder: (context, state) {
                      final isLoading = state is AuthLoading;
                      return AuthButtonWidget(
                        color: isLoading
                            ? Colors.grey
                            : kPrimary,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                              LoginEvent(
                                email:_emailController.text.trim(),
                                password: _passController.text.trim(),
                              ),
                            );
                          }
                        },
                        child: isLoading
                            ? const LoadingWidget()
                            : Text(
                          "Continue",
                          style: context.bodyLarge.copyWith(
                            color: kWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),

                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "OR",
                          style: context.bodyMedium.copyWith(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SocialButton(
                        context,
                        // asset: "assets/icons/google.png",
                        label: "Google",
                        onTap: () {
                        },
                      ),
                      SocialButton(
                        context,
                        // asset: "assets/icons/apple.png",
                        label: "Apple",
                        onTap: () {
                        },
                      ),
                      SocialButton(
                        context,
                        // asset: "assets/icons/facebook.png",
                        label: "Facebook",
                        onTap: () {
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          body: Container(
            height: context.height * 0.6,
            width: context.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [kPrimary, kBackground],
              ),
            ),
            child: Image.asset("assets/images/student.png"),
          ),
        ),
      ),
    );
  }
}
