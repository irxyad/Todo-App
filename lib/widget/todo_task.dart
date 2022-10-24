import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widget/edit_task.dart';

import '../components/constants.dart';
import '../components/provider/taskcard_provider.dart';
import '../screens/home_screen/components/todo_card.dart';

class TodoTask extends StatelessWidget {
  const TodoTask({
    Key? key,
    required this.styleText,
    required this.systemColor,
  }) : super(key: key);
  final TextTheme styleText;
  final ThemeData systemColor;

  @override
  Widget build(BuildContext context) {
    return Consumer<GLobalProvider>(
      builder: (context, gLobalProvider, _) => Visibility(
        visible: gLobalProvider.isTodoTaskVisible,
        child: ListView.builder(
          reverse: true,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: gLobalProvider.listTodoCard.length,
          itemBuilder: ((context, index) {
            final todoCard = gLobalProvider.listTodoCard[index];
            return Slidable(
              key: Key(todoCard.toString()),
              direction: Axis.horizontal,
              endActionPane: ActionPane(
                  extentRatio: 1,
                  motion: const ScrollMotion(),
                  children: [
                    // child:

                    //AddTodayCard Icon
                    CustomSlidableAction(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                      flex: 2,
                      autoClose: true,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 0),
                      onPressed: (context) {
                        gLobalProvider.addTodayCard(
                          gLobalProvider.listTodoCard[index]["task"],
                          gLobalProvider.listTodoCard[index]["time"],
                          gLobalProvider.listTodoCard[index]["isPickTime"],
                        );
                        gLobalProvider.removeTodoCard(index);
                      },
                      backgroundColor: systemColor.primaryColor,
                      foregroundColor: Colors.white,
                      child: SingleChildScrollView(
                        clipBehavior: Clip.antiAlias,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/TodayIcon.svg",
                              color: Colors.orange.shade800,
                            ),
                            const Spacer(),
                            Text('Today', style: styleText.bodyText1)
                          ],
                        ),
                      ),
                    ),

                    //Delete Icon
                    CustomSlidableAction(
                      flex: 2,
                      autoClose: true,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 0),
                      onPressed: (context) {
                        gLobalProvider.removeTodoCard(index);
                      },
                      backgroundColor: systemColor.dialogBackgroundColor,
                      foregroundColor: Colors.white,
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
                            Text('Delete', style: styleText.bodyText1)
                          ],
                        ),
                      ),
                    ),
                  ]),
              child: TodoCard(
                press: () {
                  // gLobalProvider.listTodoCard.removeAt(index);
                  showModalBottomSheet(
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
                        return EditTask(
                          index: index,
                          date: gLobalProvider.listTodoCard[index]["date"],
                          editTaskC: TextEditingController(
                              text: gLobalProvider.listTodoCard[index]["task"]),
                          time: gLobalProvider.listTodoCard[index]["time"],
                          isPickDate: gLobalProvider.listTodoCard[index]
                              ["isPickTime"],
                          isPickTime: gLobalProvider.listTodoCard[index]
                              ["isPickDate"],
                        );
                      });
                },
                pressDone: () {
                  gLobalProvider.addDoneCard(
                    gLobalProvider.listTodoCard[index]["task"],
                    gLobalProvider.listTodoCard[index]["time"],
                    gLobalProvider.listTodoCard[index]["date"],
                    gLobalProvider.listTodoCard[index]["isPickDate"],
                    gLobalProvider.listTodoCard[index]["isPickTime"],
                  );
                  gLobalProvider.listTodoCard.removeAt(index);
                },
                styleText: styleText,
                task: gLobalProvider.listTodoCard[index]["task"],
                time: gLobalProvider.listTodoCard[index]["time"],
                space: SizedBox(
                    width:
                        gLobalProvider.listTodoCard[index]["isPickTime"] == true
                            ? 5
                            : 0),
                date: gLobalProvider.listTodoCard[index]["date"] == "Pick date"
                    ? ''
                    : gLobalProvider.listTodoCard[index]["date"],
                icTime: gLobalProvider.listTodoCard[index]["isPickTime"] == true
                    ? SvgPicture.asset(
                        "assets/icons/Clock.svg",
                        height: 16,
                        color: subColor,
                      )
                    : const SizedBox(),
                icDate: gLobalProvider.listTodoCard[index]["isPickDate"] == true
                    ? SvgPicture.asset(
                        "assets/icons/Calendar.svg",
                        height: 16,
                        color: subColor,
                      )
                    : const SizedBox(),
              ),
            );
          }),
        ),
      ),
    );
  }
}
