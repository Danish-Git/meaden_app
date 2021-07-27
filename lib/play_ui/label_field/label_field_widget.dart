import 'package:flutter/material.dart';

import '../play_ui.dart';

class LabelFieldWidget extends StatelessWidget {
  final String label;
  final Color color;
  final double size;

  const LabelFieldWidget({
    Key key,
    this.label,
    this.color,
    this.size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: TextWidget.fieldLabel(
        label,
        fontSize: size,
        color: color,

      ),
    );
  }
}
