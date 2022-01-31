import 'package:dukanatek/enums/ScreenState.dart';
import 'package:dukanatek/screens/login/viewmodel/LoginViewModel.dart';
import 'package:dukanatek/utils/Colors.dart';
import 'package:dukanatek/utils/CommonFunctions.dart';
import 'package:dukanatek/utils/Extensions.dart';
import 'package:dukanatek/utils/Styles.dart';
import 'package:dukanatek/utils/Texts.dart';
import 'package:dukanatek/utils/themes.dart';
import 'package:dukanatek/widgets/StyledButton.dart';
import 'package:dukanatek/widgets/StyledTextField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../BaseScreen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen<LoginViewModel>(
      onFinish: (_) {},
      onModelReady: (_) {},
      builder: (context, loginViewModel, child) {
        return Scaffold(
          // backgroundColor: defaultBackGroundColor,
          body: SafeArea(
            child: Center(
              child: Container(
                padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                child: SingleChildScrollView(
                  child: Form(
                    key: loginViewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/dukanatek.png'),
                        heightSpace(8),
                        titleText(
                            tr('login_to_dukanatek').toUpperCase(), context,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: goldDefaultColor, fontSize: 22)),
                        heightSpace(16),
                        Container(
                          padding: EdgeInsets.all(15.0),
                          decoration: defaultBorderDecoration,
                          child: Column(
                            children: [
                              StyledTextField(
                                controller: loginViewModel.emailController,
                                hint: tr('email'),
                                validator: loginViewModel.emailValidator(),
                                prefix: Icons.email_outlined,
                              ),
                              heightSpace(8),
                              StyledTextField(
                                controller: loginViewModel.passwordController,
                                hint: tr('password'),
                                suffix: loginViewModel.suffix,
                                validator: loginViewModel.passwordValidator(),
                                isPassword: loginViewModel.isPassword,
                                suffixPressed: () {
                                  loginViewModel.changePasswordVisibility();
                                },
                                prefix: Icons.lock_outline,
                                keyboardType: TextInputType.visiblePassword,
                              ),
                              heightSpace(24),
                              loginViewModel.state == ViewState.Busy
                                  ? Center(child: CircularProgressIndicator())
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: StyledButton(
                                        tr("login").toUpperCase(),
                                      ).onTap(() {
                                        loginViewModel.login(context);
                                      }),
                                    ),
                              heightSpace(24),
                              loginViewModel.state == ViewState.Busy
                                  ? Center(child: CircularProgressIndicator())
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: StyledButton(
                                        tr("Login With Google").toUpperCase(),
                                        image: 'assets/icons/google-ic.png',
                                      ).onTap(() {
                                        loginViewModel
                                            .signInWithGoogle(context);
                                      }),
                                    ),
                              heightSpace(24),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  normal11TextWhite(
                                      tr('dont_have_account'), context),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  normal14TextGold(tr('register'), context)
                                      .onTap(() {
                                    loginViewModel.navigateToRegisterScreen();
                                  }),
                                ],
                              ),
                              heightSpace(24),
                              normal14TextGold(
                                  tr('forget_password').toUpperCase(), context),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
