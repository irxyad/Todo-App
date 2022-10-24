import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/constants.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key? key,
    required this.scaffoldKey,
    required this.systemColor,
    required this.styleText,
    required this.totalTaskToday,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;
  final ThemeData systemColor;
  final TextTheme styleText;
  final String totalTaskToday;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      leading: Container(),
      backgroundColor: systemColor.primaryColor,
      shadowColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Padding(
        padding: hPadding.copyWith(top: 70),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                scaffoldKey.currentState!.openDrawer();
              },
              child: Container(
                  height: 45,
                  width: 45,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: systemColor.dialogBackgroundColor,
                      borderRadius: BorderRadius.circular(13)),
                  child: SvgPicture.asset(
                    "assets/icons/Category.svg",
                    color: systemColor.primaryColorLight,
                  )),
            ),
            Container(
                height: 70,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    color: systemColor.dialogBackgroundColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    //Profile text
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        //Username
                        Text.rich(TextSpan(children: [
                          // TextSpan(
                          //   text: "Hi",
                          //   style: styleText.headline1!.copyWith(
                          //     fontFamily: "Praise",
                          //     fontSize: 24,
                          //   ),
                          // ),
                          TextSpan(
                            text: "Hi, ",
                            style: styleText.headline1!.copyWith(
                              fontFamily: "Poppins",
                              fontSize: 18,
                            ),
                          ),
                          TextSpan(
                            text: "Irxyad",
                            style: styleText.headline1!.copyWith(
                              fontFamily: "Poppins",
                              fontSize: 18,
                            ),
                          ),
                        ])),
                        //Info Task
                        Text(totalTaskToday,
                            style: styleText.headline2!
                                .copyWith(color: orange, fontSize: 12))
                      ],
                    ),
                    const SizedBox(
                      width: 8,
                    ),

                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(18),
                          image: const DecorationImage(
                              image: AssetImage("assets/images/profile.jpg"))),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
