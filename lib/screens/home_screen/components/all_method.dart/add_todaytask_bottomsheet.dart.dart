// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:provider/provider.dart';

// import '../../../../components/provider/taskcard_provider.dart';
// import '../../../../widget/alert_dialog.dart';

// Future<dynamic> addTodayTaskBottomSheet(
//     BuildContext context,
//     GLobalProvider globalProvider,
//     ThemeData systemColor,
//     TextTheme styleText,
//     TextEditingController taskC,
//     String time,
//     bool isPickDate,
//     List listTodayTask) {
//   return showModalBottomSheet(
//       // backgroundColor: systemColor.dialogBackgroundColor,
//       elevation: 0,
//       enableDrag: true,
//       clipBehavior: Clip.antiAlias,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(30),
//           topRight: Radius.circular(30),
//         ),
//       ),
//       context: context,
//       builder: (context) {
//         // Provider.of<GLobalProvider>(context, listen: false);

//         return ListenableProvider.value(
//           value: globalProvider,
//           builder: (context, _) => Container(
//               padding: EdgeInsets.only(
//                   top: 10.0,
//                   bottom: MediaQuery.of(context).viewInsets.bottom + 5.0),
//               color: systemColor.primaryColor,
//               child: SingleChildScrollView(
//                 child: Consumer<GLobalProvider>(
//                   builder: (context, globalProvider, _) => Stack(
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           SizedBox(
//                             height: 20,
//                             child: TextButton(
//                                 style: ButtonStyle(
//                                     overlayColor: MaterialStateProperty.all(
//                                         Colors.transparent),
//                                     visualDensity: VisualDensity.compact,
//                                     padding: MaterialStateProperty.all(
//                                         EdgeInsets.zero)),
//                                 onPressed: () {
//                                   final globalProvider =
//                                       Provider.of<GLobalProvider>(context,
//                                           listen: false);
//                                   showDialog(
//                                       context: context,
//                                       builder: (context) =>
//                                           ListenableProvider.value(
//                                             value: globalProvider,
//                                             child: AlertDialog(
//                                                 actionsAlignment:
//                                                     MainAxisAlignment.end,
//                                                 contentPadding:
//                                                     const EdgeInsets.all(10),
//                                                 actionsPadding:
//                                                     const EdgeInsets.symmetric(
//                                                         horizontal: 5.0,
//                                                         vertical: 10.0),
//                                                 backgroundColor:
//                                                     systemColor.primaryColor,
//                                                 shape: RoundedRectangleBorder(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             20)),
//                                                 content: SizedBox(
//                                                   height: 200,
//                                                   width: 300,
//                                                   child: ListView.builder(
//                                                     itemCount:
//                                                         listTodayTask.length,
//                                                     itemBuilder: (context,
//                                                             index) =>
//                                                         TextButton(
//                                                             onPressed: () {},
//                                                             child: Text(
//                                                               listTodayTask[
//                                                                       index]
//                                                                   .toString(),
//                                                               style: styleText
//                                                                   .bodyText1,
//                                                             )),
//                                                   ),
//                                                 )),
//                                           ));
//                                 },
//                                 child: Text(
//                                   "No Category",
//                                   style: styleText.headline1!
//                                       .copyWith(fontSize: 13),
//                                 )),
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                                 color: systemColor.dialogBackgroundColor,
//                                 borderRadius: BorderRadius.circular(25)),
//                             padding: const EdgeInsets.all(10.0),
//                             margin: const EdgeInsets.all(10),
//                             child: Consumer<GLobalProvider>(
//                               builder: (context, globalProvider, child) =>
//                                   TextField(
//                                 controller: taskC,
//                                 showCursor: true,
//                                 style: styleText.bodyText1,

//                                 toolbarOptions: const ToolbarOptions(
//                                     copy: true,
//                                     cut: true,
//                                     paste: true,
//                                     selectAll: true),
//                                 autofocus: true,
//                                 textInputAction: TextInputAction.done,

//                                 onEditingComplete: () {
//                                   if (taskC.text.isNotEmpty) {
//                                     globalProvider.addTodayCard(
//                                       taskC.text,
//                                       globalProvider.selectedTime == "Pick time"
//                                           ? ''
//                                           : globalProvider.selectedTime,
//                                       globalProvider.isPickTime,
//                                     );

//                                     taskC.clear();
//                                     time = '';
//                                     globalProvider.selectedTime = "Pick time";
//                                     isPickDate = false;
//                                     globalProvider.isPickTime = false;
//                                     globalProvider.iswriting = false;

//                                     Navigator.pop(context);
//                                   } else {
//                                     alertDialog(
//                                         context, systemColor, styleText);
//                                   }
//                                 },
//                                 onChanged: (newValue) {
//                                   if (taskC.text.isNotEmpty) {
//                                     globalProvider.iswriting = true;
//                                   } else {
//                                     globalProvider.iswriting = false;
//                                   }
//                                 },
//                                 cursorColor: systemColor.iconTheme.color,
//                                 maxLines: 1,

//                                 decoration: InputDecoration(
//                                     hintText: "Input new task here",
//                                     suffixIcon: globalProvider.iswriting == true
//                                         ? IconButton(
//                                             splashRadius: 18,
//                                             onPressed: () {
//                                               globalProvider.iswriting = false;
//                                               taskC.clear();
//                                             },
//                                             icon: Icon(
//                                               Icons.clear_rounded,
//                                               color:
//                                                   systemColor.iconTheme.color,
//                                             ),
//                                           )
//                                         : const SizedBox(),
//                                     border: const OutlineInputBorder(
//                                         borderSide: BorderSide.none)),
//                                 keyboardType: TextInputType.text,
//                                 cursorHeight: 25,
//                                 textAlign: TextAlign.start,

//                                 // scrollPadding: EdgeInsets.only(bottom: 40),
//                               ),
//                             ),
//                           ),
//                           Consumer<GLobalProvider>(
//                             builder: (context, globalProvider, _) =>
//                                 GestureDetector(
//                               onTap: () {
//                                 // globalProvider.pickTime(
//                                 //   context,
//                                 // );
//                               },
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(
//                                     color: systemColor.dialogBackgroundColor,
//                                     borderRadius: BorderRadius.circular(100)),
//                                 width: 170,
//                                 height: 40,
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 10.0),
//                                 margin:
//                                     const EdgeInsets.symmetric(horizontal: 5),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     SvgPicture.asset(
//                                       "assets/icons/Clock.svg",
//                                       height: 20,
//                                       color: systemColor.iconTheme.color,
//                                     ),
//                                     const SizedBox(
//                                       width: 5,
//                                     ),
//                                     Text(
//                                       textAlign: TextAlign.center,
//                                       globalProvider.selectedTime,
//                                       style: styleText.bodyText1,
//                                     ),
//                                     globalProvider.isPickTime == true
//                                         ? GestureDetector(
//                                             onTap: () {
//                                               globalProvider.isPickTime = false;
//                                               globalProvider.selectedTime =
//                                                   "Pick time";
//                                             },
//                                             child: Icon(
//                                               Icons.clear_rounded,
//                                               size: 20,
//                                               color:
//                                                   systemColor.iconTheme.color,
//                                             ),
//                                           )
//                                         : const SizedBox()
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Positioned(
//                         bottom: 5,
//                         right: 10,
//                         child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                                 elevation: 0,
//                                 shape: CircleBorder(
//                                   side: BorderSide(
//                                       color: systemColor.primaryColor,
//                                       width: 5),
//                                 ),
//                                 primary: systemColor.dialogBackgroundColor,
//                                 padding: const EdgeInsets.all(20)),
//                             onPressed: () {
//                               if (taskC.text.isNotEmpty) {
//                                 globalProvider.addTodayCard(
//                                   taskC.text,
//                                   globalProvider.selectedTime == "Pick time"
//                                       ? ''
//                                       : globalProvider.selectedTime,
//                                   globalProvider.isPickTime,
//                                 );

//                                 taskC.clear();
//                                 time = '';
//                                 globalProvider.selectedTime = "Pick time";
//                                 isPickDate = false;
//                                 globalProvider.isPickTime = false;
//                                 globalProvider.iswriting = false;

//                                 Navigator.pop(context);
//                               } else {
//                                 alertDialog(context, systemColor, styleText);
//                               }
//                             },
//                             child: SvgPicture.asset("assets/icons/Send.svg",
//                                 height: 25,
//                                 width: 25,
//                                 color: systemColor.iconTheme.color)),
//                       )
//                     ],
//                   ),
//                 ),
//               )),
//         );
//       });
// }
