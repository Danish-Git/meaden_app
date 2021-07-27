import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';
import 'package:meaden_app/app/Preferences.dart';
import 'package:meaden_app/app/historical/Historical.dart';
import 'package:meaden_app/app/menu/Menu.dart';
import 'package:meaden_app/app/microfunds/MicroFunds.dart';
import 'package:meaden_app/app/search/Search.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../Utils.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Utils get _utils => GetIt.I<Utils>();

  String _UsrId ;
  String _userName;
  String _usrName;
  String _usrEmail;

  int _currentIndex=0;
  List<Widget> childList = [
    MicroFunds(),
    Search(),
    Historical(),
    MenuScreen()
  ];

  @override
  void initState() {
    super.initState();

    _getDataFromSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        brightness: Brightness.dark,
        leading: Container(),
        elevation: 0,
        title:  Container(height: 40, width: 40,
          child: Image.asset('assets/gembot_logo.png'),
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      bottomNavigationBar: BottomNavigationBar(

        type: BottomNavigationBarType.fixed,
        iconSize: 21,
        currentIndex: _currentIndex,
        backgroundColor:  Theme.of(context).accentColor,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        onTap: (value) {
          // Respond to item press.
          setState(() => _currentIndex = value);

        },
        items: [
          BottomNavigationBarItem(
            label: AppLocalizations.of(context).micro_Funds,
            icon: Padding(
              padding: const EdgeInsets.all(5.0),
              child:  Icon(Icons.bar_chart)
            ),
          ),
          BottomNavigationBarItem(
            label: AppLocalizations.of(context).stock_search,
            icon: Padding(
              padding: const EdgeInsets.all(5.0),
              child:  Icon(Icons.search)
            ),
          ),
          BottomNavigationBarItem(
            label: AppLocalizations.of(context).historical,
            icon: Padding(
              padding: const EdgeInsets.all(5.0),
              child:  Icon(Icons.access_time)
            ),
          ),
          BottomNavigationBarItem(
            label: AppLocalizations.of(context).menu,
            icon: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(Icons.menu)
            ),
          ),
        ],
      ),
      body: childList[_currentIndex],
      /// GraphQL Query
      /*body: Query(
        options: QueryOptions(
          document: gql(UserDetails_queryString)
        ),
        builder: (
            QueryResult result, {
            Refetch refetch,
            FetchMore fetchMore,
            }) {

          if(result.hasException) {
            print("${result.exception}");
            return Text("${result.exception}");
          } else if(result.data == null) {
            return Text("No Data Found");
          } else {
            print("my result : ${result.data["myPortfolios"]}");
          }
          return Container();
        },
      ),*/

    );
  }

  void _getDataFromSharedPreferences() {
    //bool _tokenGen = Preferences().getTokenLinkGen();
    //_utils.showToast(_tokenGen.toString(), context);
    /*setState(() {
      _UsrId = Preferences().getUserId();
      _userName = Preferences().getUserName();
      _usrName = Preferences().getUsrName();
      _usrEmail = Preferences().getUsrEmail();
    });*/
  }

}