import 'dart:async';
import 'package:flutter/material.dart';

Future<dynamic> alertDialog(
    BuildContext context, ThemeData systemColor, TextTheme styleText) {
  return showDialog(
      context: context,
      builder: (context) {
        Timer(const Duration(seconds: 2), () {
          Navigator.of(context).pop();
        });
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: systemColor.cardColor,
          content: Row(
            children: [
              Icon(
                Icons.warning_rounded,
                color: systemColor.primaryColorLight,
              ),
              Text(
                "You have not entered a new task",
                style: styleText.bodyText1!.copyWith(
                    color: systemColor.primaryColorLight, fontSize: 12),
              )
            ],
          ),
        );
      });
}
