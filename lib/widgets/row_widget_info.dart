import 'package:dukanatek/utils/Texts.dart';
import 'package:flutter/material.dart';

class RowInfoWidget extends StatelessWidget {

  final String parameterInfo;
  final String parameterName;

  const RowInfoWidget(
    this.parameterInfo,
    this.parameterName,
  );


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        normal11TextWhite(parameterName, context),
        normal11TextGold(parameterInfo, context),
      ],
    );
  }
}