// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
   final VoidCallback onPressed;
   const ButtonWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 230,
      onPressed: onPressed,
      icon: const Icon(
        Icons.alarm,
      ),
    );
  }
}
