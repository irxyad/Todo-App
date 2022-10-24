import 'package:flutter/material.dart';
import 'package:todo_app/components/constants.dart';
import '../../../../main.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final systemColor = Theme.of(context);

    /// Whether dark mode is enabled.

    return Drawer(
      backgroundColor: systemColor.primaryColor.withOpacity(1),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader(context),
          _drawerItem(
            iconColors: systemColor.indicatorColor,
            icon: Icons.star,
            text: 'Star Tasks',
            onTap: () {},
          ),
          _drawerItem(
            iconColors: systemColor.indicatorColor,
            icon: Icons.category_rounded,
            text: 'Category',
            onTap: () {},
          ),
          _drawerItem(
            iconColors: systemColor.indicatorColor,
            icon: Icons.monetization_on_rounded,
            text: 'Donate',
            onTap: () {},
          ),
          _drawerItem(
            iconColors: systemColor.indicatorColor,
            icon: Icons.feedback_rounded,
            text: 'Feedback',
            onTap: () {},
          ),
          _drawerItem(
            iconColors: systemColor.indicatorColor,
            icon: Icons.question_answer_rounded,
            text: 'FAQ',
            onTap: () {},
          ),
          _drawerItem(
            iconColors: systemColor.indicatorColor,
            icon: Icons.settings_rounded,
            text: 'Settings',
            onTap: () {},
          ),
          const SizedBox(
            height: 30,
          ),
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                  text: "From\n",
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontFamily: "Praise",
                      ),
                ),
                TextSpan(
                  text: "Irxyad",
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 25),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _drawerItem(
    {required IconData icon,
    required String text,
    required Color iconColors,
    required GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon, color: iconColors),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}

Widget _drawerHeader(context) {
  return UserAccountsDrawerHeader(
    currentAccountPicture: const ClipOval(
      child: Image(
          image: AssetImage('assets/images/profile.jpg'), fit: BoxFit.cover),
    ),
    accountName: Text(
      'Irxyad',
      style:
          Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white),
    ),
    accountEmail: Text(
      'irxyadjoka@gmail.com',
      style: Theme.of(context)
          .textTheme
          .headline6!
          .copyWith(color: Colors.grey.shade400),
    ),
    otherAccountsPictures: [
      // TextButton(
      //     onPressed: () => MyApp.of(context).changeTheme(ThemeMode.dark),
      //     child: Text("Dark")),
      // TextButton(
      //     onPressed: () => MyApp.of(context).changeTheme(ThemeMode.light),
      //     child: Text("light")),
      // IconButton(
      //     icon: Icon(MyApp.themeNotifier.value == ThemeMode.light
      //         ? Icons.dark_mode
      //         : Icons.light_mode),
      //     onPressed: () {
      //       MyApp.themeNotifier.value =
      //           MyApp.themeNotifier.value == ThemeMode.light
      //               ? ThemeMode.dark
      //               : ThemeMode.light;
      //     })
      GestureDetector(
          onTap: () {
            MyApp.themeNotifier.value =
                MyApp.themeNotifier.value == ThemeMode.light
                    ? ThemeMode.dark
                    : ThemeMode.light;
          },
          child: CircleAvatar(
            backgroundColor: Colors.black,
            child: MyApp.themeNotifier.value == ThemeMode.light
                ? const Icon(Icons.dark_mode_outlined, color: slightBlue)
                : Icon(Icons.light_mode_rounded, color: yellow.withOpacity(1)),
          )),
    ],
    arrowColor: Colors.red,
    decoration: BoxDecoration(
      image: DecorationImage(
          image: const AssetImage(
            "assets/images/profile.jpg",
          ),
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(.5), BlendMode.overlay),
          fit: BoxFit.cover),
    ),
  );
}
