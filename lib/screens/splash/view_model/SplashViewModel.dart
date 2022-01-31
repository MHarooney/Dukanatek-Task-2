import 'dart:convert';

import 'package:dukanatek/Locator.dart';
import 'package:dukanatek/routs/RoutsNames.dart';
import 'package:dukanatek/screens/BaseViewModel.dart';
import 'package:dukanatek/screens/login/models/UserModel.dart';
import 'package:dukanatek/services/FirebaseServices.dart';
import 'package:dukanatek/services/NavigationService.dart';
import 'package:dukanatek/utils/SharedPreferencesConstants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../App.dart';

class SplashViewModel extends BaseViewModel {
  void checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool onBoardingLoaded =
        await Future.value(prefs.getBool(ON_BOARDING_LOADED) ?? false);
    if (!onBoardingLoaded) {
      locator<NavigationService>()
          .navigateToAndClearStack(RouteName.ON_BOARDING);
      return;
    }
    bool isLoggedIn = await Future.value(prefs.getBool(LOGGED_IN) ?? false);
    if (isLoggedIn) {
      String userJsonString = await Future.value(prefs.getString(USER_DETAILS));
      Map<String, dynamic> user = await jsonDecode(userJsonString);
      UserModel userEvent = UserModel.fromJson(user);
      currentUserID = userEvent.id;
      locator<FirebaseServices>().userController.add(userEvent);
      locator<NavigationService>().navigateToAndClearStack(RouteName.HOME);
    } else {
      locator<NavigationService>().navigateToAndClearStack(RouteName.LOGIN);
    }
  }
}
