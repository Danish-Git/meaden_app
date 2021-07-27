import 'package:flutter/material.dart';
import 'package:meaden_app/play_ui/text_widget/text_widget.dart';

class LabelWithPadding extends StatelessWidget {
  final String label;
  final Color color;

  const LabelWithPadding({
    Key key,
    this.label,
    this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 29),
      child: TextWidget.fieldLabel(
        label,
        fontSize: 12,
        color: color,

      ),
    );
  }
}
