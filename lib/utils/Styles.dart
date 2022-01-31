import 'package:dukanatek/utils/themes.dart';
import 'package:flutter/material.dart';

import 'Colors.dart';

const TextStyle logoStyle =
    TextStyle(color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold);

const TextStyle smallStyle = TextStyle(
  color: goldDefaultColor,
  fontSize: 14.0,
);

const TextStyle textFieldTextStyle = TextStyle(
  color: goldDefaultColor,
  fontSize: 14.0,
);

const TextStyle smallStyleWhite = TextStyle(
  color: Colors.white,
  fontSize: 14.0,
);

const TextStyle normalStyle = TextStyle(
  color: Colors.black,
  fontSize: 16.0,
);

Decoration getDefaultBorderDecoration(Color? color) {
  return BoxDecoration(
    border: Border.all(color: color == null ? borderColor : color),
    borderRadius: BorderRadius.vertical(
        top: Radius.circular(8.0), bottom: Radius.circular(5.0)),
  );
}

final Decoration? defaultBorderDecoration = BoxDecoration(
  border: Border.all(color: borderColor),
  borderRadius: BorderRadius.vertical(
      top: Radius.circular(8.0), bottom: Radius.circular(5.0)),
);

final Decoration? defaultDarkBorderDecoration = BoxDecoration(
  border: Border.all(color: borderColor),
  color: lightBlackBackGroundColor,
  borderRadius: BorderRadius.vertical(
      top: Radius.circular(8.0), bottom: Radius.circular(5.0)),
);

Decoration defaultBorderDecorationn(
    {Color? color, Color? borderColorr, BorderRadiusGeometry? borderRadius}) {
  return BoxDecoration(
    color: color == null ? Colors.transparent : color,
    border:
        Border.all(color: borderColorr == null ? borderColor : borderColorr),
    borderRadius: borderRadius == null
        ? BorderRadius.vertical(
            top: Radius.circular(8.0), bottom: Radius.circular(5.0))
        : borderRadius,
  );
}
