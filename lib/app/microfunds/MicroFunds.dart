import 'dart:ui';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:meaden_app/models/DashboardMeResponse.dart';
import '../Preferences.dart';
import '../Utils.dart';
import '../charts/LineTitles.dart';
import '../microfunds/MicroFundsView.dart';
import '../login/login_page.dart';
import '../microfunds/MicroFundsPresentor.dart';
import '../../models/me_Response.dart';
import '../../models/myMicroFunds_Response.dart';
import '../../models/myPortfolioPage_Response.dart';
import '../../play_ui/text_widget/text_widget.dart';



class MicroFunds extends StatefulWidget {
  @override
  _MicroFundsState createState() => _MicroFundsState();
}

class _MicroFundsState extends State<MicroFunds> implements MicroFundsView {
  List<Color> gradientColors = [Color(0xff2A2D37), Color(0xff64CEA2)];
  List<Color> lineColors = [Color(0xff64CEA2)];

  MicroFundsPresentor _microFundsPresentor;


  Utils get _utils => GetIt.I<Utils>();

//  bool isProfileLoading = true;
//  bool isMicroFundLoading = true;
  ///   Deposit Drawer
  double _circleSize = 35, _pageNoSize = 16, _radioFontSize = 15, _fielsFontSize = 14;
  bool isLoading = false;
  int _depositStepNo = 1;
  String _amountNZD;
  ///
  bool isProfileLoading = false;
  bool isMicroFundLoading = true;

  String _usrId, _userName, _usrName, _usrEmail, _cash, _accountBalance ;
  var _invested;

  myMicroFunds_Response _fundsResponse;
  MyPortfolioPageResponse _myPortfolioPageResponse;

  @override
  void initState() {
    _microFundsPresentor = MicroFundsPresentor(this);
    super.initState();
    _getDataFromSharedPreferences();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    ///   Test Case
    //autoLoad();
    if(_depositStepNo == 3) {
      sleep().then((value) {
        if (value == "3") {
          _loadNextPage(4);
        }
      });
    }

    return Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 1,
                        color: Color(0xff4A4C55),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),

                              /// profile and account details
                              isProfileLoading
                                  ? _utils.showLoading(context)
                                  : Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(5, 30, 5, 25),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).accentColor,
                                        borderRadius:
                                            BorderRadius.circular(3.0),
                                      ),
                                      child: Column(
                                        children: [
                                          ///  setting icon
                                          GestureDetector(
                                            onTap: () => Navigator.pushNamed(context, "/accountSetting"),
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    height: 25,
                                                    width: 25,
                                                    child: Image.asset(
                                                        'assets/settings_back.png'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),

                                          ///   Username
                                          TextWidget.fieldLabel(
                                            "${_usrName}",/*- ${_usrEmail}*/
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),

                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              /// cash ammount
                                              Expanded(
                                                flex: 5,
                                                child: Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      50, 0, 10, 0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      /// cash
                                                      TextWidget.fieldLabel(
                                                        AppLocalizations.of(
                                                                context)
                                                            .cash
                                                            .toUpperCase(),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Theme.of(context)
                                                            .dividerColor,
                                                      ),
                                                      SizedBox(height: 5),

                                                      /// amount
                                                      TextWidget.fieldLabel(
                                                        "\$$_cash",
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Theme.of(context)
                                                            .highlightColor,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),

                                              /// invested amount
                                              Expanded(
                                                flex: 5,
                                                child: Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      10, 0, 50, 0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      ///   invested
                                                      TextWidget.fieldLabel(
                                                        AppLocalizations.of(
                                                                context)
                                                            .invested
                                                            .toUpperCase(),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Theme.of(context)
                                                            .dividerColor,
                                                      ),
                                                      SizedBox(height: 5),

                                                      ///   amount
                                                      TextWidget.fieldLabel(
                                                        "\$$_invested",
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),

                                          SizedBox(
                                            height: 20,
                                          ),

                                          /// Account balance
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              /// Account balance
                                              TextWidget.fieldLabel(
                                                AppLocalizations.of(context)
                                                    .current_balance
                                                    .toUpperCase(),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Theme.of(context)
                                                    .dividerColor,
                                              ),

                                              SizedBox(height: 5),

                                              /// amount percentage
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  /// amount
                                                  TextWidget.fieldLabel(
                                                    "\$$_accountBalance - ",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                  ),

                                                  /// percentage
                                                  TextWidget.fieldLabel(
                                                    "102.62%",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Theme.of(context)
                                                        .highlightColor,
                                                  )
                                                ],
                                              )
                                            ],
                                          ),

                                          SizedBox(
                                            height: 45,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  ///   profile image
                                  Positioned(
                                    top: 10,
                                    left: 1,
                                    right: 1,
                                    child: GestureDetector(
                                      onTap: () => _signOut(),
                                      child: Container(
                                          width: 70.0,
                                          height: 70.0,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: AssetImage(
                                                      "assets/sample.jpg")))),
                                    ),
                                  ),

                                  /// Deposit button
                                  Positioned(
                                      bottom: 12.5,
                                      left: 50,
                                      right: 50,
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                        child: FlatButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(3.0),
                                              side: BorderSide(
                                                  color: Theme.of(context).primaryColor)
                                          ),
                                          color: Theme.of(context).primaryColor,
                                          textColor: Colors.white,
                                          padding: EdgeInsets.all(12.0),
                                          onPressed: () {
                                            //_signOut();
                                            DepositDrawer();
                                          },
                                          child: Text(
                                            AppLocalizations.of(context).deposit,
                                            style: TextStyle(fontSize: 16.0,),
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),

                              ///
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ///
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(15, 15, 10, 0),
                                    child: TextWidget.fieldLabel(
                                      AppLocalizations.of(context)
                                          .potfolio_time_series,
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),

                              ///   Graph
                              //Graph Integration with static data -----------------------------------------------
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Column(
                                    children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(3),
                                          topRight: Radius.circular(3),
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(0)),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(13.0),
                                      child: LineChart(
                                        LineChartData(
                                          minX: 1,
                                          maxX: 10,
                                          minY: 1,
                                          maxY: 7,
                                          titlesData:LineTitles.getTitleData(),
                                          gridData: FlGridData(
                                            show: true,
                                            getDrawingHorizontalLine: (value) {
                                              return FlLine(
                                                color: Color(0xff4D525D),
                                                strokeWidth: 1,
                                              );
                                            },
                                            drawVerticalLine: false,
                                            getDrawingVerticalLine: (value) {
                                              return FlLine(
                                                color: Color(0xff37434d),
                                                strokeWidth: 1,
                                              );
                                            },
                                          ),
                                          borderData: FlBorderData(
                                            show: true,
                                            border: Border.all(
                                                color: Color(0xff4D525D),
                                                width: 1),
                                          ),
                                          lineBarsData: [
                                            LineChartBarData(
                                              spots: [
                                                FlSpot(1, 1),
                                                FlSpot(4, 4),
                                                FlSpot(5, 4),
                                                FlSpot(6, 5),
                                                FlSpot(7, 5),
                                                FlSpot(8, 5),
                                                FlSpot(9, 6),
                                                FlSpot(10, 6),
                                              ],
                                              isCurved: false,
                                              colors: lineColors,
                                              curveSmoothness: .10,
                                              barWidth: 1,
                                              dotData: FlDotData(show: false),
                                              belowBarData: BarAreaData(
                                                show: true,
                                                gradientFrom: Offset(0, 1),
                                                gradientTo: Offset(0, 0),
                                                colors: gradientColors
                                                    .map((color) =>
                                                        color.withOpacity(0.2))
                                                    .toList(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  //Initialize the chart widget
                                ]),
                              ),
                              /// cash
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Column(children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xff353945),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(0),
                                          topRight: Radius.circular(0),
                                          bottomLeft: Radius.circular(3),
                                          bottomRight: Radius.circular(3)),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ///   Icon
                                          Container(
                                            height: 30,
                                            width: 30,
                                            child:
                                                Image.asset('assets/cash.png'),
                                          ),
                                          ///   cash Text
                                          TextWidget.fieldLabel(
                                            AppLocalizations.of(context)
                                                .cash
                                                .toUpperCase(),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Theme.of(context).dividerColor,
                                          ),
                                          SizedBox(
                                            width: 13,
                                          ),
                                          ///   Icon
                                          Container(
                                            height: 30,
                                            width: 30,
                                            child:
                                                Image.asset('assets/cash.png'),
                                          ),
                                          ///   cash Text
                                          TextWidget.fieldLabel(
                                            AppLocalizations.of(context)
                                                .cash
                                                .toUpperCase(),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Theme.of(context).dividerColor,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  //Initialize the chart widget
                                ]),
                              ),

                              SizedBox(
                                height: 40,
                              ),

                              ///   Active Micro Fund
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    ///   Active Micro Funds
                                    TextWidget.fieldLabel(
                                      AppLocalizations.of(context).active_micro_funds,
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    ///   Refresh
                                    Row(
                                      children: [
                                        Container(
                                          height: 28,
                                          width: 28,
                                          child: Image.asset('assets/refresh.png'),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xff2C303A),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(0),
                                                topRight: Radius.circular(3),
                                                bottomLeft: Radius.circular(0),
                                                bottomRight:
                                                    Radius.circular(3)),
                                          ),
                                          height: 28,
                                          width: 14,
                                          child: Image.asset(
                                              'assets/arrow_down.png'),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Column(children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xff353945),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(3),
                                          topRight: Radius.circular(3),
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(0)),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 15,
                                            child: TextWidget.fieldLabel(
                                              AppLocalizations.of(context).micro_fund,
                                              fontSize: 14,
                                              textAlign: TextAlign.center,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xffCECED1),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 25,
                                            child: TextWidget.fieldLabel(
                                              AppLocalizations.of(context).investment,
                                              fontSize: 14,
                                              textAlign: TextAlign.center,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xffCECED1),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 25,
                                            child: TextWidget.fieldLabel(
                                              AppLocalizations.of(context)
                                                  .current,
                                              fontSize: 14,
                                              textAlign: TextAlign.center,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xffCECED1),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 15,
                                            child: TextWidget.fieldLabel(
                                              AppLocalizations.of(context)
                                                  .percent,
                                              fontSize: 14,
                                              textAlign: TextAlign.center,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xffCECED1),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 12,
                                            child: TextWidget.fieldLabel(
                                              AppLocalizations.of(context)
                                                  .days_ago,
                                              fontSize: 14,
                                              textAlign: TextAlign.center,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xffCECED1),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 8,
                                            child: Container(
                                              width: 30,
                                              height: 30,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),

                                  // HERE List Items to be populated from API --------------------------------------------
                                  isMicroFundLoading
                                      ? _utils.showLoading(context)
                                      : Container(
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                    itemCount: _myPortfolioPageResponse.myPortfolioPage.portfolios[0].microFunds.length,
                                    itemBuilder: (BuildContext context, int index) {
                                        return Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: Theme.of(context).accentColor,
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(0),
                                                    topRight: Radius.circular(0),
                                                    bottomLeft: Radius.circular(0),
                                                    bottomRight: Radius.circular(0)),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    8, 12, 10, 12),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      flex: 15,
                                                      child: TextWidget.fieldLabel(
                                                        _myPortfolioPageResponse.myPortfolioPage.portfolios[0].microFunds[index].name,
                                                        fontSize: 14,
                                                        textAlign: TextAlign.center,
                                                        fontWeight: FontWeight.w500,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 25,
                                                      child: TextWidget.fieldLabel(
                                                        "n/a",
                                                        fontSize: 14,
                                                        textAlign: TextAlign.center,
                                                        fontWeight: FontWeight.w500,
                                                        color: Color(0xffCECED1),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 25,
                                                      child: TextWidget.fieldLabel(
                                                        "n/a",
                                                        fontSize: 14,
                                                        textAlign: TextAlign.center,
                                                        fontWeight: FontWeight.w500,
                                                        color: Color(0xffCECED1),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 15,
                                                      child: TextWidget.fieldLabel(
                                                        "n/a",
                                                        fontSize: 14,
                                                        textAlign: TextAlign.center,
                                                        fontWeight: FontWeight.w500,
                                                        color: Theme.of(context)
                                                            .highlightColor,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 12,
                                                      child: TextWidget.fieldLabel(
                                                        _myPortfolioPageResponse.myPortfolioPage.portfolios[0].microFunds[index].daysAgo.toString(),
                                                        fontSize: 14,
                                                        textAlign: TextAlign.center,
                                                        fontWeight: FontWeight.w500,
                                                        color: Color(0xffCECED1),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 8,
                                                      child: Container(
                                                        width: 30,
                                                        height: 30,
                                                        child: Image.asset(
                                                            'assets/arrow_right.png'),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            _myPortfolioPageResponse.myPortfolioPage.portfolios[0].microFunds.length != index
                                                ? Padding(
                                                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                                    child: Container(
                                                      height: 1,
                                                      color: Color(0xff4D525D),),)
                                                : Container(),
                                          ],
                                        );
                                    },
                                  ),
                                      ),

                                  // Container(
                                  //   margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  //   width: double.infinity,
                                  //   decoration: BoxDecoration(
                                  //     color: Theme.of(context).accentColor,
                                  //     borderRadius: BorderRadius.only(
                                  //         topLeft: Radius.circular(0),
                                  //         topRight: Radius.circular(0),
                                  //         bottomLeft: Radius.circular(0),
                                  //         bottomRight: Radius.circular(0)),
                                  //   ),
                                  //   child: Padding(
                                  //     padding:  EdgeInsets.fromLTRB(8, 12, 10, 12),
                                  //     child: Row(
                                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //       crossAxisAlignment: CrossAxisAlignment.center,
                                  //       children: [
                                  //         Expanded(
                                  //           flex: 15,
                                  //           child: TextWidget.fieldLabel(
                                  //             "Beta \nFund 4",
                                  //             fontSize: 14,
                                  //             textAlign: TextAlign.center,
                                  //             fontWeight: FontWeight.w500,
                                  //             color: Colors.white,
                                  //           ),
                                  //         ),
                                  //         Expanded(
                                  //           flex: 25,
                                  //           child: TextWidget.fieldLabel(
                                  //             "\$7,244.00",
                                  //             fontSize: 14,
                                  //             textAlign: TextAlign.center,
                                  //             fontWeight: FontWeight.w500,
                                  //             color: Color(0xffCECED1),
                                  //           ),
                                  //         ),
                                  //         Expanded(
                                  //           flex: 25,
                                  //           child: TextWidget.fieldLabel(
                                  //             "\$7,244.00",
                                  //             fontSize: 14,
                                  //             textAlign: TextAlign.center,
                                  //             fontWeight: FontWeight.w500,
                                  //             color: Color(0xffCECED1),
                                  //           ),
                                  //         ),
                                  //         Expanded(
                                  //           flex: 15,
                                  //           child: TextWidget.fieldLabel(
                                  //             "4%",
                                  //             fontSize: 14,
                                  //             textAlign: TextAlign.center,
                                  //             fontWeight: FontWeight.w500,
                                  //             color: Theme.of(context).highlightColor,
                                  //           ),
                                  //         ),
                                  //         Expanded(
                                  //           flex: 12,
                                  //           child: TextWidget.fieldLabel(
                                  //             "30",
                                  //             fontSize: 14,
                                  //             textAlign: TextAlign.center,
                                  //             fontWeight: FontWeight.w500,
                                  //             color: Color(0xffCECED1),
                                  //           ),
                                  //         ),
                                  //         Expanded(
                                  //           flex: 8,
                                  //           child: Container(
                                  //             width: 30,
                                  //             height: 30,
                                  //             child: Image.asset('assets/arrow_right.png'),
                                  //           ),
                                  //         )
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  //   child: Container(
                                  //     height: 1,
                                  //     color: Color(0xff4D525D),
                                  //   ),
                                  // ),
                                  //
                                  // Container(
                                  //   margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  //   width: double.infinity,
                                  //   decoration: BoxDecoration(
                                  //     color: Theme.of(context).accentColor,
                                  //     borderRadius: BorderRadius.only(
                                  //         topLeft: Radius.circular(0),
                                  //         topRight: Radius.circular(0),
                                  //         bottomLeft: Radius.circular(0),
                                  //         bottomRight: Radius.circular(0)),
                                  //   ),
                                  //   child: Padding(
                                  //     padding: EdgeInsets.fromLTRB(8, 12, 10, 12),
                                  //     child: Row(
                                  //       mainAxisAlignment:
                                  //           MainAxisAlignment.spaceBetween,
                                  //       crossAxisAlignment:
                                  //           CrossAxisAlignment.center,
                                  //       children: [
                                  //         Expanded(
                                  //           flex: 15,
                                  //           child: TextWidget.fieldLabel(
                                  //             "Beta \nFund 4",
                                  //             fontSize: 14,
                                  //             textAlign: TextAlign.center,
                                  //             fontWeight: FontWeight.w500,
                                  //             color: Colors.white,
                                  //           ),
                                  //         ),
                                  //         Expanded(
                                  //           flex: 25,
                                  //           child: TextWidget.fieldLabel(
                                  //             "\$7,244.00",
                                  //             fontSize: 14,
                                  //             textAlign: TextAlign.center,
                                  //             fontWeight: FontWeight.w500,
                                  //             color: Color(0xffCECED1),
                                  //           ),
                                  //         ),
                                  //         Expanded(
                                  //           flex: 25,
                                  //           child: TextWidget.fieldLabel(
                                  //             "\$7,244.00",
                                  //             fontSize: 14,
                                  //             textAlign: TextAlign.center,
                                  //             fontWeight: FontWeight.w500,
                                  //             color: Color(0xffCECED1),
                                  //           ),
                                  //         ),
                                  //         Expanded(
                                  //           flex: 15,
                                  //           child: TextWidget.fieldLabel(
                                  //             "4%",
                                  //             fontSize: 14,
                                  //             textAlign: TextAlign.center,
                                  //             fontWeight: FontWeight.w500,
                                  //             color: Theme.of(context)
                                  //                 .highlightColor,
                                  //           ),
                                  //         ),
                                  //         Expanded(
                                  //           flex: 12,
                                  //           child: TextWidget.fieldLabel(
                                  //             "30",
                                  //             fontSize: 14,
                                  //             textAlign: TextAlign.center,
                                  //             fontWeight: FontWeight.w500,
                                  //             color: Color(0xffCECED1),
                                  //           ),
                                  //         ),
                                  //         Expanded(
                                  //           flex: 8,
                                  //           child: Container(
                                  //             width: 30,
                                  //             height: 30,
                                  //             child: Image.asset(
                                  //                 'assets/arrow_right.png'),
                                  //           ),
                                  //         )
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  //   child: Container(
                                  //     height: 1,
                                  //     color: Color(0xff4D525D),
                                  //   ),
                                  // ),
                                  //
                                  // Container(
                                  //   margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  //   width: double.infinity,
                                  //   decoration: BoxDecoration(
                                  //     color: Theme.of(context).accentColor,
                                  //     borderRadius: BorderRadius.only(
                                  //         topLeft: Radius.circular(0),
                                  //         topRight: Radius.circular(0),
                                  //         bottomLeft: Radius.circular(3),
                                  //         bottomRight: Radius.circular(3)),
                                  //   ),
                                  //   child: Padding(
                                  //     padding: EdgeInsets.fromLTRB(8, 12, 10, 12),
                                  //     child: Row(
                                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //       crossAxisAlignment: CrossAxisAlignment.center,
                                  //       children: [
                                  //         Expanded(
                                  //           flex: 15,
                                  //           child: TextWidget.fieldLabel(
                                  //             "Beta \nFund 4",
                                  //             fontSize: 14,
                                  //             textAlign: TextAlign.center,
                                  //             fontWeight: FontWeight.w500,
                                  //             color: Colors.white,
                                  //           ),
                                  //         ),
                                  //         Expanded(
                                  //           flex: 25,
                                  //           child: TextWidget.fieldLabel(
                                  //             "\$7,244.00",
                                  //             fontSize: 14,
                                  //             textAlign: TextAlign.center,
                                  //             fontWeight: FontWeight.w500,
                                  //             color: Color(0xffCECED1),
                                  //           ),
                                  //         ),
                                  //         Expanded(
                                  //           flex: 25,
                                  //           child: TextWidget.fieldLabel(
                                  //             "\$7,244.00",
                                  //             fontSize: 14,
                                  //             textAlign: TextAlign.center,
                                  //             fontWeight: FontWeight.w500,
                                  //             color: Color(0xffCECED1),
                                  //           ),
                                  //         ),
                                  //         Expanded(
                                  //           flex: 15,
                                  //           child: TextWidget.fieldLabel(
                                  //             "4%",
                                  //             fontSize: 14,
                                  //             textAlign: TextAlign.center,
                                  //             fontWeight: FontWeight.w500,
                                  //             color: Theme.of(context)
                                  //                 .highlightColor,
                                  //           ),
                                  //         ),
                                  //         Expanded(
                                  //           flex: 12,
                                  //           child: TextWidget.fieldLabel(
                                  //             "30",
                                  //             fontSize: 14,
                                  //             textAlign: TextAlign.center,
                                  //             fontWeight: FontWeight.w500,
                                  //             color: Color(0xffCECED1),
                                  //           ),
                                  //         ),
                                  //         Expanded(
                                  //           flex: 8,
                                  //           child: Container(
                                  //             width: 30,
                                  //             height: 30,
                                  //             child: Image.asset(
                                  //                 'assets/arrow_right.png'),
                                  //           ),
                                  //         )
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),

                                  SizedBox(
                                    height: 20,
                                  )
                                ]),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      bottom: .5,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 1,
                        color: Color(0xff4A4C55),
                      )),
                ],
              );
          //  }
         // }
        //});
  }

  DepositDrawer() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              initialChildSize: 0.70, //set this as you want
              maxChildSize: 0.70, //set this as you want
              minChildSize: 0.70, //set this as you want
              expand: true,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                    color: Theme.of(context).backgroundColor,
                  ),
                  child: Stack(
                    children: [
                      _depositStepNo == 1 ? Deposit_Step1_Ui() : Container(),
                      _depositStepNo == 2 ? Deposit_Step2_Ui() : Container(),
                      _depositStepNo == 3 ? Deposit_Step3_Ui() : Container(),
                      _depositStepNo == 4 ? Deposit_Step4_Ui() : Container(),
                    ],
                  ),
                ); //whatever you're returning, does not have to be a Container
              }
          );
          /*return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              color: Theme
                  .of(context)
                  .accentColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[

                Container(
                    height: (56 * 6).toDouble(),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                      color: Theme
                          .of(context)
                          .backgroundColor,
                    ),
                    child: Stack(
                      alignment: Alignment(0, 0),
                      overflow: Overflow.visible,
                      children: <Widget>[

                        Positioned(
                          child: ListView(
                            physics: NeverScrollableScrollPhysics(),
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  "Inbox",
                                  style: TextStyle(color: Colors.white),
                                ),
                                leading: Icon(
                                  Icons.inbox,
                                  color: Colors.white,
                                ),
                                onTap: () {},
                              ),
                              ListTile(
                                title: Text(
                                  "Starred",
                                  style: TextStyle(color: Colors.white),
                                ),
                                leading: Icon(
                                  Icons.star_border,
                                  color: Colors.white,
                                ),
                                onTap: () {},
                              ),
                              ListTile(
                                title: Text(
                                  "Sent",
                                  style: TextStyle(color: Colors.white),
                                ),
                                leading: Icon(
                                  Icons.send,
                                  color: Colors.white,
                                ),
                                onTap: () {},
                              ),
                              ListTile(
                                title: Text(
                                  "Trash",
                                  style: TextStyle(color: Colors.white),
                                ),
                                leading: Icon(
                                  Icons.delete_outline,
                                  color: Colors.white,
                                ),
                                onTap: () {},
                              ),
                              ListTile(
                                title: Text(
                                  "Spam",
                                  style: TextStyle(color: Colors.white),
                                ),
                                leading: Icon(
                                  Icons.error,
                                  color: Colors.white,
                                ),
                                onTap: () {},
                              ),
                              ListTile(
                                title: Text(
                                  "Drafts",
                                  style: TextStyle(color: Colors.white),
                                ),
                                leading: Icon(
                                  Icons.mail_outline,
                                  color: Colors.white,
                                ),
                                onTap: () {},
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                Container(
                  height: 56,
                  color: Theme
                      .of(context)
                      .backgroundColor,
                )
              ],
            ),
          );*/
        });
  }

  Deposit_Step1_Ui () {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///   Deposit Amount
                  TextWidget.fieldLabel(
                    "Deposit Amount",
                    fontSize: 25,
                    textAlign: TextAlign.start,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.cancel_outlined,color: Colors.grey, size: 25,),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              ///   Description here
              TextWidget.fieldLabel(
                "Description here",
                fontSize: 18,
                textAlign: TextAlign.start,
                color: Color(0xff9C9EA5),
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 35,),
              ///   Amount (NZD)
              Container(
                width: double.infinity,
                height: 50.0,
                //padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(3.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(12,12,12,12),
                        child: Text(
                          "Amount (NZD)",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: _fielsFontSize,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff9C9EA5)),
                        ),
                      ),
                    ),
                    Flexible(
                        flex: 6,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            style: Theme.of(context).textTheme.bodyText1,
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.end,
                            decoration: InputDecoration.collapsed(
                                hintText: "",
                                hintStyle: TextStyle(color: Colors.grey)
                            ),
                            onSaved: (val) => _amountNZD = val.trim(),
                            validator: (value) => _utils.genrealTextValidation(value.trim()),
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
        ///   Next Page
        Positioned(
          bottom: 0,right: 0,left: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: Container(
              child: Column(
                children: [
                  isLoading
                      ? _utils.showLoading(context)
                      : GestureDetector(
                    onTap: () => _loadNextPage(2), //_loadNextPage(2),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 50.0,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Container(
                          padding: EdgeInsets.all(12.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Text(
                            "Next Step",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color:  Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Deposit_Step2_Ui() {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///   Agreements
                  TextWidget.fieldLabel(
                    "Agreements",
                    fontSize: 25,
                    textAlign: TextAlign.start,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.cancel_outlined,color: Colors.grey, size: 25,))
                ],
              ),
              SizedBox(height: 15,),
              ///   Description here
              TextWidget.fieldLabel(
                "Description here",
                fontSize: 18,
                textAlign: TextAlign.start,
                color: Color(0xff9C9EA5),
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 35,),
              ///   Loan agreement
              Container(
                width: double.infinity,
                height: 50.0,
                decoration: BoxDecoration(
                  //color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(3.0),
                ),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          SizedBox(width: 12,),
                          Text(
                            "Loan agreement",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: _fielsFontSize,

                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(width: 12,),
                          Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/cloud_download.png"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(width: 12,),
                          Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/cloud_upload.png"),
                              ),
                            ),
                          ),
                          SizedBox(width: 12,),
                          Text(
                            "Upload",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .primaryColor),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        ///   Next Page
        Positioned(
          bottom: 0,right: 0,left: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: Container(
              child: Column(
                children: [
                  isLoading
                      ? _utils.showLoading(context)
                      : GestureDetector(
                    onTap: () => _loadNextPage(3), //_loadNextPage(2),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 50.0,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Container(
                          padding: EdgeInsets.all(12.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Text(
                            "Next Step",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color:  Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
        ),

      ],
    );
  }

  Deposit_Step3_Ui() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.cancel_outlined,
                        color: Colors.grey,
                        size: 25,
                      ),
                  ),
                ],
              ),
            ],
          ),
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///   Clock
            Container(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              decoration: BoxDecoration(
                color: Color(0xff303A53),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Icon(
                Icons.access_time,
                color: Theme.of(context).primaryColor,
                size: 45,
              ),
            ),
            ///   Wait for verification
            SizedBox(height: 10,),
            TextWidget.fieldLabel(
              "Wait for verification",
              fontSize: 25,
              textAlign: TextAlign.start,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            ///  It usually takes from 1 to 2 days.
            SizedBox(height: 10,),
            TextWidget.fieldLabel(
              "It usually takes from 1 to 2 days.",
              fontSize: 18,
              textAlign: TextAlign.start,
              color: Color(0xff9C9EA5),
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ],
    );
  }

  Deposit_Step4_Ui() {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///   Deposit information
                  TextWidget.fieldLabel(
                    "Deposit information",
                    fontSize: 25,
                    textAlign: TextAlign.start,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.cancel_outlined,
                      color: Colors.grey,
                      size: 25,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35,),
              ///   Amount (NZD)
              Container(
                width: double.infinity,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(12,12,12,12),
                        child: Text(
                          "Amount (NZD)",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: _fielsFontSize,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff9C9EA5)),
                        ),
                      ),
                    ),
                    Flexible(
                        flex: 6,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            style: Theme.of(context).textTheme.bodyText1,
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.end,
                            decoration: InputDecoration.collapsed(
                                hintText: "",
                                hintStyle: TextStyle(color: Colors.grey),
                            ),
                            onSaved: (val) => _amountNZD = val.trim(),
                            validator: (value) => _utils.genrealTextValidation(value.trim()),
                          ),
                        ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                height: 1,
                color: Theme.of(context).accentColor,
              ),
              ///   Account number
              Container(
                width: double.infinity,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(12,12,12,12),
                        child: Text(
                          "Account number",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: _fielsFontSize,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff9C9EA5),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                        flex: 6,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            style: Theme.of(context).textTheme.bodyText1,
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.end,
                            decoration: InputDecoration.collapsed(
                                hintText: "",
                                hintStyle: TextStyle(color: Colors.grey),
                            ),
                            onSaved: (val) => _amountNZD = val.trim(),
                            validator: (value) => _utils.genrealTextValidation(value.trim()
                            ),
                          ),
                        ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                height: 1,
                color: Theme.of(context).accentColor,
              ),
              ///   Reference
              Container(
                width: double.infinity,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(12,12,12,12),
                        child: Text(
                          "Reference",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: _fielsFontSize,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff9C9EA5),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 6,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.end,
                          decoration: InputDecoration.collapsed(
                              hintText: "",
                              hintStyle: TextStyle(color: Colors.grey),
                          ),
                          onSaved: (val) => _amountNZD = val.trim(),
                          validator: (value) => _utils.genrealTextValidation(value.trim(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        ///   Finish
        Positioned(
          bottom: 0,right: 0,left: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: Container(
              child: Column(
                children: [
                  isLoading
                      ? _utils.showLoading(context)
                      : GestureDetector(
                    onTap: () {
                      setState(() {
                        _depositStepNo = 1;
                      });
                      Navigator.pop(context);
                    }, //_loadNextPage(2),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 50.0,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Container(
                          padding: EdgeInsets.all(12),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Text(
                            "Finish",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color:  Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  ///     Operational Methods

  void _loadNextPage(int pageNo) {
    setState(() {
      _depositStepNo = pageNo;
    });
    Navigator.pop(context);
    DepositDrawer();
  }

  Future sleep() {
    return Future.delayed(Duration(milliseconds: 2000), () => "3");
  }

  void _signOut() async {
    Preferences().clearPreferences();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
  }

  _getDataFromSharedPreferences() async {
    String _usrId_T = await Preferences().getUserId();
    String _userName_T = await Preferences().getUserName();
    String _usrName_T = await Preferences().getUsrName();
    String _usrEmail_T = await Preferences().getUsrEmail();
    String _usrToken_T = await Preferences().getAuthToken();
    setState(() {
      _usrId = _usrId_T;
      _userName = _userName_T;
      _usrName = _usrName_T;
      _usrEmail = _usrEmail_T;
    });
    print(_usrToken_T);
    _microFundsPresentor.GetUserInfo(_usrToken_T);
    _microFundsPresentor.GetMicroFunds(_usrToken_T);

  }

  ///   View Port Override Methods

  @override
  void onFailure(String msg) {
    print(msg);
    _utils.showToast(msg, context);
  }

  @override
  void onMyQuerySuccess(DashboardMeResponse dashboardMeResponse) {
    setState(() {
      _userName = dashboardMeResponse.username;
      _cash = dashboardMeResponse.cashBalance.nZD == null ? "0.0" : dashboardMeResponse.cashBalance.nZD ;
      _invested = dashboardMeResponse.moneyDeployedToMicroFunds.nZD == null ? 0.0 : dashboardMeResponse.moneyDeployedToMicroFunds.nZD ;
      _accountBalance = dashboardMeResponse.accountCashBalance.nZD == null ? "0.0" : dashboardMeResponse.accountCashBalance.nZD;

      isProfileLoading = false;
    });
  }

  @override
  void onMyMicroFundQuerySuccess(myMicroFunds_Response funds_response) {
    setState(() {
      _fundsResponse = funds_response;
      isMicroFundLoading = false;
    });
  }

  @override
  void onMyPortfolioPageQuerySuccess(MyPortfolioPageResponse myPortfolioPageResponse) {
    setState(() {
      _myPortfolioPageResponse = myPortfolioPageResponse;
      isMicroFundLoading = false;
    });
    //print("---> ${_myPortfolioPageResponse.myPortfolioPage.portfolios[0].id}");
  }

}
