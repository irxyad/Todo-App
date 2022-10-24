import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/constants.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    Key? key,
    required this.styleText,
    required this.task,
    required this.date,
    required this.time,
    required this.icTime,
    required this.space,
    required this.icDate,
    required this.press,
    required this.pressDone,
  }) : super(key: key);
  final String task;
  final String date;
  final String time;
  final TextTheme styleText;
  final Widget icTime;
  final Widget space;
  final Widget icDate;
  final VoidCallback press;
  final VoidCallback pressDone;

  @override
  Widget build(BuildContext context) {
    final systemColor = Theme.of(context);

    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
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
                    space,
                    Text(
                      time,
                      style: styleText.bodyText2!.copyWith(color: subColor),
                    ),
                    space,
                    icDate,
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      date,
                      style: styleText.bodyText2!.copyWith(color: subColor),
                    ),
                    const SizedBox(
                      width: 5,
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
              onPressed: pressDone,
              child: Text(
                "Done",
                style: styleText.bodyText1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
