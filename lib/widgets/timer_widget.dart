import 'package:flutter/material.dart';
import 'package:random_timer/constants/constants.dart';
import 'package:random_timer/styles/colors.dart';

import 'package:random_timer/widgets/countdown_widget.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: mainColor,
      child: Column(
        children: const [
          Text(
            notice,
            style: TextStyle(
              color: textColor,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: CountDownWidget(),
          ),
        ],
      ),
    );
  }
}
