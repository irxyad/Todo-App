import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../components/constants.dart';

class TodayCard extends StatelessWidget {
  const TodayCard({
    Key? key,
    required this.styleText,
    required this.task,
    required this.time,
    required this.icTime,
    required this.press,
  }) : super(key: key);
  final String task;

  final String time;
  final TextTheme styleText;
  final Widget icTime;

  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    final systemColor = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      height: 70,
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: systemColor.primaryColor,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width / 1.6,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  task,
                  style: styleText.bodyText1,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  icTime,
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    time,
                    style: styleText.bodyText1!.copyWith(color: subColor),
                  ),
                ],
              )
            ],
          ),
          TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 20)),
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => systemColor.primaryColorDark),
              shape: MaterialStateProperty.resolveWith(
                (states) => RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            onPressed: press,
            child: Text(
              "Done",
              style: styleText.bodyText1!,
            ),
          )
        ],
      ),
    );
  }
}
