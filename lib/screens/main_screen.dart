import 'package:flutter/material.dart';
import 'package:random_timer/widgets/countdown_widget.dart';


class MainScreenWidget extends StatelessWidget {
  const MainScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
      ),
      body: const CountDownWidget(),
    );
  }
}
