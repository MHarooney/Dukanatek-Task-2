import 'package:dukanatek/screens/home/viewmodel/HomeViewModel.dart';
import 'package:dukanatek/screens/register/viewmodel/RegisterViewModel.dart';
import 'package:dukanatek/screens/splash/view_model/SplashViewModel.dart';
import 'package:dukanatek/screens/login/viewmodel/LoginViewModel.dart';
import 'package:dukanatek/services/FirebaseServices.dart';
import 'package:get_it/get_it.dart';

import 'services/NavigationService.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => FirebaseServices());
  locator.registerFactory(() => SplashViewModel());
  locator.registerFactory(() => LoginViewModel());
  locator.registerFactory(() => RegisterViewModel());
  locator.registerFactory(() => HomeViewModel());
}