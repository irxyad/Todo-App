import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/components/constants.dart';
import 'package:todo_app/components/provider/taskcard_provider.dart';
import 'package:todo_app/widget/floating_actbtn.dart';
import 'package:todo_app/widget/todo_task.dart';
import '../../widget/done_task.dart';
import '../../widget/my_appbar.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import '../../widget/todaycard_container.dart';
import 'components/drawer/nav_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final taskC = TextEditingController();
  String time = '';
  String date = '';
  String currentData = DateFormat.Hm().format(DateTime.now());
  final DatePickerController _controller = DatePickerController();
  bool isPickDate = false;
  bool isPickTime = false;
  bool todoVisible = true;
  bool doneVisible = true;

  // ignore: unused_field
  // DateTime currentData = DateTime.now();

  final List listTodayCard = [];
  final List listCategories = ["Work", "Figma", "School"];

  @override
  Widget build(BuildContext context) {
    final styleText = Theme.of(context).textTheme;
    final systemColor = Theme.of(context);
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return ChangeNotifierProvider<GLobalProvider>(
        create: (context) => GLobalProvider(),
        builder: (context, _) {
          return Scaffold(
            key: scaffoldKey,
            drawer: const DrawerWidget(),
            drawerDragStartBehavior: DragStartBehavior.start,
            drawerEdgeDragWidth: 15,
            extendBodyBehindAppBar: true,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(120),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                clipBehavior: Clip.antiAlias,
                child: Consumer<GLobalProvider>(
                  builder: (context, globalProvider, child) => MyAppBar(
                      scaffoldKey: scaffoldKey,
                      systemColor: systemColor,
                      styleText: styleText,
                      totalTaskToday: globalProvider.listTodayCard.isEmpty
                          ? "No task for today"
                          : "${globalProvider.listTodayCard.length} Task for today"),
                ),
              ),
            ),
            body: Consumer<GLobalProvider>(
              builder: (context, gLobalProvider, child) =>
                  SingleChildScrollView(
                padding: const EdgeInsets.only(top: 140),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //TodayCard
                      TodayTask(
                        date: date,
                        styleText: styleText,
                        time: time,
                        controller: _controller,
                        isPickDate: isPickDate,
                        isPickTime: isPickTime,
                        listCategories: listCategories,
                        listTodayCard: listTodayCard,
                        taskC: taskC,
                      ),
                      //Text Categories
                      // Padding(
                      //   padding: hPadding.copyWith(top: 19.0),
                      //   child: Row(
                      //     crossAxisAlignment: CrossAxisAlignment.end,
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Text(
                      //         "Categories",
                      //         style: styleText.headline1,
                      //       ),
                      //       GestureDetector(
                      //         onTap: () => Navigator.of(context).push(
                      //             MaterialPageRoute(
                      //                 builder: (context) =>
                      //                     const CategoryList())),
                      //         child: Text(
                      //           "See all",
                      //           style: styleText.labelMedium,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      //Card Categories
                      // SliderCardCategories(
                      //   notyetList: gLobalProvider.listTodoCard,
                      //   doneList: gLobalProvider.listDoneCard,
                      //   styleText: styleText,
                      // ),
                      //All task
                      gLobalProvider.listTodoCard.isEmpty
                          ? const SizedBox()
                          : Padding(
                              padding: hPadding.copyWith(top: 20.0),
                              child: Text(
                                "All task",
                                style: styleText.headline1,
                              ),
                            ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      //To do
                      gLobalProvider.listTodoCard.isEmpty
                          ? Center(
                              child: Opacity(
                                opacity: 1,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.info_outline_rounded,
                                            color: systemColor.hintColor),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text('Tap floating button to add task',
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2!
                                                .copyWith(
                                                    fontSize: 14,
                                                    color:
                                                        systemColor.hintColor)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Padding(
                              padding: hPadding,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "To do",
                                        style: styleText.bodyText1,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Consumer<GLobalProvider>(
                                        builder: (context, taskCardProvider,
                                                child) =>
                                            GestureDetector(
                                          onTap: (() {
                                            // print(gLobalProvider.listTodoCard);
                                            taskCardProvider.isTodoTaskVisible =
                                                !taskCardProvider
                                                    .isTodoTaskVisible;
                                          }),
                                          child: SvgPicture.asset(
                                            taskCardProvider
                                                        .isTodoTaskVisible ==
                                                    false
                                                ? "assets/icons/Down.svg"
                                                : "assets/icons/Arrow_up.svg",
                                            height: 13,
                                            color:
                                                systemColor.primaryColorLight,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // SvgPicture.asset(
                                  //   "assets/icons/Filter.svg",
                                  //   height: 20,
                                  //   color: systemColor.primaryColorLight,
                                  // )
                                ],
                              ),
                            ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      //Task todo
                      TodoTask(styleText: styleText, systemColor: systemColor),
                      const SizedBox(
                        height: 10.0,
                      ),
                      //Done
                      gLobalProvider.listDoneCard.isEmpty
                          ? const SizedBox()
                          : Consumer<GLobalProvider>(
                              builder: (context, gLobalProvider, child) =>
                                  Padding(
                                padding: hPadding,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Done",
                                          style: styleText.bodyText1,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            gLobalProvider.isDoneTaskVisible =
                                                !gLobalProvider
                                                    .isDoneTaskVisible;
                                          },
                                          child: SvgPicture.asset(
                                            gLobalProvider.isDoneTaskVisible ==
                                                    false
                                                ? "assets/icons/Down.svg"
                                                : "assets/icons/Arrow_up.svg",
                                            height: 13,
                                            color:
                                                systemColor.primaryColorLight,
                                          ),
                                        ),
                                      ],
                                    ),
                                    gLobalProvider.listDoneCard.isNotEmpty
                                        ? GestureDetector(
                                            onTap: () => gLobalProvider
                                                .clearAllDoneTask(),
                                            child: Text(
                                              "Clear all",
                                              style: styleText.labelMedium,
                                            ),
                                          )
                                        : const SizedBox()
                                  ],
                                ),
                              ),
                            ),
                      const SizedBox(
                        height: 19.0,
                      ),
                      //Task done
                      DoneTask(
                        styleText: styleText,
                        systemColor: systemColor,
                      )
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButton: Consumer<GLobalProvider>(
              builder: (context, globalProvider, child) => FloatActionBtn(
                  isTodo: true,
                  showDate: true,
                  time: time,
                  date: date,
                  isPickDate: globalProvider.isPickDate,
                  isPickTime: globalProvider.isPickTime,
                  listTask: listCategories),
            ),
            floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          );
        });
  }
}
