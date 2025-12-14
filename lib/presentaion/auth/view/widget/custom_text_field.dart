import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/palletes/colors/colors.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.obscureText = false,
    this.validator,
    this.keyboardType, this.inputFormatters,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isObscure;

  @override
  void initState() {
    super.initState();
    isObscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: isObscure,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: kGrey)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimary),
        ),
        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: kRed)),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kRed),
        ),
        suffixIcon: widget.obscureText
            ? IconButton(
          icon: Icon(
            isObscure ? Icons.visibility_off : Icons.visibility,
            color: kGrey,
          ),
          onPressed: () {
            setState(() {
              isObscure = !isObscure;
            });
          },
        )
            : null,
      ),
    );
  }
}
