import 'package:dukanatek/enums/ScreenState.dart';
import 'package:dukanatek/models/Resources.dart';
import 'package:dukanatek/models/Status.dart';
import 'package:dukanatek/routs/RoutsNames.dart';
import 'package:dukanatek/services/FirebaseServices.dart';
import 'package:dukanatek/services/NavigationService.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Locator.dart';
import '../../BaseViewModel.dart';

class RegisterViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();

  FirebaseServices _firebaseServices = locator<FirebaseServices>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void navigateToLoginScreen() {
    locator<NavigationService>().goBack();
  }

  void register(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      //loading..
      setState(ViewState.Busy);

      Resource<String> userResponse = await _firebaseServices.register(
          emailController.value.text.toString().trim(),
          passwordController.value.text,
          nameController.value.text,
          phoneController.value.text);

      // ignore: missing_enum_constant_in_switch
      switch (userResponse.status) {
        case Status.SUCCESS:
          locator<NavigationService>().navigateToAndClearStack(RouteName.HOME);
          break;
        case Status.ERROR:
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(userResponse.errorMessage!)));
          break;
      }
      setState(ViewState.Idle);
    }
  }

  FormFieldValidator<String>? emailValidator() {
    FormFieldValidator<String>? validator = (value) {
      if (value == null || value.isEmpty) {
        return tr('please_enter_your_email');
      }
      if (!isValidEmail(value.trim())) {
        return tr('please_enter_your_valid_email');
      }

      return null;
    };

    return validator;
  }

  bool isValidEmail(String email) {
    bool emailValid = RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
    return emailValid;
  }

  FormFieldValidator<String>? passwordValidator() {
    FormFieldValidator<String>? validator = (value) {
      if (value == null || value.isEmpty) {
        return tr('please_enter_your_password');
      }
      if (value.length < 6) {
        return tr('password_more_6_chars');
      }
      return null;
    };
    return validator;
  }

  FormFieldValidator<String>? nameValidator() {
    FormFieldValidator<String>? validator = (value) {
      if (value == null || value.isEmpty) {
        return tr('please_enter_your_name');
      }
      return null;
    };
    return validator;
  }

  FormFieldValidator<String>? phoneValidator() {
    FormFieldValidator<String>? validator = (value) {
      if (value == null || value.isEmpty) {
        return tr('please_enter_your_phone');
      }
      return null;
    };
    return validator;
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    setState(ViewState.Idle);
  }
}