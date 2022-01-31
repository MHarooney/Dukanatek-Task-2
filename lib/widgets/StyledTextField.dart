import 'package:dukanatek/utils/Styles.dart';
import 'package:dukanatek/utils/themes.dart';
import 'package:flutter/material.dart';

class StyledTextField extends StatelessWidget {
  final TextInputType? keyboardType;
  final bool isPassword;
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final IconData? prefix;
  final IconData? suffix;
  final void Function()? suffixPressed;
  final void Function(String?)? onSave;

  StyledTextField({
    this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.hint,
    this.validator,
    this.prefix,
    this.suffix,
    this.onSave,
    this.suffixPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSave,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      style: textFieldTextStyle,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFA9A9A9))),
        labelText: hint,
        labelStyle: smallStyle,
        prefixIcon: Icon(
          prefix,
          color: goldDefaultColor,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          color: goldDefaultColor,
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
          ),
        )
            : null,
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFA9A9A9))),
      ),
      validator: validator,
    );
  }
}