import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/components/constants.dart';

import '../components/provider/taskcard_provider.dart';
import '../screens/home_screen/components/done_card.dart';

class DoneTask extends StatelessWidget {
  const DoneTask({
    Key? key,
    required this.styleText,
    required this.systemColor,
  }) : super(key: key);

  final TextTheme styleText;
  final ThemeData systemColor;

  @override
  Widget build(BuildContext context) {
    return Consumer<GLobalProvider>(
      builder: (context, gLobalProvider, child) => Visibility(
        visible: gLobalProvider.isDoneTaskVisible,
        child: ListView.builder(
          reverse: true,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: gLobalProvider.listDoneCard.length,
          itemBuilder: ((context, index) {
            final doneCard = gLobalProvider.listDoneCard[index];

            return GestureDetector(
              onTap: () {
                gLobalProvider.addTodoCard(
                  gLobalProvider.listDoneCard[index]["task"],
                  gLobalProvider.listDoneCard[index]["time"],
                  gLobalProvider.listDoneCard[index]["date"],
                  gLobalProvider.listDoneCard[index]["isPickDate"],
                  gLobalProvider.listDoneCard[index]["isPickTime"],
                );
                gLobalProvider.removeDoneCard(index);
              },
              child: Slidable(
                key: Key(doneCard.toString()),
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
                          gLobalProvider.removeDoneCard(index);
                        },
                        backgroundColor: systemColor.errorColor,
                        foregroundColor: Colors.red,
                        child: SingleChildScrollView(
                          clipBehavior: Clip.antiAlias,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/Trash can.svg",
                                color: Colors.red,
                              ),
                              const Spacer(),
                              Text('Delete',
                                  style: styleText.bodyText1!
                                      .copyWith(color: Colors.red))
                            ],
                          ),
                        ),
                      ),
                    ]),
                child: DoneCard(
                  styleText: styleText,
                  task: gLobalProvider.listDoneCard[index]["task"],
                  time: gLobalProvider.listDoneCard[index]["time"],
                  space: SizedBox(
                      width: gLobalProvider.listDoneCard[index]["isPickTime"] ==
                              true
                          ? 5
                          : 0),
                  date: gLobalProvider.listDoneCard[index]["date"],
                  icTime:
                      gLobalProvider.listDoneCard[index]["isPickTime"] == true
                          ? SvgPicture.asset(
                              "assets/icons/Clock.svg",
                              height: 16,
                              color: subColor,
                            )
                          : const SizedBox(),
                  icDate:
                      gLobalProvider.listDoneCard[index]["isPickDate"] == true
                          ? SvgPicture.asset(
                              "assets/icons/Calendar.svg",
                              height: 16,
                              color: subColor,
                            )
                          : const SizedBox(),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
