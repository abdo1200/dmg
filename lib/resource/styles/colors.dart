import 'package:flutter/material.dart';

const blackLight = Color.fromRGBO(16, 16, 16, 1);
const black = Color.fromRGBO(0, 0, 0, 1);
const darkGray = Color.fromRGBO(140, 140, 140, 1);
const normalGray = Color.fromRGBO(191, 191, 191, 1);
const lightGray = Color.fromRGBO(245, 245, 245, 1);
const lightGray2 = Color(0xfff5f5f5);
const bgGray = Color(0xfff2f2f2);
const lightGrayEvaluation = Color.fromRGBO(0, 0, 0, 0.16);
const darkGreen = Color.fromRGBO(0, 122, 123, 1.0);
const white = Color.fromRGBO(255, 255, 255, 1);
const darkRed = Color.fromRGBO(183, 4, 16, 1);
const dialogBg = Color.fromRGBO(26, 24, 23, 0.16);
const blueFace = Color(0xff3e5c9a);
const orange = Color(0xffFEA02F);
const placeGray = Color(0xffBFBFBF);
const witheTransparent = Color.fromRGBO(255, 255, 255, 1);
const witheTransparent2 = Color.fromRGBO(255, 255, 255, 0);
const witheTransparent3 = Color.fromRGBO(255, 255, 255, 0.9);
const witheTransparent4 = Color.fromRGBO(255, 255, 255, 0.5);
const witheTransparent5 = Color.fromRGBO(255, 255, 255, 0.9);
const grayBorder = Color.fromRGBO(218, 229, 230, 1);
const grayBorder2 = Color.fromRGBO(245, 245, 245, 1);
const grayBorder3 = Color.fromRGBO(241, 241, 241, 1);
const green = Color(0xff0AB704);
const runner_bg = Color(0xffe6f1f2);

Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return darkGreen;
  }
  return lightGray;
}
