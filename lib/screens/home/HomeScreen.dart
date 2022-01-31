import 'package:dukanatek/App.dart';
import 'package:dukanatek/screens/home/viewmodel/HomeViewModel.dart';

import 'package:dukanatek/utils/Extensions.dart';
import 'package:dukanatek/utils/Texts.dart';
import 'package:dukanatek/utils/icon_broken.dart';
import 'package:dukanatek/utils/themes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../Locator.dart';
import '../BaseScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen<HomeViewModel>(
      onModelReady: (homeViewModel) {
      },
      onFinish: (_) {
        print(' home screen finished');
      },
      builder: (context, homeViewModel, child) {
        print(' home screen started');
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: Text("Hello to Dukanatek"),
            ),
          );
      },
    );
  }
}