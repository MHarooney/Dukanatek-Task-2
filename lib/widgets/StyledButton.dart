import 'package:dukanatek/utils/Colors.dart';
import 'package:dukanatek/utils/Texts.dart';
import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  final String text;
  final Color? color;
  final String? image;

  StyledButton(this.text, {this.color, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: color == null ?Colors.transparent : color,
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Row(
            mainAxisAlignment: image == null ? MainAxisAlignment.center : MainAxisAlignment.spaceEvenly,
            children: [
              image == null ? Container() : Image.asset(image!),
              button14TextGold(text, context),
            ],
          ),
        ),
      ),
    );
  }
}