import 'package:flutter/material.dart';
import 'package:random_timer/screens/main_screen.dart';
import 'package:random_timer/styles/colors.dart';

void main() {
  runApp( const TimerApp());
}

class TimerApp extends StatelessWidget {
  const TimerApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: mainColor,
      ),
      debugShowCheckedModeBanner: false,
      home: const MainScreenWidget(),
    );
  }
}
