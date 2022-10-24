import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';

ThemeData myDarkTheme() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarContrastEnforced: true,
          systemNavigationBarIconBrightness: Brightness.dark),
    ),
    primaryColor: const Color.fromARGB(255, 31, 44, 58),
    dialogBackgroundColor: bgSmallCardDark,
    primaryColorDark: const Color.fromARGB(255, 43, 70, 99),
    errorColor: disableCardD,
    hintColor: Colors.white.withOpacity(.5),
    selectedRowColor: btnBlue,
    primaryColorLight: Colors.white,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.dark(
        onSurface: Colors.white, brightness: Brightness.light, primary: blue),
    primaryTextTheme: const TextTheme(
      caption: TextStyle(
          fontFamily: "PoppinsSemiBold", fontSize: 20, color: Colors.white),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: const Color.fromARGB(255, 31, 44, 58),
      dialBackgroundColor: bgSmallCardDark,
      dialTextColor: Colors.white,
      entryModeIconColor: Colors.white,
      hourMinuteTextColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: Colors.white)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: Colors.red)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: Colors.blue)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
      helpTextStyle: const TextStyle(
          fontFamily: "PoppinsMedium", fontSize: 14, color: Colors.white),
      hourMinuteTextStyle: const TextStyle(
          fontFamily: "PoppinsMedium", fontSize: 16, color: Colors.white),
      hourMinuteShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      dialHandColor: const Color.fromARGB(255, 31, 44, 58),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    cardColor: const Color.fromARGB(255, 43, 70, 99),
    indicatorColor: Colors.white,
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontFamily: "PoppinsSemiBold", fontSize: 20, color: Colors.white),
      headline2: TextStyle(
          fontFamily: "PoppinsSemiBold", fontSize: 16, color: Colors.white),
      headline6: TextStyle(
          fontFamily: "PoppinsMedium", fontSize: 14, color: Colors.white),
      bodyText1:
          TextStyle(fontFamily: "Poppins", fontSize: 16, color: Colors.white),
      bodyText2:
          TextStyle(fontFamily: "Poppins", fontSize: 12, color: Colors.white),
      labelMedium: TextStyle(
          fontFamily: "PoppinsMedium", fontSize: 14, color: Colors.white),
    ),
    scaffoldBackgroundColor: const Color(0xFF15202B),
  );
}
