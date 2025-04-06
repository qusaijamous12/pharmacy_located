import 'package:flutter/cupertino.dart';

TextStyle _getMyTextStyle({required Color color,required double fontSize,required FontWeight fontWeight}){
  return TextStyle(
      color: color,
      fontSize: fontSize,
      fontFamily: FontFamily.interFamily,
      fontWeight: fontWeight
  );
}


TextStyle getMyLightTextStyle({required Color textColor,double fontSize=18,FontWeight fontWeight=FontWeight.w300}){
  return _getMyTextStyle(color: textColor, fontSize: fontSize, fontWeight: fontWeight);
}

TextStyle getMyRegularTextStyle({required Color textColor,double fontSize=18,FontWeight fontWeight=FontWeight.w400}){
  return _getMyTextStyle(color: textColor, fontSize: fontSize, fontWeight: fontWeight);
}

TextStyle getMyMediumTextStyle({required Color textColor,double fontSize=18,FontWeight fontWeight=FontWeight.w500}){
  return _getMyTextStyle(color: textColor, fontSize: fontSize, fontWeight: fontWeight);
}
TextStyle getMyBoldTextStyle({required Color textColor,double fontSize=18,FontWeight fontWeight=FontWeight.w600}){
  return _getMyTextStyle(color: textColor, fontSize: fontSize, fontWeight: fontWeight);
}


class FontFamily{
  static const String interFamily='Inter';
}