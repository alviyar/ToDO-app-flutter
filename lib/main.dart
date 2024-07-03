// ignore_for_file: deprecated_member_use, unused_field

import 'package:flutter/material.dart';
import 'package:todo/screens/home.dart';
import 'package:todo/screens/theme.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeSwitch _themeSwitch = ThemeSwitch();

  @override
  void initState() {
    super.initState();
    _themeSwitch.addListener(() {
      setState(() {});
    });
  }

  final ColorScheme _lightColorScheme = ColorScheme.light(
    primary: Colors.red,
    secondary: Color(0xFF003636),
    background: Color(0xFFB9EBEA),
    surface:Color(0xFF52B5B5),
    onPrimary: Color.fromARGB(255, 76, 5, 170),
    onSecondary: Colors.black,
    onBackground: Colors.black,
    onSurface:Color(0xFF52B5B5),
  );

  final ColorScheme _darkColorScheme = ColorScheme.dark(
    primary: Colors.red,
    secondary: Color(0xFFD8D4FF),
    background: Color(0x0F0E0E),
    surface: Color.fromARGB(255, 41, 0, 81),
    onPrimary: Color.fromARGB(255, 95, 121, 216),
    onSecondary: Colors.white,
    onBackground: Colors.white,
    onSurface:Color(0xFFD8D4FF),
  );


@override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: _lightColorScheme,
        // You can customize other theme properties here
      ),
      darkTheme: ThemeData(
        colorScheme: _darkColorScheme,
        // You can customize other dark theme properties here
      ),
      themeMode: _themeSwitch.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      title: "ToDo App",
      debugShowCheckedModeBanner: false,
      home: Home(themeSwitch: _themeSwitch),
    );
  }
}