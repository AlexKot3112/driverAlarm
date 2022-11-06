import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:random_timer/constants/constants.dart';
import 'package:random_timer/styles/colors.dart';
import 'package:random_timer/widgets/button_widget.dart';

class CountDownWidget extends StatefulWidget {
  const CountDownWidget({super.key});

  @override
  State<CountDownWidget> createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  final player = AudioPlayer();
  final String audioPath = 'alarm.mp3';
  Timer? timer;
  Duration timerDuration = const Duration();

  @override
  void initState() {
    final seconds = Random().nextInt(60) + 1;
    timerDuration = Duration(seconds: seconds);
    super.initState();
    startTimer();
  }

  void playAlarm() {
    player.play(
      AssetSource(audioPath),
    );
  }

  void stopAlarm() {
    player.stop();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void resetTimer() {
    final seconds = Random().nextInt(60);
    setState(() => timerDuration = Duration(seconds: seconds));
  }

  void stopTimer() {
    setState(
      () {
        timer?.cancel();
        resetTimer();
        stopAlarm();
        startTimer();
      },
    );
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final sec = timerDuration.inSeconds - reduceSecondsBy;
      if (sec < 0) {
        playAlarm();
        resetTimer();
        // startTimer();
      } else {
        timerDuration = Duration(seconds: sec);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');

    final minutes = strDigits(timerDuration.inMinutes.remainder(60));
    final seconds = strDigits(timerDuration.inSeconds.remainder(60));
    return Container(
      width: double.infinity,
      color: player.state == PlayerState.playing ? alarmColor : mainColor,
      child: Column(
        children: [
          const Text(
            notice,
            style: TextStyle(
              color: textColor,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            '$minutes:$seconds',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: textColor,
              fontSize: 120,
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          ButtonWidget(onPressed: stopTimer),
        ],
      ),
    );
  }
}
