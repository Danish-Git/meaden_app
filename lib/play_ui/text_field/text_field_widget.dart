import 'package:flutter/material.dart';
import 'package:meaden_app/play_ui/label_field/LabelWithPadding.dart';

import '../play_ui.dart';

class TextFieldWidget extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String label;
  final bool obscureText;
  final bool isEnabled;
  final TextEditingController controller;

  const TextFieldWidget({
    Key key,
    this.onChanged,
    this.label = "",
    this.obscureText = false,
    this.isEnabled=true,
    this.controller,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        LabelWithPadding(
          label: label,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: TextField(
            controller:controller,
            onChanged: onChanged,
            style: Theme.of(context).textTheme.bodyText1,
            obscureText: obscureText,
            enabled: isEnabled,
            decoration: InputDecoration(
              hintStyle: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        )
      ],
    );
  }
}
