import 'package:flutter/material.dart';

class TextTitleWidget extends StatelessWidget {
  const TextTitleWidget({Key? key}) : super(key: key);
  final title = 'TODO LİST';
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 30,
      ),
    );
  }
}
