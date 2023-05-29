import 'package:flutter/material.dart';
import 'package:sleep_walking_detector/consts/consts.dart';

Widget homeButtons({width, height, icon, String? title, String? data, onPress}){
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(icon, width: 26),
        5.heightBox,
        title!.text.fontFamily(semibold).color(darkFontGrey).make(),
      ],
    ),
  ).box.rounded.white.size(width, height).shadowSm.make();
}