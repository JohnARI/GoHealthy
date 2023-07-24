import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgAssets {
  static SvgPicture buildSvg(
      {required String path, ColorFilter? colorFilter, double? height}) {
    return SvgPicture.asset(path,
        fit: BoxFit.cover, height: height, colorFilter: colorFilter);
  }

  static String angrySmiley = 'assets/images/AngrySmiley.svg';
  static String breakfast = 'assets/images/Breakfast.svg';
  static String breakfast2 = 'assets/images/Breakfast2.svg';
  static String calories = 'assets/images/Cal.svg';
  static String carbs = 'assets/images/Carbs.svg';
  static String dinner = 'assets/images/dinner.svg';
  static String dinner2 = 'assets/images/dinner2.svg';
  static String email = 'assets/images/Email.svg';
  static String email2 = 'assets/images/Email.svg';
  static String fat = 'assets/images/Fat.svg';
  static String filter = 'assets/images/Filter.svg';
  static String foodList = 'assets/images/FoodList.svg';
  static String foodpic = 'assets/images/FoodPic.svg';
  static String googleLogo = 'assets/images/GoogleLogo.svg';
  static String happySmiley = 'assets/images/HappySmiley.svg';
  static String home = 'assets/images/Home.svg';
  static String info = 'assets/images/Info.svg';
  static String lunch = 'assets/images/Lunch.svg';
  static String lunch2 = 'assets/images/Lunch2.svg';
  static String normalSmiley = 'assets/images/NormalSmiley.svg';
  static String password = 'assets/images/Password.svg';
  static String password2 = 'assets/images/Password2.svg';
  static String passwordNotVisible = 'assets/images/PasswordNotVisible.svg';
  static String passwordVisible = 'assets/images/PasswordVisible.svg';
  static String photo2 = 'assets/images/Photo2.svg';
  static String profile = 'assets/images/Profile.svg';
  static String protein = 'assets/images/Prot.svg';
  static String scan = 'assets/images/Scan.svg';
  static String scan2 = 'assets/images/Scan2.svg';
  static String snack = 'assets/images/Snack2.svg';
  static String stats = 'assets/images/Stats.svg';
  static String waterDropFilled = 'assets/images/WaterDropFilled .svg';
  static String waterGlass = 'assets/images/WaterGlass.svg';
}
