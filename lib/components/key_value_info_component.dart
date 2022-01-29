import 'package:flutter/material.dart';

import '../constants.dart';

class KeyValueInfoComponent extends StatelessWidget {
  final Widget keyWidget;
  final String value;

  const KeyValueInfoComponent({
    Key? key,
    required this.keyWidget,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 100.0,
      decoration: BoxDecoration(
          color: kInfoBackgroundColor, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          keyWidget,
          const VerticalDivider(
            width: 10.0,
            indent: 8.0,
            endIndent: 8.0,
            color: Color(0xFF391000),
          ),
          Text(
            value,
            style: kInfoStyle,
          ),
        ],
      ),
    );
  }
}
