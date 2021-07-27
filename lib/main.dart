import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//import 'package:flutter_phoenix/flutter_phoenix.dart';
//import 'package:flutter_restart/flutter_restart.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meaden_app/Bloc/Blog_main.dart';
import 'package:meaden_app/app/Deposit/Deposit.dart';

//import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meaden_app/app/Preferences.dart';
import 'package:meaden_app/app/accountSetting/AccountSetting.dart';
import 'package:meaden_app/app/changePassword/ChangePassword.dart';
import 'package:meaden_app/app/home/home.dart';
import 'package:meaden_app/app/login/login_page.dart';
import 'package:meaden_app/app/onBoading/OnBoading.dart';
import 'package:meaden_app/play_ui/hex_color/hex_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meaden_app/app/Utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'webservices/networkStrings.dart';

void setupLocator() {
  GetIt.instance.registerLazySingleton(() => NetworkStrings());
  GetIt.instance.registerLazySingleton(() => Utils());
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool flag = prefs.getBool('IsLoggedIn');

  if (flag == null) flag = false;

/*  runApp(
    flag ? GembotApp() : App(),
  );*/

  if (flag)
    runApp(GembotApp());
  else
    runApp(App());
}

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App>{

  //Timer timer;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Gembot',
      debugShowCheckedModeBanner: false,
      theme: getTheme(context),
      navigatorKey: Modular.navigatorKey,
      home: LoginPage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => HomePage(),
        '/accountSetting': (context) => AccountSetting(),
        '/changePassword': (context) => ChangePassword(),
        '/onBoarding': (context) => OnBoading(),
        '/Deposit': (context) => Deposit(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      // Add this line
      supportedLocales: AppLocalizations.supportedLocales,
      /*localizationsDelegates: [
                  //AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [const Locale('en', '')],*/
    );
  }

  ThemeData getTheme(BuildContext context) {
    final primaryIconColor = HexColor('#FFFFFF');
    final iconColor = HexColor('#7099b2');
    final accentIconColor = HexColor('#24485e');
    final secundaryColor = HexColor('#3A3F4C');
    final backgroudColor = HexColor('#2A2D37');
    final primaryColor = HexColor('#5186ED');
    final accentColor = HexColor('#3A3F4C');

    return ThemeData(
        appBarTheme:
        Theme.of(context).appBarTheme.copyWith(brightness: Brightness.dark),
        textTheme: GoogleFonts.workSansTextTheme(
          TextTheme(
            bodyText1: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            bodyText2: TextStyle(
              color: secundaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            subtitle1: TextStyle(
              color: primaryIconColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
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
        dividerColor: Color(0xff9C9EA5),
        highlightColor: Color(0xff64CEA2));
  }
}




class GembotApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gembot',
      theme: getTheme(context),
      navigatorKey: Modular.navigatorKey,
      home: HomePage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => HomePage(),
        '/accountSetting': (context) => AccountSetting(),
        '/changePassword': (context) => ChangePassword(),
        '/onBoarding': (context) => OnBoading(),
        '/Deposit': (context) => Deposit(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      // Add this line
      supportedLocales: AppLocalizations.supportedLocales,
      /*localizationsDelegates: [
        //AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,

      ],
      supportedLocales: [const Locale('en', '')],*/
    );
  }

  ThemeData getTheme(BuildContext context) {
    final primaryIconColor = HexColor('#FFFFFF');
    final iconColor = HexColor('#7099b2');
    final accentIconColor = HexColor('#24485e');
    final secundaryColor = HexColor('#3A3F4C');
    final backgroudColor = HexColor('#2A2D37');
    final primaryColor = HexColor('#5186ED');
    final accentColor = HexColor('#3A3F4C');

    return ThemeData(
        appBarTheme:
            Theme.of(context).appBarTheme.copyWith(brightness: Brightness.dark),
        textTheme: GoogleFonts.workSansTextTheme(
          TextTheme(
            bodyText1: TextStyle(
              color: Colors.white,
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
        dividerColor: Color(0xff9C9EA5),
        highlightColor: Color(0xff64CEA2));
  }

}

class RestartWidget extends StatefulWidget {
  RestartWidget({this.child});

  final Widget child;

  static bool restartApp(BuildContext context) {
    return context.findAncestorStateOfType<_RestartWidgetState>().restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  bool restartApp() {
    bool a = false;
    setState(() {
      key = UniqueKey();
      a = true;
    });
    return a;
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
