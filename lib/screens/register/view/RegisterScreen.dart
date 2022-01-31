import 'package:dukanatek/enums/ScreenState.dart';
import 'package:dukanatek/screens/register/viewmodel/RegisterViewModel.dart';
import 'package:dukanatek/utils/Colors.dart';
import 'package:dukanatek/utils/CommonFunctions.dart';
import 'package:dukanatek/utils/Styles.dart';
import 'package:dukanatek/utils/Texts.dart';
import 'package:dukanatek/utils/themes.dart';
import 'package:dukanatek/widgets/StyledButton.dart';
import 'package:dukanatek/widgets/StyledTextField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../BaseScreen.dart';
import 'package:dukanatek/utils/Extensions.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen<RegisterViewModel>(
        onModelReady: (_) {},
        builder: (context, registerViewModel, child) {
          return Scaffold(
            // backgroundColor: defaultBackGroundColor,
            appBar: AppBar(),
            body: SafeArea(
                child: Container(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: SingleChildScrollView(
                child: Center(
                  child: Form(
                    key: registerViewModel.formKey,
                    child: Column(
                      children: [
                        Image.asset('assets/images/dukanatek.png'),
                        heightSpace(8),
                        titleText(
                          tr('register_to_dukanatek').toUpperCase(), context,
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(color: goldDefaultColor, fontSize: 22)
                        ),
                        heightSpace(16),
                        Container(
                          padding: EdgeInsets.all(15.0),
                          decoration: defaultBorderDecoration,
                          child: Column(
                            children: [
                              StyledTextField(
                                controller: registerViewModel.nameController,
                                hint: tr('full_name'),
                                validator: registerViewModel.nameValidator(),
                                prefix: Icons.person,
                              ),
                              heightSpace(8),
                              StyledTextField(
                                controller: registerViewModel.phoneController,
                                hint: tr('phone'),
                                prefix: Icons.phone,
                                keyboardType: TextInputType.phone,
                                validator: registerViewModel.phoneValidator(),
                              ),
                              heightSpace(8),
                              StyledTextField(
                                controller: registerViewModel.emailController,
                                hint: tr('email'),
                                validator: registerViewModel.emailValidator(),
                                prefix: Icons.email_outlined,
                              ),
                              heightSpace(8),
                              StyledTextField(
                                controller: registerViewModel.passwordController,
                                suffix: registerViewModel.suffix,
                                hint: tr('password'),
                                validator: registerViewModel.passwordValidator(),
                                isPassword: registerViewModel.isPassword,
                                suffixPressed: () {
                                  registerViewModel
                                      .changePasswordVisibility();
                                },
                                prefix: Icons.lock_outline,
                              ),
                            ],
                          ),
                        ),
                        heightSpace(24),
                        StyledButton(tr("register").toUpperCase()).onTap(() {
                          registerViewModel.register(context);
                        }),
                        heightSpace(8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            normal11TextWhite(tr('already_have_account'), context),
                            SizedBox(
                              width: 5,
                            ),
                            normal14TextGold(tr('login').toUpperCase(), context).onTap(() {
                              registerViewModel.navigateToLoginScreen();
                            }),
                          ],
                        ),
                        heightSpace(8),
                        registerViewModel.state == ViewState.Busy
                            ? CircularProgressIndicator()
                            : Container(),
                        heightSpace(16),
                      ],
                    ),
                  ),
                ),
              ),
            )),
          );
        });
  }
}