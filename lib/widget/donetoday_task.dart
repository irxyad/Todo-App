import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/components/constants.dart';
import 'package:todo_app/screens/home_screen/components/donetoday_card.dart';
import '../components/provider/taskcard_provider.dart';

class DoneTodayTask extends StatelessWidget {
  const DoneTodayTask({
    Key? key,
    required this.styleText,
    required this.systemColor,
    required this.context,
    required this.taskC,
    required this.time,
    required this.isPickTime,
    required this.listTodayTask,
  }) : super(key: key);

  final TextTheme styleText;
  final ThemeData systemColor;
  final BuildContext context;
  final TextEditingController taskC;
  final String time;
  final bool isPickTime;
  final List listTodayTask;

  @override
  Widget build(BuildContext context) {
    return Consumer<GLobalProvider>(
      builder: (context, globalProvider, child) => globalProvider
              .listDoneTodayCard.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                globalProvider.listTodayCard.isEmpty
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.dark_mode_rounded,
                              color: systemColor.hintColor),
                          const SizedBox(
                            width: 10,
                          ),
                          Text('Time to rest',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontSize: 14,
                                      color: systemColor.hintColor)),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.info_outline_rounded,
                              color: systemColor.hintColor),
                          const SizedBox(
                            width: 10,
                          ),
                          Text("You haven't finished today's task",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontSize: 14,
                                      color: systemColor.hintColor)),
                        ],
                      ),
              ],
            )
          : Column(
              mainAxisAlignment: globalProvider.listDoneTodayCard.isNotEmpty
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                        onTap: () {
                          globalProvider.clearAllDoneTodayTask();
                        },
                        child: globalProvider.listDoneTodayCard.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    right: 15.0, bottom: 10.0),
                                child: Text("Clear all",
                                    style: styleText.labelMedium),
                              )
                            : const SizedBox())),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).padding.bottom),
                    clipBehavior: Clip.antiAlias,
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 65),
                      child: globalProvider.listDoneTodayCard.isNotEmpty
                          ? ListView.builder(
                              reverse: true,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  globalProvider.listDoneTodayCard.length,
                              itemBuilder: ((context, index) {
                                final doneTodayCard =
                                    globalProvider.listDoneTodayCard[index];

                                return GestureDetector(
                                  onTap: () {
                                    globalProvider.addTodayCard(
                                      globalProvider.listDoneTodayCard[index]
                                          ["task"],
                                      globalProvider.listDoneTodayCard[index]
                                          ["time"],
                                      globalProvider.listDoneTodayCard[index]
                                          ["isPickTime"],
                                    );
                                    globalProvider.removeDoneTodayCard(index);
                                  },
                                  child: Slidable(
                                    key: Key(doneTodayCard.toString()),
                                    direction: Axis.horizontal,
                                    endActionPane: ActionPane(
                                        extentRatio: .2,
                                        motion: const StretchMotion(),
                                        children: [
                                          //Delete Icon
                                          CustomSlidableAction(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(20),
                                                    topLeft:
                                                        Radius.circular(20)),
                                            flex: 2,
                                            autoClose: true,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 0),
                                            onPressed: (context) {
                                              globalProvider
                                                  .removeDoneTodayCard(index);
                                            },
                                            backgroundColor:
                                                systemColor.errorColor,
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
                                                      style: styleText
                                                          .bodyText1!
                                                          .copyWith(
                                                              color:
                                                                  Colors.red))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ]),
                                    child: DoneTodayCard(
                                      styleText: styleText,
                                      task: globalProvider
                                          .listDoneTodayCard[index]["task"],
                                      time: globalProvider
                                          .listDoneTodayCard[index]["time"],
                                      icTime: globalProvider
                                                      .listDoneTodayCard[index]
                                                  ["isPickTime"] ==
                                              true
                                          ? SvgPicture.asset(
                                              "assets/icons/Clock.svg",
                                              height: 16,
                                              color: subColor,
                                            )
                                          : const SizedBox(),
                                    ),
                                  ),
                                );
                              }),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.info_outline_rounded,
                                    color: systemColor.hintColor),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text("You haven't finished your task",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                            fontSize: 14,
                                            color: systemColor.hintColor)),
                              ],
                            ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
