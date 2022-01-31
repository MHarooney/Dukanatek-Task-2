import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget widthSpace(double widthSpace) {
  return SizedBox(
    width: widthSpace,
  );
}

Widget heightSpace(double heightSpace) {
  return SizedBox(
    height: heightSpace,
  );
}

Widget tableDivider(BuildContext context) {
  return Divider(
    height: 1,
  );
}

String notNullString(var any) {
  return any == null ? "-" : any.toString();
}
