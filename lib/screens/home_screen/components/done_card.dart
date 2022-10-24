import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/constants.dart';

class DoneCard extends StatelessWidget {
  const DoneCard({
    Key? key,
    required this.styleText,
    required this.task,
    required this.date,
    required this.icTime,
    required this.space,
    required this.icDate,
    required this.time,
  }) : super(key: key);
  final String task;
  final String date;
  final String time;
  final Widget icTime;
  final Widget space;
  final Widget icDate;
  final TextTheme styleText;

  @override
  Widget build(BuildContext context) {
    final systemColor = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      height: 70,
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: systemColor.errorColor,
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
                  style: styleText.bodyText1!.copyWith(
                      decoration: TextDecoration.lineThrough,
                      color: subColor.withOpacity(.5)),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  icTime,
                  space,
                  Text(
                    time,
                    style: styleText.bodyText2!.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: subColor.withOpacity(.5)),
                  ),
                  space,
                  icDate,
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    date,
                    style: styleText.bodyText2!.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: subColor.withOpacity(.5)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
