import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgAssets {
  static SvgPicture buildSvg(
      {required String path, ColorFilter? colorFilter, double? height}) {
    return SvgPicture.asset(path,
        fit: BoxFit.cover, height: height, colorFilter: colorFilter);
  }

  static const String angrySmiley = 'assets/images/AngrySmiley.svg';
  static const String breakfast = 'assets/images/Breakfast.svg';
  static const String breakfast2 = 'assets/images/Breakfast2.svg';
  static const String calories = 'assets/images/Cal.svg';
  static const String carbs = 'assets/images/Carbs.svg';
  static const String dinner = 'assets/images/dinner.svg';
  static const String dinner2 = 'assets/images/dinner2.svg';
  static const String roundedEmail = 'assets/images/Email.svg';
  static const String email = 'assets/images/Email2.svg';
  static const String fat = 'assets/images/Fat.svg';
  static const String filter = 'assets/images/Filter.svg';
  static const String foodList = 'assets/images/FoodList.svg';
  static const String foodpic = 'assets/images/FoodPic.svg';
  static const String googleLogo = 'assets/images/GoogleLogo.svg';
  static const String happySmiley = 'assets/images/HappySmiley.svg';
  static const String home = 'assets/images/Home.svg';
  static const String info = 'assets/images/Info.svg';
  static const String lunch = 'assets/images/Lunch.svg';
  static const String lunch2 = 'assets/images/Lunch2.svg';
  static const String normalSmiley = 'assets/images/NormalSmiley.svg';
  static const String roundedPassword = 'assets/images/Password.svg';
  static const String password = 'assets/images/Password2.svg';
  static const String passwordNotVisible = 'assets/images/PasswordNotVisible.svg';
  static const String passwordVisible = 'assets/images/PasswordVisible.svg';
  static const String photo2 = 'assets/images/Photo2.svg';
  static const String profile = 'assets/images/Profile.svg';
  static const String protein = 'assets/images/Prot.svg';
  static const String scan = 'assets/images/Scan.svg';
  static const String scan2 = 'assets/images/Scan2.svg';
  static const String snack = 'assets/images/Snack2.svg';
  static const String stats = 'assets/images/Stats.svg';
  static const String waterDropFilled = 'assets/images/WaterDropFilled.svg';
  static const String waterGlass = 'assets/images/WaterGlass.svg';
}
