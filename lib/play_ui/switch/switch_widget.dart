import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const SwitchWidget({
    Key key,
    this.value = false,
    this.onChanged,
  }) : super(key: key);

  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool isSwitched;
  Color switchColor;

  @override
  void initState() {
    super.initState();

    isSwitched = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        height: 31,
        width: 55,
        decoration: BoxDecoration(
          color: switchColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Switch(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
              if (value == true) {
                switchColor = Theme.of(context).accentColor;
              } else {
                switchColor = Theme.of(context).accentIconTheme.color;
              }
              if (widget.onChanged != null) widget.onChanged(value);
            });
          },
          activeColor: Theme.of(context).primaryIconTheme.color,
          inactiveTrackColor: Colors.transparent,
          activeTrackColor: Colors.transparent,
        ),
      ),
    );
  }
}
