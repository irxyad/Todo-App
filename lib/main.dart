import 'package:flutter/material.dart';
import 'package:todo_app/screens/home_screen/home_screen.dart';
import 'components/dark_theme.dart';
import 'components/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: currentMode,
            darkTheme: myDarkTheme(),
            theme: myLightTheme(),
            title: "Todo App",
            home: const HomeScreen(),
          );
        });
  }
}
