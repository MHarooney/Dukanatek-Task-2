import 'package:dukanatek/routs/RoutsNames.dart';
import 'package:dukanatek/services/NavigationService.dart';
import 'package:dukanatek/utils/Colors.dart';
import 'package:dukanatek/utils/CommonFunctions.dart';
import 'package:dukanatek/utils/SharedPreferencesConstants.dart';
import 'package:dukanatek/utils/Styles.dart';
import 'package:dukanatek/utils/Texts.dart';
import 'package:dukanatek/utils/themes.dart';
import 'package:dukanatek/widgets/StyledButton.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dukanatek/utils/Extensions.dart';

import '../../Locator.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF333333),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/dukanatek.png',
              width: 120,
            ),
            Align(
              alignment: Alignment.center,
              child: titleText(tr('welcome_to_dukanatek').toUpperCase(), context,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: goldDefaultColor,
                        fontSize: 22,
                      )),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: defaultDarkBorderDecoration,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      normal11TextGold(
                        tr('welcome_to_dukanatek_desc'),
                        context,

                        // height: 1.5,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          RotationTransition(
                            turns: new AlwaysStoppedAnimation(40 / 360),
                            child: Image.asset(
                              'assets/icons/sim-card-ic.png',
                              width: 17,
                            ),
                          ),
                          widthSpace(
                            5.0,
                          ),
                          normal11TextGold(
                            tr('allow_access_phone_number'),
                            context,

                            // height: 1.5,
                          ),
                        ],
                      ),
                      heightSpace(10),
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/electric-fence.png',
                            width: 17,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          normal11TextGold(
                            tr('allow_access_phone_storage'), context,

                            // height: 1.5,
                          ),
                        ],
                      ),
                      heightSpace(10),
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/map-ic.png',
                            width: 17,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.75,
                            child: FittedBox(
                              child: normal11TextGold(
                                tr('allow_access_location'),
                                context,

                                // height: 1.5,
                                // maxLine: 1,
                                // presetFontSizes: [12, 11, 10, 9, 8],
                              ),
                            ),
                          ),
                        ],
                      ),
                      heightSpace(10),
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/satellite-ic.png',
                            width: 20,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          normal11TextGold(
                            tr('turn_on_gps'), context,

                            // height: 1.5,
                            // maxLine: 1,
                            // presetFontSizes: [12, 11, 10, 9, 8],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: normal11TextGold(
                tr('dukanatek_respects_your_privacy'),
                context,

                // height: 1.1,
                // style: Theme.of(context).textTheme.subtitle2.copyWith(fontFamily: '.SF UI Display'),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: StyledButton(
                tr('set_and_continue'),
                color: lightBlackBackGroundColor,
              ).onTap(() {
                setOnboardingLoaded();
                MethodChannel request_permissions = const MethodChannel('request_permissions');
                request_permissions.invokeMethod('request_permissions');
              }),
            ),
          ],
        ),
      ),
    );


  }

  void setOnboardingLoaded() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(ON_BOARDING_LOADED, true);
  }
}