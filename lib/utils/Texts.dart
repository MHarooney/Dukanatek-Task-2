import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget normal11TextWhite(String header, BuildContext? context) {
  return Text(
    header,
    style: Theme.of(context!).textTheme.subtitle1,
  );
}

Widget normal10TextWhite(String header, BuildContext? context, {TextStyle? textStyle}) {
  return Text(
    header,
    style: textStyle == null ? Theme.of(context!).textTheme.headline1 : textStyle,
  );
}

Widget normal11TextGold(String header, BuildContext? context, {TextStyle? style}) {
  return Text(
    header,
    style: style == null ? Theme.of(context!).textTheme.subtitle2 : style,
  );
}

Widget normal14TextGold(String header, BuildContext? context, {TextStyle? style}) {
  return Text(
    header,
    style: style == null ? Theme.of(context!).textTheme.bodyText2 : style,
  );
}

Widget button14TextGold(String header, BuildContext? context, {TextStyle? style}) {
  return Text(
    header,
    style: style == null ? Theme.of(context!).textTheme.button : style,
  );
}

Widget titleText(String header, BuildContext? context,
    {TextStyle? style}) {
  return Text(
    header,
    style: style == null ? Theme.of(context!).textTheme.bodyText1 : style,
  );
}

Widget headLine18TitleTextGold(String header, BuildContext? context,
    {TextStyle? style}) {
  return Text(
    header,
    style: style == null ? Theme.of(context!).textTheme.headline2 : style,
  );
}

Widget headLine16TitleTextWhite(String header, BuildContext? context,
    {TextStyle? style}) {
  return Text(
    header,
    style: style == null ? Theme.of(context!).textTheme.headline3 : style,
  );
}

Widget socialButtonText(String header, Color textcolor) {
  return Text(
    header,
    style: TextStyle(
      fontSize: 14,
      color: textcolor,
    ),
  );
}

