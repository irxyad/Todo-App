import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../components/constants.dart';
import '../components/provider/taskcard_provider.dart';

import 'alert_dialog.dart';

// ignore: must_be_immutable
class FloatActionBtn extends StatefulWidget {
  FloatActionBtn(
      {Key? key,
      required this.time,
      this.date = '',
      required this.isPickTime,
      required this.showDate,
      required this.isTodo,
      this.isPickDate = false,
      required this.listTask})
      : super(key: key);
  String time;
  String date;
  bool isPickDate;
  bool isPickTime;
  bool isTodo;
  bool showDate;
  final List listTask;

  @override
  State<FloatActionBtn> createState() => _FloatActionBtnState();
}

class _FloatActionBtnState extends State<FloatActionBtn> {
  final keyDate = UniqueKey();
  final taskC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styleText = Theme.of(context).textTheme;
    final systemColor = Theme.of(context);
    return SizedBox(
      height: 55,
      width: 55,
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: () {
            taskC.clear();

            final globalProvider =
                Provider.of<GLobalProvider>(context, listen: false);
            globalProvider.isTodo = widget.isTodo;
            globalProvider.selectedDate = "Pick date";
            globalProvider.selectedTime = "Pick time";
            globalProvider.isPickTime = false;
            globalProvider.isPickDate = false;
            showModalBottomSheet(
                // backgroundColor: systemColor.dialogBackgroundColor,
                elevation: 0,
                enableDrag: true,
                clipBehavior: Clip.antiAlias,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                context: context,
                builder: (context) {
                  // print(globalProvider.isTodo);
                  return ListenableProvider.value(
                    value: globalProvider,
                    builder: (context, _) => Container(
                        padding: EdgeInsets.only(
                          top: 10.0,
                          bottom: MediaQuery.of(context).viewInsets.bottom + 5,
                        ),
                        color: systemColor.primaryColor,
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Consumer<GLobalProvider>(
                            builder: (context, globalProvider, child) => Stack(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                      child: TextButton(
                                          style: ButtonStyle(
                                              overlayColor:
                                                  MaterialStateProperty.all(
                                                      Colors.transparent),
                                              visualDensity:
                                                  VisualDensity.compact,
                                              padding:
                                                  MaterialStateProperty.all(
                                                      EdgeInsets.zero)),
                                          onPressed: () {
                                            final globalProvider =
                                                Provider.of<GLobalProvider>(
                                                    context,
                                                    listen: false);
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    ListenableProvider.value(
                                                      value: globalProvider,
                                                      child: AlertDialog(
                                                          actionsAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          contentPadding:
                                                              const EdgeInsets.all(
                                                                  10),
                                                          actionsPadding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      5.0,
                                                                  vertical:
                                                                      10.0),
                                                          backgroundColor: systemColor
                                                              .primaryColor,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                          content: SizedBox(
                                                            height: 200,
                                                            width: 300,
                                                            child: ListView
                                                                .builder(
                                                              itemCount: widget
                                                                  .listTask
                                                                  .length,
                                                              itemBuilder: (context,
                                                                      index) =>
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {},
                                                                      child:
                                                                          Text(
                                                                        widget
                                                                            .listTask[index]
                                                                            .toString(),
                                                                        style: styleText
                                                                            .bodyText1,
                                                                      )),
                                                            ),
                                                          )),
                                                    ));
                                          },
                                          child: Text(
                                            "No Category",
                                            style: styleText.headline1!
                                                .copyWith(fontSize: 13),
                                          )),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color:
                                              systemColor.dialogBackgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      padding: const EdgeInsets.all(10.0),
                                      margin: const EdgeInsets.all(10),
                                      child: Consumer<GLobalProvider>(
                                        builder:
                                            (context, globalProvider, child) =>
                                                TextField(
                                          controller: taskC,
                                          showCursor: true,
                                          style: styleText.bodyText1,

                                          toolbarOptions: const ToolbarOptions(
                                              copy: true,
                                              cut: true,
                                              paste: true,
                                              selectAll: true),
                                          autofocus: true,
                                          textInputAction: TextInputAction.done,

                                          onEditingComplete: () {
                                            if (taskC.text.isNotEmpty) {
                                              if (globalProvider.isTodo ==
                                                  true) {
                                                globalProvider.addTodoCard(
                                                  taskC.text,
                                                  globalProvider.selectedTime ==
                                                          "Pick time"
                                                      ? ''
                                                      : globalProvider
                                                          .selectedTime,
                                                  globalProvider.selectedDate,
                                                  globalProvider.isPickDate,
                                                  globalProvider.isPickTime,
                                                );
                                              } else {
                                                globalProvider.addTodayCard(
                                                  taskC.text,
                                                  globalProvider.selectedTime ==
                                                          "Pick time"
                                                      ? ''
                                                      : globalProvider
                                                          .selectedTime,
                                                  globalProvider.isPickTime,
                                                );
                                              }

                                              taskC.clear();
                                              globalProvider.selectedTime =
                                                  "Pick time";
                                              globalProvider.selectedDate =
                                                  "Pick date";
                                              widget.time = '';
                                              widget.date = '';
                                              widget.isPickDate = false;
                                              widget.isPickTime = false;
                                              globalProvider.iswriting = false;

                                              Navigator.pop(context);
                                            } else {
                                              alertDialog(context, systemColor,
                                                  styleText);
                                            }
                                          },
                                          cursorColor:
                                              systemColor.iconTheme.color,
                                          maxLines: 1,

                                          decoration: InputDecoration(
                                              hintText: "Input new task here",
                                              suffixIcon: globalProvider
                                                          .iswriting ==
                                                      true
                                                  ? IconButton(
                                                      splashRadius: 18,
                                                      onPressed: () {
                                                        globalProvider
                                                            .iswriting = false;
                                                        taskC.clear();
                                                      },
                                                      icon: Icon(
                                                        Icons.clear_rounded,
                                                        color: systemColor
                                                            .iconTheme.color,
                                                      ),
                                                    )
                                                  : const SizedBox(),
                                              border: const OutlineInputBorder(
                                                  borderSide: BorderSide.none)),

                                          cursorHeight: 25,
                                          textAlign: TextAlign.start,
                                          // scrollPadding: EdgeInsets.only(bottom: 40),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 55.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Consumer<GLobalProvider>(
                                            builder: (context, globalProvider,
                                                    child) =>
                                                GestureDetector(
                                              onTap: () {
                                                globalProvider
                                                    .pickTime(context);
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: systemColor
                                                        .dialogBackgroundColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100)),
                                                // width: 170,
                                                height: 40,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10.0),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    SvgPicture.asset(
                                                      "assets/icons/Clock.svg",
                                                      height: 20,
                                                      color: systemColor
                                                          .iconTheme.color,
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      globalProvider
                                                          .selectedTime,
                                                      style:
                                                          styleText.bodyText1,
                                                    ),
                                                    globalProvider.isPickTime ==
                                                            true
                                                        ? GestureDetector(
                                                            onTap: () {
                                                              globalProvider
                                                                      .isPickTime =
                                                                  false;
                                                              globalProvider
                                                                      .selectedTime =
                                                                  "Pick time";
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .clear_rounded,
                                                              size: 20,
                                                              color: systemColor
                                                                  .iconTheme
                                                                  .color,
                                                            ),
                                                          )
                                                        : const SizedBox()
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          widget.showDate == true
                                              ? GestureDetector(
                                                  onTap: () {
                                                    globalProvider
                                                        .pickDate(context);
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        color: systemColor
                                                            .dialogBackgroundColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100)),
                                                    // width: 170,
                                                    height: 40,
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10.0),
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        SvgPicture.asset(
                                                          "assets/icons/Calendar.svg",
                                                          height: 20,
                                                          color: systemColor
                                                              .iconTheme.color,
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          textAlign:
                                                              TextAlign.center,
                                                          globalProvider
                                                              .selectedDate,
                                                          style: styleText
                                                              .bodyText1,
                                                        ),
                                                        globalProvider
                                                                    .isPickDate ==
                                                                true
                                                            ? GestureDetector(
                                                                onTap: () {
                                                                  globalProvider
                                                                          .isPickDate =
                                                                      false;
                                                                  globalProvider
                                                                          .selectedDate =
                                                                      "Pick date";
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .clear_rounded,
                                                                  size: 20,
                                                                  color: systemColor
                                                                      .iconTheme
                                                                      .color,
                                                                ),
                                                              )
                                                            : const SizedBox()
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              : const SizedBox()
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                  bottom: 5,
                                  right: 10,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          shape: CircleBorder(
                                            side: BorderSide(
                                                color: systemColor.primaryColor,
                                                width: 5),
                                          ),
                                          backgroundColor:
                                              systemColor.dialogBackgroundColor,
                                          padding: const EdgeInsets.all(20)),
                                      onPressed: () {
                                        if (taskC.text.isNotEmpty) {
                                          if (globalProvider.isTodo == true) {
                                            globalProvider.addTodoCard(
                                              taskC.text,
                                              globalProvider.selectedTime ==
                                                      "Pick time"
                                                  ? ''
                                                  : globalProvider.selectedTime,
                                              globalProvider.selectedDate,
                                              globalProvider.isPickDate,
                                              globalProvider.isPickTime,
                                            );
                                          } else {
                                            globalProvider.addTodayCard(
                                              taskC.text,
                                              globalProvider.selectedTime ==
                                                      "Pick time"
                                                  ? ''
                                                  : globalProvider.selectedTime,
                                              globalProvider.isPickTime,
                                            );
                                          }

                                          taskC.clear();
                                          globalProvider.selectedTime =
                                              "Pick time";
                                          globalProvider.selectedDate =
                                              "Pick date";
                                          widget.time = '';
                                          widget.date = '';
                                          widget.isPickDate = false;
                                          widget.isPickTime = false;
                                          globalProvider.iswriting = false;

                                          Navigator.pop(context);
                                        } else {
                                          alertDialog(
                                              context, systemColor, styleText);
                                        }
                                      },
                                      child: SvgPicture.asset(
                                        "assets/icons/Send.svg",
                                        height: 25,
                                        width: 25,
                                        color: systemColor.iconTheme.color,
                                      )),
                                )
                              ],
                            ),
                          ),
                        )),
                  );
                });
          },
          backgroundColor: lightBlue,
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          highlightElevation: 5,
          splashColor: blue,
          tooltip: "Add task",
          materialTapTargetSize: MaterialTapTargetSize.padded,
          child: Container(
            padding: const EdgeInsets.all(20),
            // width: 70,
            // height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: [lightBlue, blue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.2, 0.6]),
            ),
            child: SvgPicture.asset(
              "assets/icons/Plus.svg",
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
