import 'package:dukanatek/routs/RoutingData.dart';
import 'package:flutter/material.dart';

extension WidgetExtension on Widget? {
  /// add tap to parent widget
  Widget onTap(
    Function? function, {
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(0)),
    Color? splashColor,
  }) {
    return InkWell(
      onTap: function as void Function()?,
      borderRadius: borderRadius,
      child: this,
      splashColor: splashColor,
    );
  }
}

extension StringExtension on String {
  RoutingData get getRoutingData {
    var uriData = Uri.parse(this);
    print('queryParameters: ${uriData.queryParameters} path: ${uriData.path}');
    return RoutingData(
      queryParameters: uriData.queryParameters,
      route: uriData.path,
    );
  }
}
