import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

ThemeData myLightTheme() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
      ),
    ),
    brightness: Brightness.light,
    colorScheme: const ColorScheme.dark(
        onSurface: black, brightness: Brightness.light, primary: blue),
    primaryTextTheme: const TextTheme(
      caption:
          TextStyle(fontFamily: "PoppinsSemiBold", fontSize: 20, color: black),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    ),
    timePickerTheme: TimePickerThemeData(
        backgroundColor: primaryColor,
        dialBackgroundColor: slightBlue.withOpacity(.2),
        dialTextColor: black,
        entryModeIconColor: black,
        hourMinuteTextColor: black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: black)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: black)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.blue)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
        helpTextStyle: const TextStyle(
            fontFamily: "PoppinsMedium", fontSize: 14, color: black),
        hourMinuteTextStyle: const TextStyle(
            fontFamily: "PoppinsMedium", fontSize: 16, color: black),
        hourMinuteShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        hourMinuteColor: slightBlue.withOpacity(.2),
        dialHandColor: Colors.white),
    primaryColor: primaryColor,
    primaryColorDark: slightBlue.withOpacity(.2),
    primaryColorLight: darkBlue,
    selectedRowColor: yellow.withOpacity(.5),
    errorColor: disableCardL,
    hintColor: black.withOpacity(.5),
    iconTheme: const IconThemeData(color: black),
    dialogBackgroundColor: bgSmallCardLight,
    indicatorColor: black,
    cardColor: bgSmallCardLight,
    textTheme: const TextTheme(
      headline1:
          TextStyle(fontFamily: "PoppinsSemiBold", fontSize: 20, color: black),
      headline2:
          TextStyle(fontFamily: "PoppinsSemiBold", fontSize: 16, color: black),
      headline6:
          TextStyle(fontFamily: "PoppinsMedium", fontSize: 14, color: black),
      bodyText1: TextStyle(fontFamily: "Poppins", fontSize: 16, color: black),
      bodyText2: TextStyle(fontFamily: "Poppins", fontSize: 12, color: black),
      labelMedium:
          TextStyle(fontFamily: "PoppinsMedium", fontSize: 14, color: darkBlue),
    ),
    scaffoldBackgroundColor: Colors.white,
  );
}
