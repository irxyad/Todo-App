import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widget/donetoday_task.dart';
import '../../../../components/provider/taskcard_provider.dart';
import '../../../../widget/floating_actbtn.dart';
import '../../../../widget/today_task.dart';

class ListTodayBottomSheet extends StatefulWidget {
  const ListTodayBottomSheet(
      {Key? key,
      required this.context,
      required this.time,
      required this.isPickTime,
      required this.listTodayTask,
      required this.styleText,
      required this.systemColor})
      : super(key: key);
  final ThemeData systemColor;
  final BuildContext context;

  final String time;
  final bool isPickTime;
  final List listTodayTask;
  final TextTheme styleText;

  @override
  State<ListTodayBottomSheet> createState() => _ListTodayBottomSheetState();
}

class _ListTodayBottomSheetState extends State<ListTodayBottomSheet>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final todayTaskC = TextEditingController();

    return Consumer<GLobalProvider>(
      builder: (context, globalProvider, _) => DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: TabBar(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              isScrollable: true,
              tabs: const [
                Tab(child: Text("Today")),
                Tab(child: Text("Done")),
              ],
              labelStyle: widget.styleText.headline2,
              enableFeedback: true,
              splashFactory: NoSplash.splashFactory,
              unselectedLabelColor: Colors.grey.shade600,
              automaticIndicatorColorAdjustment: false,
              indicatorColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 80),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 60.0,
                  ),
                  child: TabBarView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        TodayTask(
                            systemColor: widget.systemColor,
                            context: context,
                            textEditingController: todayTaskC,
                            time: widget.time,
                            isPickTime: widget.isPickTime,
                            listTodayTask: widget.listTodayTask,
                            styleText: widget.styleText),
                        DoneTodayTask(
                            styleText: widget.styleText,
                            systemColor: widget.systemColor,
                            context: context,
                            taskC: todayTaskC,
                            time: widget.time,
                            isPickTime: widget.isPickTime,
                            listTodayTask: widget.listTodayTask)
                      ]),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 0,
            notchMargin: 8.0,
            shape: const CircularNotchedRectangle(),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: TextButton(
                style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.redAccent),
                    splashFactory: InkRipple.splashFactory,
                    alignment: Alignment.center,
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only())),
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    fixedSize: MaterialStateProperty.all(Size(Get.width, 60)),
                    backgroundColor:
                        MaterialStateColor.resolveWith((states) => Colors.red)),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Close",
                    style: widget.styleText.headline1!
                        .copyWith(fontSize: 16, color: Colors.white))),
          ),
          resizeToAvoidBottomInset: true,
          extendBody: true,
          extendBodyBehindAppBar: true,
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          floatingActionButton: FloatActionBtn(
              isTodo: false,
              showDate: false,
              time: globalProvider.selectedTime,
              isPickTime: globalProvider.isPickTime,
              listTask: globalProvider.listTodayCard),
        ),
      ),
    );
  }
}
