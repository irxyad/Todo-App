import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../components/constants.dart';
import '../components/provider/taskcard_provider.dart';
import '../screens/home_screen/components/all_method.dart/list_today_bottomsheet.dart';

// ignore: must_be_immutable
class TodayTask extends StatefulWidget {
  TodayTask({
    Key? key,
    required this.styleText,
    required this.taskC,
    required this.time,
    required this.date,
    required this.isPickDate,
    required this.isPickTime,
    required this.listTodayCard,
    required this.listCategories,
    required this.controller,
  }) : super(key: key);

  TextTheme styleText;
  final TextEditingController taskC;
  String time;
  String date;
  bool isPickDate;
  bool isPickTime;
  final List listTodayCard;
  final List listCategories;
  final DatePickerController controller;

  @override
  State<TodayTask> createState() => _TodayTask();
}

String currentData = DateFormat.Hm().format(DateTime.now());
final keyDate = UniqueKey();

class _TodayTask extends State<TodayTask> {
  @override
  Widget build(BuildContext context) {
    final styleText = Theme.of(context).textTheme;
    final systemColor = Theme.of(context);
    return GestureDetector(
      onTap: () {
        widget.isPickDate = false;
        final globalProvider =
            Provider.of<GLobalProvider>(context, listen: false);
        globalProvider.isTodo == false;
        // print(globalProvider.isTodo);
        showModalBottomSheet(
            isDismissible: true,
            isScrollControlled: false,
            useRootNavigator: true,
            constraints: BoxConstraints(minHeight: Get.height),
            barrierColor: black.withOpacity(.3),
            backgroundColor: systemColor.scaffoldBackgroundColor,
            elevation: 0,
            enableDrag: false,
            clipBehavior: Clip.antiAlias,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            context: context,
            builder: (context) {
              return ListenableProvider.value(
                value: globalProvider,
                builder: (context, _) => ListTodayBottomSheet(
                    context: context,
                    time: widget.time,
                    isPickTime: globalProvider.isPickTime,
                    listTodayTask: globalProvider.listTodayCard,
                    styleText: styleText,
                    systemColor: systemColor),
              );
            });
      },
      child: Consumer<GLobalProvider>(
        builder: (context, globalProvider, child) => Container(
          color: Colors.transparent,
          height: 179,
          width: Get.width,
          child: globalProvider.listTodayCard.isEmpty
              ? Stack(
                  children: [
                    Container(
                      height: double.infinity,
                      width: Get.width,
                      margin: hPadding,
                      padding: const EdgeInsets.all(13.0),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Color(0xFF606c88), Color(0xFF3f4c6b)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.2, 0.6]),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      //Gradient jika listToday nda ksoong

                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LottieBuilder.asset(
                            "assets/lottie/lazyDogeMoaning.json",
                            animate: true,
                            frameRate: FrameRate(60),
                            repeat: true,
                          ),
                          Text.rich(
                            textAlign: TextAlign.center,
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "No task\nFor Today\n",
                                  style: styleText.headline1!.copyWith(
                                    fontSize: 14,
                                    color: Colors.white.withOpacity(.5),
                                  ),
                                ),
                                TextSpan(
                                  text: "It's time to rest",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                          fontSize: 30,
                                          color: Colors.white,
                                          fontFamily: "Praise"),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : Stack(
                  children: [
                    Container(
                      height: double.infinity,
                      width: Get.width,
                      margin: hPadding,
                      padding: const EdgeInsets.all(13.0),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [lightBlue, blue],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.2, 0.6]),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Today task",
                            style: styleText.headline1,
                          ),
                          SizedBox(
                            height: 100,
                            child: SingleChildScrollView(
                              physics: const NeverScrollableScrollPhysics(),
                              child: ListView.builder(
                                reverse: true,
                                scrollDirection: Axis.vertical,
                                primary: true,
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: globalProvider.listTodayCard.length,
                                itemBuilder: (context, index) => Text(
                                  globalProvider.listTodayCard[index]["task"],
                                  style: styleText.bodyText2!
                                      .copyWith(fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                          globalProvider.listTodayCard.length > 5
                              ? Text(
                                  "Tap to see more",
                                  style: styleText.headline2!.copyWith(
                                      fontSize: 12,
                                      color: orange,
                                      fontStyle: FontStyle.italic),
                                )
                              : const SizedBox()
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: -35,
                      right: -26,
                      child: SizedBox(
                        height: 200,
                        child: LottieBuilder.asset(
                          "assets/lottie/lazyDogeOTW.json",
                          animate: true,
                          frameRate: FrameRate(60),
                          repeat: true,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        globalProvider.clearAllTodayTask();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 27.0, vertical: 7.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 15,
                            child: SvgPicture.asset(
                              "assets/icons/Trash can.svg",
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
