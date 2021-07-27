import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meaden_app/play_ui/text_widget/text_widget.dart';

class PageScaffoldWidget extends StatelessWidget {
  final Widget child;
  final String title;
  final bool centralize;
  final bool hideAppBar;
  final bool hideBackButton;

  const PageScaffoldWidget({
    Key key,
    this.child,
    this.title,
    this.centralize = false,
    this.hideAppBar = false,
    this.hideBackButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,

      appBar: hideAppBar
          ? null
          : AppBar(
              backgroundColor: Colors.transparent,
              brightness: Brightness.dark,
              leading: hideBackButton
                  ? null
                  : IconButton(
                padding: EdgeInsets.only(left: 30),
                      icon:  Icon(Icons.arrow_back_ios, color: Theme.of(context).primaryColor),
                      onPressed: () {
                        if (Modular.to.canPop()) Modular.to.pop();
                      },
                    ),
              elevation: 0,
              title: title == null ? null : TextWidget.appBarTitle(title),
            ),
      body: centralize
          ? Center(
              child: SingleChildScrollView(
                child: child,
              ),
            )
          :  Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: child,
      ),
    );
  }
}
