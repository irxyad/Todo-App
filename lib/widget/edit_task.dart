import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../components/provider/taskcard_provider.dart';
import 'alert_dialog.dart';

// ignore: must_be_immutable
class EditTask extends StatelessWidget {
  EditTask({
    Key? key,
    required this.time,
    required this.date,
    required this.index,
    required this.editTaskC,
    required this.isPickTime,
    required this.isPickDate,
  }) : super(key: key);
  int index;
  String time;
  String date;
  bool isPickTime;
  bool isPickDate;
  TextEditingController editTaskC;
  @override
  Widget build(BuildContext context) {
    //Variable
    String date = '';
    DateTime now = DateTime.now();
    String timeNow = DateFormat.Hm().format(now);
    String dateNow = DateFormat.MMMEd().format(now);
    final styleText = Theme.of(context).textTheme;
    final systemColor = Theme.of(context);

    //ListenableProvider
    return ListenableProvider(
      create: (context) => GLobalProvider(),
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
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: systemColor.dialogBackgroundColor,
                          borderRadius: BorderRadius.circular(25)),
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.all(10),
                      child: Consumer<GLobalProvider>(
                        builder: (context, globalProvider, child) => TextField(
                          controller: editTaskC,

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
                            if (editTaskC.text.isNotEmpty) {
                              // globalProvider.addTodoCard(
                              //   editTaskC.text,
                              //   time,
                              //   date,
                              //   isPickDate,
                              //   isPickTime,
                              // );
                              globalProvider.listTodoCard.add({
                                "task": editTaskC,
                                "time": time,
                                "date": date,
                                "isPickTime": isPickTime,
                                "isPickDate": isPickDate,
                              });
                              globalProvider.listTodoCard.removeAt(index);

                              editTaskC.clear();
                              time = '';
                              date = '';
                              isPickDate = false;
                              isPickTime = false;
                              globalProvider.iswriting = false;
                              // print(globalProvider.listTodoCard);

                              Navigator.pop(context);
                            } else {
                              alertDialog(context, systemColor, styleText);
                            }
                          },
                          onChanged: (newValue) {},
                          cursorColor: systemColor.iconTheme.color,
                          maxLines: 1,

                          decoration: InputDecoration(
                              hintText: "Input new task here",
                              suffixIcon: IconButton(
                                splashRadius: 18,
                                onPressed: () {
                                  editTaskC.clear();
                                },
                                icon: Icon(
                                  Icons.clear_rounded,
                                  color: systemColor.iconTheme.color,
                                ),
                              ),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none)),

                          cursorHeight: 25,
                          textAlign: TextAlign.start,
                          // scrollPadding: EdgeInsets.only(bottom: 40),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 55.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: systemColor.dialogBackgroundColor,
                                borderRadius: BorderRadius.circular(100)),
                            width: 140,
                            height: 40,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            child: DateTimePicker(
                                type: DateTimePickerType.time,
                                maxLines: 1,
                                style: styleText.bodyText1!.copyWith(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 13),
                                decoration: InputDecoration(
                                    hintText: "Pick time",
                                    hintStyle: styleText.bodyText1!.copyWith(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 13,
                                    ),
                                    icon: SvgPicture.asset(
                                      "assets/icons/Clock.svg",
                                      height: 20,
                                      color: systemColor.iconTheme.color,
                                    ),
                                    border: const UnderlineInputBorder(
                                        borderSide: BorderSide.none)),
                                onChanged: (val) {
                                  timeNow = val;

                                  time = timeNow;
                                  isPickTime = true;

                                  // Navigator.pop(context);
                                }),
                          ),
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: systemColor.dialogBackgroundColor,
                                borderRadius: BorderRadius.circular(100)),
                            width: 140,
                            height: 40,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            child: DateTimePicker(
                                type: DateTimePickerType.date,
                                // dateMask: 'd MMMM, yyyy',
                                maxLines: 1,
                                style: styleText.bodyText1!.copyWith(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 13),
                                decoration: InputDecoration(
                                    hintText: "Pick date",
                                    hintStyle: styleText.bodyText1!.copyWith(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 13,
                                    ),
                                    icon: SvgPicture.asset(
                                      "assets/icons/Calendar.svg",
                                      height: 20,
                                      color: systemColor.iconTheme.color,
                                    ),
                                    border: const UnderlineInputBorder(
                                        borderSide: BorderSide.none)),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                                onChanged: (val) {
                                  dateNow = val;

                                  date = dateNow;
                                  isPickDate = true;
                                }),
                          ),
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
                                color: systemColor.primaryColor, width: 5),
                          ),
                          backgroundColor: systemColor.dialogBackgroundColor,
                          padding: const EdgeInsets.all(20)),
                      onPressed: () {},
                      child: SvgPicture.asset(
                        "assets/icons/Send.svg",
                        height: 25,
                        width: 25,
                        color: systemColor.iconTheme.color,
                      )),
                )
              ],
            ),
          )),
    );
  }
}
