import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/screens/home_screen/components/todo_card.dart';
import 'package:intl/intl.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({
    Key? key,
    required this.systemColor,
    required this.taskC,
    required this.styleText,
  }) : super(key: key);

  final ThemeData systemColor;
  final TextEditingController taskC;
  final TextTheme styleText;
  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  String date = '';
  final List<TodoCard> addtask = [];
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        onClosing: () {},
        builder: (context) => Container(
              padding: EdgeInsets.only(
                  top: 10.0,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 20),
              color: widget.systemColor.primaryColor,
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: widget.systemColor.dialogBackgroundColor,
                              borderRadius: BorderRadius.circular(25)),
                          padding: const EdgeInsets.only(
                              top: 10.0, bottom: 20.0, left: 10.0, right: 10.0),
                          margin: const EdgeInsets.all(10),
                          child: TextField(
                            controller: widget.taskC,
                            showCursor: true,
                            style: widget.styleText.bodyText1,
                            toolbarOptions: const ToolbarOptions(
                                copy: true,
                                cut: true,
                                paste: true,
                                selectAll: true),
                            autofocus: true,
                            textInputAction: TextInputAction.done,
                            onEditingComplete: () {
                              Navigator.pop(context);
                            },
                            cursorColor: widget.systemColor.primaryColorLight,
                            maxLines: 1,

                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    splashRadius: 18,
                                    onPressed: () {
                                      setState(() {
                                        widget.taskC.clear();
                                      });
                                    },
                                    icon: Icon(
                                      Icons.clear_rounded,
                                      color:
                                          widget.systemColor.primaryColorLight,
                                    )),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                            keyboardType: TextInputType.multiline,
                            cursorHeight: 25,
                            textAlign: TextAlign.start,
                            // scrollPadding: EdgeInsets.only(bottom: 40),
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "No Category",
                              style: widget.styleText.bodyText1,
                            ))
                      ],
                    ),
                    Positioned(
                      bottom: 20,
                      right: 10,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: CircleBorder(
                                side: BorderSide(
                                    color: widget.systemColor.primaryColor,
                                    width: 5),
                              ),
                              backgroundColor:
                                  widget.systemColor.dialogBackgroundColor,
                              padding: const EdgeInsets.all(20)),
                          onPressed: () {
                            setState(() {
                              date = DateFormat.Hm().format(DateTime.now());
                            });
                            // addtask.add(TodoCard(
                            //     styleText: widget.styleText,
                            //     task: widget.taskC.text,
                            //     date: date,
                            //     icon: const SizedBox(),
                            //     bgColor: widget.systemColor.primaryColor,
                            //     btnColor: MaterialStateColor.resolveWith(
                            //         (states) =>
                            //             widget.systemColor.primaryColorDark)));
                            Navigator.pop(context);

                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => TodoCard(
                            //         date: date,
                            //         styleText: widget.styleText,
                            //         task: widget.taskC.text,
                            //         icon: const SizedBox(),
                            //         bgColor: widget.systemColor.primaryColor,
                            //         btnColor: MaterialStateColor.resolveWith(
                            //             (states) => widget
                            //                 .systemColor.primaryColorDark))));
                          },
                          child: SvgPicture.asset("assets/icons/Send.svg",
                              height: 25,
                              width: 25,
                              color: widget.systemColor.primaryColorLight)),
                    )
                  ],
                ),
              ),
            ));
  }
}
// jam = DateFormat.Hm().format(DateTime.now())

