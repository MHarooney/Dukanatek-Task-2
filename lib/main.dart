import 'dart:async';

import 'package:dukanatek/Locator.dart';
import 'package:dukanatek/routs/AppRouter.dart';
import 'package:dukanatek/routs/RoutsNames.dart';
import 'package:dukanatek/screens/login/models/UserModel.dart';
import 'package:dukanatek/screens/onBoarding/onBoarding_screen.dart';
import 'package:dukanatek/services/FirebaseServices.dart';
import 'package:dukanatek/services/NavigationService.dart';
import 'package:dukanatek/utils/themes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'utils/Colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();

  setupLocator();
  runZonedGuarded(() {
    runApp(
      EasyLocalization(
        supportedLocales: [
          Locale('en', 'US'),
        ],
        path: 'assets/translations',
        startLocale: Locale('en', 'US'),
        fallbackLocale: Locale('en', 'US'),
        child: MyApp(),
      ),
    );
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
    ));
  }, (dynamic error, dynamic stack) {
    print(error);
    print(stack);
  });


}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>(
      initialData: UserModel.initial(),
      create: (BuildContext context) =>
          locator<FirebaseServices>().userController.stream,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: tr('app_name'),
        theme: darkTheme,
        // themeMode: ThemeMode.dark,
        // initialRoute: RouteName.SPLASH,
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: AppRouter.generateRoute,
        // home: OnBoardingScreen(),
      ),
    );
  }
}