import 'package:dukanatek/screens/BaseScreen.dart';
import 'package:dukanatek/screens/splash/view_model/SplashViewModel.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen<SplashViewModel>(
      onModelReady: (splashViewModel) {
        splashViewModel.checkLogin();
      },
      builder: (context, splashViewModel, child) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: Center(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset('assets/images/dukanatek.png'),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
