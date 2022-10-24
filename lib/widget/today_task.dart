import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../components/constants.dart';
import '../components/provider/taskcard_provider.dart';
import '../screens/home_screen/components/today_card.dart';

class TodayTask extends StatelessWidget {
  const TodayTask({
    Key? key,
    required this.systemColor,
    required this.context,
    required this.textEditingController,
    required this.time,
    required this.isPickTime,
    required this.listTodayTask,
    required this.styleText,
  }) : super(key: key);
  final ThemeData systemColor;
  final BuildContext context;
  final TextEditingController textEditingController;
  final String time;
  final bool isPickTime;
  final List listTodayTask;
  final TextTheme styleText;
  @override
  Widget build(BuildContext context) {
    final styleText = Theme.of(context).textTheme;
    final systemColor = Theme.of(context);
    return Consumer<GLobalProvider>(
      builder: (context, globalProvider, _) => globalProvider
              .listTodayCard.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.info_outline_rounded,
                        color: systemColor.hintColor),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('Tap add button to add task',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 14, color: systemColor.hintColor)),
                  ],
                ),
              ],
            )
          : Column(
              mainAxisAlignment: globalProvider.listTodayCard.isNotEmpty
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                  GestureDetector(
                      onTap: () {
                        globalProvider.clearAllTodayTask();
                      },
                      child: globalProvider.listTodayCard.isNotEmpty
                          ? Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 15.0, bottom: 10.0),
                                child: Text("Clear all",
                                    style: styleText.labelMedium),
                              ),
                            )
                          : const SizedBox()),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).padding.bottom),
                      physics: const BouncingScrollPhysics(),
                      clipBehavior: Clip.antiAlias,
                      scrollDirection: Axis.vertical,
                      child: ListView.builder(
                        reverse: true,
                        shrinkWrap: true,
                        primary: true,
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: globalProvider.listTodayCard.length,
                        itemBuilder: ((context, index) {
                          final todayCard = globalProvider.listTodayCard[index];
                          //
                          return Slidable(
                            key: Key(todayCard.toString()),
                            direction: Axis.horizontal,
                            endActionPane: ActionPane(
                                extentRatio: .2,
                                motion: const StretchMotion(),
                                children: [
                                  //Delete Icon
                                  CustomSlidableAction(
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          topLeft: Radius.circular(20)),
                                      flex: 2,
                                      autoClose: true,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 0),
                                      onPressed: (context) {
                                        globalProvider.removeTodayCard(index);
                                      },
                                      backgroundColor: systemColor.errorColor,
                                      foregroundColor: Colors.red,
                                      child: SingleChildScrollView(
                                          clipBehavior: Clip.antiAlias,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  "assets/icons/Trash can.svg",
                                                  color: Colors.red,
                                                ),
                                                const Spacer(),
                                                Text('Delete',
                                                    style: styleText.bodyText1!
                                                        .copyWith(
                                                            color: Colors.red))
                                              ])))
                                ]),
                            child: TodayCard(
                              press: () {
                                globalProvider.addDoneTodayCard(
                                  globalProvider.listTodayCard[index]["task"],
                                  globalProvider.listTodayCard[index]["time"],
                                  globalProvider.listTodayCard[index]
                                      ["isPickTime"],
                                );
                                globalProvider.removeTodayCard(index);
                                // print(
                              },
                              styleText: styleText,
                              task: globalProvider.listTodayCard[index]["task"],
                              time: globalProvider.listTodayCard[index]["time"],
                              icTime: globalProvider.listTodayCard[index]
                                          ["isPickTime"] ==
                                      true
                                  ? SvgPicture.asset(
                                      "assets/icons/Clock.svg",
                                      height: 16,
                                      color: subColor,
                                    )
                                  : const SizedBox(),
                            ),
                          );
                        }),
                      ),
                    ),
                  )
                ]),
    );
  }
}
