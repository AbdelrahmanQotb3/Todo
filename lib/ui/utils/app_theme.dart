import 'package:flutter/material.dart';
import 'app_color.dart';

abstract class AppTheme{
  /// light theme
  static const TextStyle lightAppBarTextStyle = TextStyle(
      fontSize: 22,
      color: AppColors.White,
      fontWeight: FontWeight.bold,
  );

  static const TextStyle lightContentTextStyle = TextStyle(
    fontSize: 22,
    color: AppColors.SecondaryColor,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle lightTimingContent = TextStyle(
    fontSize: 14,
    color: AppColors.lightThemeText,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle lightMediumTitleTextStyle = TextStyle(
      color: AppColors.lightThemeText,
      fontSize: 20,
      fontWeight: FontWeight.w600
  );

  static const TextStyle lightRegularTitleTextStyle = TextStyle(
      color: AppColors.lightThemeText,
      fontSize: 20,
      fontWeight: FontWeight.w400
  );



  static ThemeData LightTheme = ThemeData(
    primaryColor: AppColors.PrimaryColor,
    scaffoldBackgroundColor: AppColors.PrimaryColor,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.appBarColor,
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light ,
      primary: AppColors.PrimaryColor,
      onPrimary: AppColors.onPrimaryColor,
      secondary: AppColors.lightBlue,
      onSecondary:AppColors.lightBlue ,
      error:AppColors.Error ,
      onError:AppColors.Error ,
      background: AppColors.Transparent ,
      onBackground: AppColors.Transparent,
      surface:AppColors.Transparent ,
      onSurface:AppColors.Transparent ,


    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.SecondaryColor,
      foregroundColor: Colors.white,
      // hoverColor: Colors.white
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: false,
      showSelectedLabels: false,
      selectedItemColor: AppColors.lightBlue,
      unselectedItemColor: AppColors.onPrimaryColor,
      selectedIconTheme: IconThemeData(size: 36),
      unselectedIconTheme: IconThemeData(size: 32),
    )
  );

  /// dark theme

  static const TextStyle darkAppBarTextStyle = TextStyle(
    fontSize: 22,
    color: AppColors.White,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle darkContentTextStyle = TextStyle(
    fontSize: 30,
    color: AppColors.offWhite,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle darkMediumTitleTextStyle = TextStyle(
      color: AppColors.offWhite,
      fontSize: 20,
      fontWeight: FontWeight.w600
  );

  static const TextStyle darkRegularTitleTextStyle = TextStyle(
      color: AppColors.offWhite,
      fontSize: 20,
      fontWeight: FontWeight.w400
  );

  static ThemeData DarkTheme = ThemeData(
      primaryColor: AppColors.darkBlue,
      scaffoldBackgroundColor: AppColors.Transparent,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.Transparent,
        centerTitle: true,
      ),
      colorScheme: ColorScheme(
        brightness: Brightness.dark ,
        primary: AppColors.darkBlue,
        onPrimary: AppColors.onDarkBlue,
        secondary: AppColors.lightBlue,
        onSecondary:AppColors.lightBlue ,
        error:AppColors.Error ,
        onError:AppColors.Error ,
        background: AppColors.Transparent ,
        onBackground: AppColors.Transparent,
        surface:AppColors.Transparent ,
        onSurface:AppColors.Transparent ,


      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: AppColors.darkTask,
        unselectedItemColor: AppColors.White,
        selectedIconTheme: IconThemeData(size: 36),
        unselectedIconTheme: IconThemeData(size: 32),
      )
  );

}