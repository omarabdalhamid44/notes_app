import 'package:flutter/material.dart';

class SizeConfig{
  
static double? screenWidth;
static double? _screenHeight;
static double _blockWidth = 0;
static double _blockHeight = 0;

static double? textMultiplier;
static double? imageSizeMultiplier;
static double? hightMiltiplier;
static double? widthMultiplier;
static double? deviceRatio;
static bool isPortrait = true;
static bool isMobilePortrait=false;

static MediaQueryData? _mediaQueryData;

   static void init(BuildContext context){
  _mediaQueryData = MediaQuery.of(context);
  screenWidth = _mediaQueryData!.size.width;
  _screenHeight = _mediaQueryData!.size.height;
  _blockWidth  = screenWidth! / 100; 
  _blockHeight = _screenHeight! / 100;

  textMultiplier = _blockHeight;
  imageSizeMultiplier = _blockWidth;
  hightMiltiplier = _blockHeight;
  widthMultiplier = _blockWidth;
  deviceRatio = screenWidth! / _screenHeight!;
}
static double scaleTextFont(double fontsize){
  double scale = fontsize / 5.90; // ارتفاع الشاشة المصمم عليها  ويمكن تغيره
  return (textMultiplier! * scale);
}
static double scaleWidth(double width){
  double scale = width / 3.75; // عرض الشاشة المصمم عليها ويمكن تغيره
  return (widthMultiplier! * scale);

}
static double scaleHeight(double height){
  double scale = height / 8.15;
  return (hightMiltiplier! * scale);

}
}

