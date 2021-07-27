import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meaden_app/app/theme.dart';
import 'package:meaden_app/play_ui/hex_color/hex_color.dart';


class AppWidget extends StatefulWidget with ThemeMixin {

  final bool isLoggedIn;
  AppWidget({this.isLoggedIn});

  @override
  _AppWidgetState createState() {
    return _AppWidgetState();
  }
}

class _AppWidgetState extends State<AppWidget> {
  String route='/security/auth-types';



  @override
  initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    if(widget.isLoggedIn) route='/wallet';

    return MaterialApp(
      title: 'Wallet UI',
      theme: getTheme(context),
      initialRoute: route,
      onGenerateRoute: Modular.generateRoute,
      navigatorKey: Modular.navigatorKey,
    );
  }



  ThemeData getTheme(BuildContext context) {
    final primaryIconColor = HexColor('#FFFFFF');
    final iconColor = HexColor('#7099b2');
    final accentIconColor = HexColor('#24485e');
    final secundaryColor = HexColor('#84939d');
    final backgroudColor = HexColor('#2A2D37');
    final primaryColor = HexColor('#315FD6');
    final accentColor = HexColor('#F5A623');

    return ThemeData(
      textTheme: GoogleFonts.montserratTextTheme(
        TextTheme(
          bodyText1: TextStyle(
            color: primaryIconColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          bodyText2: TextStyle(
            color: secundaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          subtitle1: TextStyle(
            color: primaryIconColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          subtitle2: TextStyle(
            color: secundaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          button: TextStyle(
            color: primaryIconColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      iconTheme: IconThemeData(
        color: iconColor,
      ),
      primaryIconTheme: IconThemeData(
        color: primaryIconColor,
      ),
      accentIconTheme: IconThemeData(
        color: accentIconColor,
      ),
      backgroundColor: backgroudColor,
      primaryColor: primaryColor,
      accentColor: accentColor,
    );
  }
}
