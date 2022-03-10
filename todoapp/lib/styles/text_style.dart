import 'package:flutter/cupertino.dart';
import 'package:todoapp/styles/colors.dart';

class AppTextStyle {
  //typetextTextStyle
  static const titleTextStyle = TextStyle(
    color: AppColors.blackColor,
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
  );
  static const subTitleTextStyle = TextStyle(
    color: AppColors.secondaryColor,
    fontSize: 20.0,
    fontWeight: FontWeight.w400,
  );
  static const itemTextStyle = TextStyle(
    color: AppColors.lightGreyColor,
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
  );
}
