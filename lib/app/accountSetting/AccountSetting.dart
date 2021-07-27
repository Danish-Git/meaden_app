import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:meaden_app/app/accountSetting/AccountSettingPresentor.dart';
import 'package:meaden_app/models/SettingMeQueryResponse.dart';
import 'package:meaden_app/play_ui/play_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:meaden_app/webservices/networkStrings.dart';

import '../Preferences.dart';
import '../Utils.dart';
import 'AccountSettingView.dart';

class AccountSetting extends StatefulWidget {
  @override
  _AccountSettingState createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> with SingleTickerProviderStateMixin implements AccountSettingView {



  Utils get _utils => GetIt.I<Utils>();
  AccountSettingPresentor _accountSettingPresentor;
  SettingMeQueryResponse meResponse;

  double _iconSize = 24;
  EdgeInsets _dividerPending = EdgeInsets.fromLTRB(10, 0, 10, 0);
  double _height = 35;
  AnimationController _controller;

  bool _isLoading;

  @override
  void initState() {
    // _controller = AnimationController(duration: Duration(milliseconds: 3000), vsync: this)..repeat();
    // _controller.repeat();
    super.initState();
    _getData();
  }

  @override
  void deactivate() {
    //_controller.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        brightness: Brightness.dark,
        elevation: 0,
        leading:IconButton(
          padding: EdgeInsets.only(left: 15, right: 15),
          icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).primaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title:  Container(height: 40, width: 40,
          child: Image.asset('assets/gembot_logo.png'),
        ),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _isLoading ? _utils.showLoading(context) : SingleChildScrollView(
        child: Container(
            child: Column(
              children: [
                SizedBox(height: 10,),
                TextWidget.fieldLabel(
                  "Account Setting",
                  fontSize: 20,
                  textAlign: TextAlign.center,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                ///   Documents
                SizedBox(height: 30,),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.description,size: _iconSize, color: Colors.white,),
                      SizedBox(width: 5,),
                      Expanded(
                        child: TextWidget.fieldLabel(
                          "Documents",
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 3,),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(3),
                          bottomRight: Radius.circular(3)),
                    ),
                    child: Column(children: [
                      Container(
                        width: double.infinity,
                        child: Padding(
                          padding:  EdgeInsets.fromLTRB(10, 12, 10, 12),
                          child: TextWidget.fieldLabel(
                            "No data available",
                            fontSize: 14,
                            textAlign: TextAlign.start,
                            fontWeight: FontWeight.w500,
                            color:  Color(0xffCECED1),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                ///   Overview
                SizedBox(height: _height,),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.person,size: _iconSize,color: Colors.white,),
                      SizedBox(width: 5,),
                      Expanded(
                        child: TextWidget.fieldLabel(
                          "Overview",
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.start,
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 3,),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(3),
                          bottomRight: Radius.circular(3)),
                    ),
                    child: Column(children: [
                      Container(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(8, 12, 10, 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 15,
                                child: TextWidget.fieldLabel(
                                  "Name",
                                  fontSize: 14,
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                flex: 25,
                                child: TextWidget.fieldLabel(
                                  meResponse.name,
                                  fontSize: 14,
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffCECED1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: _dividerPending,
                        child: Container(
                          height: 1,
                          color: Color(0xff4D525D),
                        ),
                      ),
                      ///   User Name
                      Container(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(8, 12, 10, 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 15,
                                child: TextWidget.fieldLabel(
                                  "User Name",
                                  fontSize: 14,
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                flex: 25,
                                child: TextWidget.fieldLabel(
                                  meResponse.username,
                                  fontSize: 14,
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffCECED1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                ///   Contact Details
                SizedBox(height: _height,),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.contacts,size: _iconSize,color: Colors.white,),
                      SizedBox(width: 5,),
                      Expanded(
                        child: TextWidget.fieldLabel(
                          "Contact Details",
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 3,),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(3),
                          bottomRight: Radius.circular(3)),
                    ),
                    child: Column(children: [
                      ///   Address
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 12, 10, 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 15,
                              child: TextWidget.fieldLabel(
                                "Address",
                                fontSize: 14,
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              flex: 25,
                              child: TextWidget.fieldLabel(
                                "${meResponse.addressNeighbourhood}, "
                                    "${meResponse.addressStreetNumber}, "
                                    "${meResponse.addressStreetName}, "
                                    "${meResponse.addressCity}, "
                                    "${meResponse.addressCountry}, "
                                    "${meResponse.addressZip}",
                                fontSize: 14,
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffCECED1),
                              ),
                            ),

                          ],
                        ),
                      ),
                      Padding(
                        padding: _dividerPending,
                        child: Container(
                          height: 1,
                          color: Color(0xff4D525D),
                        ),
                      ),
                      ///   Contact Number
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 12, 10, 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 15,
                              child: TextWidget.fieldLabel(
                                "Contact Number",
                                fontSize: 14,
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              flex: 25,
                              child: TextWidget.fieldLabel(
                                "${meResponse.contactNumber}",
                                fontSize: 14,
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffCECED1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: _dividerPending,
                        child: Container(
                          height: 1,
                          color: Color(0xff4D525D),
                        ),
                      ),
                      ///   Email
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 12, 10, 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 15,
                              child: TextWidget.fieldLabel(
                                "E-Mail",
                                fontSize: 14,
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              flex: 25,
                              child: TextWidget.fieldLabel(
                                "${meResponse.email}",
                                fontSize: 14,
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffCECED1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
                ///   Security & Access
                SizedBox(height: _height,),
                Padding(
                  padding:
                  const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.security,size: _iconSize,color: Colors.white,),
                      SizedBox(width: 5,),
                      Expanded(
                        child: TextWidget.fieldLabel(
                          "Security & Access",
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 3,),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(children: [
                    ///   Change Password
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                      width: double.infinity,
                      decoration: new BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0)),
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.pushNamed(context, "/changePassword"),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          decoration: new BoxDecoration(
                              color: Theme.of(context).accentColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0)),
                              border: Border.all(width: 1, color: Colors.green)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 15,
                                child: TextWidget.fieldLabel(
                                  "Change Password",
                                  fontSize: 14,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ///   Enable 2-Factor Authentication
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      width: double.infinity,
                      decoration: new BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0)),
                      ),
                      child: GestureDetector(
                        onTap: () => print("Enable 2-Factor Authentication Tapped"),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          decoration: new BoxDecoration(
                              color: Theme.of(context).accentColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0)),
                              border: Border.all(width: 1, color: Colors.indigoAccent)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 15,
                                child: TextWidget.fieldLabel(
                                  "Enable 2-Factor Authentication",
                                  fontSize: 14,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.indigoAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ///   Add Security E-Mail
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                      width: double.infinity,
                      decoration: new BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0)),
                      ),
                      child: GestureDetector(
                        onTap: () => print("Add Security E-Mail Tapped"),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          decoration: new BoxDecoration(
                              color: Theme.of(context).accentColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0)),
                              border: Border.all(width: 1, color: Colors.redAccent)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 15,
                                child: TextWidget.fieldLabel(
                                  "Add Security E-Mail",
                                  fontSize: 14,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),

                ///   Bank & Card Details
                // SizedBox(height: _height,),
                // Padding(
                //   padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Icon(Icons.credit_card,size: _iconSize,color: Colors.white,),
                //       SizedBox(width: 5,),
                //       Expanded(
                //         child: TextWidget.fieldLabel(
                //           "Bank & Card Details",
                //           fontSize: 18,
                //           color: Colors.white,
                //           fontWeight: FontWeight.w700,
                //           textAlign: TextAlign.start,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(height: 5,),
                // Padding(
                //   padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                //   child: Column(children: [
                //     ///  Add New Account Number
                //     GestureDetector(
                //       onTap: () => print("Add New Account Number Tapped"),
                //       child: SizedBox(
                //         width: double.infinity,
                //         child: Padding(
                //           padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                //           child: FlatButton(
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(3.0),
                //                 side: BorderSide(
                //                     color: Theme.of(context).primaryColor)),
                //             color: Theme.of(context).primaryColor,
                //             textColor: Colors.white,
                //             padding: EdgeInsets.all(12.0),
                //             onPressed: () {
                //
                //
                //             },
                //             child: Text(
                //               "Add New Bank Account",
                //               style: TextStyle(
                //                 fontSize: 14.0,
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //     ///  Table Head
                //     Container(
                //       margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                //       width: double.infinity,
                //       decoration: new BoxDecoration(
                //         color: Color(0xff353945),
                //         borderRadius: BorderRadius.only(
                //             topLeft: Radius.circular(3),
                //             topRight: Radius.circular(3),
                //             bottomLeft: Radius.circular(0),
                //             bottomRight: Radius.circular(0)),
                //       ),
                //       child: Padding(
                //         padding: const EdgeInsets.all(10.0),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           children: [
                //             Expanded(
                //               flex: 14,
                //               child: TextWidget.fieldLabel(
                //                 "Name",
                //                 fontSize: 14,
                //                 textAlign: TextAlign.center,
                //                 fontWeight: FontWeight.w500,
                //                 color: Color(0xffCECED1),
                //               ),
                //             ),
                //             Expanded(
                //               flex: 22,
                //               child: TextWidget.fieldLabel(
                //                 "Bank",
                //                 fontSize: 14,
                //                 textAlign: TextAlign.center,
                //                 fontWeight: FontWeight.w500,
                //                 color: Color(0xffCECED1),
                //               ),
                //             ),
                //             Expanded(
                //               flex: 25,
                //               child: TextWidget.fieldLabel(
                //                 "Account Number",
                //                 fontSize: 14,
                //                 textAlign: TextAlign.center,
                //                 fontWeight: FontWeight.w500,
                //                 color: Color(0xffCECED1),
                //               ),
                //             ),
                //             Expanded(
                //               flex: 25,
                //               child: TextWidget.fieldLabel(
                //                 "Gembot Reference",
                //                 fontSize: 14,
                //                 textAlign: TextAlign.center,
                //                 fontWeight: FontWeight.w500,
                //                 color: Color(0xffCECED1),
                //               ),
                //             ),
                //             Expanded(
                //               flex: 5,
                //               child: Container(
                //                 width: 30,
                //                 height: 30,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //     ///  Table Body
                //     Container(
                //       margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                //       width: double.infinity,
                //       decoration: new BoxDecoration(
                //         color: Theme.of(context).accentColor,
                //         borderRadius: BorderRadius.only(
                //             topLeft: Radius.circular(0),
                //             topRight: Radius.circular(0),
                //             bottomLeft: Radius.circular(0),
                //             bottomRight: Radius.circular(0)),
                //       ),
                //       child: Column(
                //         children: [
                //           Padding(
                //             padding: EdgeInsets.fromLTRB(8, 12, 10, 12),
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               crossAxisAlignment: CrossAxisAlignment.center,
                //               children: [
                //                 Expanded(
                //                   flex: 13,
                //                   child: TextWidget.fieldLabel(
                //                     "Winning",
                //                     fontSize: 14,
                //                     textAlign: TextAlign.center,
                //                     fontWeight: FontWeight.w500,
                //                     color: Colors.white,
                //                   ),
                //                 ),
                //                 Expanded(
                //                   flex: 22,
                //                   child: TextWidget.fieldLabel(
                //                     "ANZ",
                //                     fontSize: 14,
                //                     textAlign: TextAlign.center,
                //                     fontWeight: FontWeight.w500,
                //                     color: Color(0xffCECED1),
                //                   ),
                //                 ),
                //                 Expanded(
                //                   flex: 30,
                //                   child: TextWidget.fieldLabel(
                //                     "06-0231-6230352-02",
                //                     fontSize: 14,
                //                     textAlign: TextAlign.center,
                //                     fontWeight: FontWeight.w500,
                //                     color: Color(0xffCECED1),
                //                   ),
                //                 ),
                //                 Expanded(
                //                   flex: 25,
                //                   child: TextWidget.fieldLabel(
                //                     "Charlie5202",
                //                     fontSize: 14,
                //                     textAlign: TextAlign.center,
                //                     fontWeight: FontWeight.w500,
                //                     color: Color(0xffCECED1),
                //                   ),
                //                 ),
                //                 Expanded(
                //                   flex: 6,
                //                   child: Container(
                //                     width: 30,
                //                     height: 30,
                //                     child:
                //                        Icon(Icons.check_circle_outline, size: 16,
                //                         color: Colors.white,)
                //                   ),
                //                 )
                //               ],
                //             ),
                //           ),
                //           Padding(
                //             padding: _dividerPending,
                //             child: Container(
                //               height: 1,
                //               color: Color(0xff4D525D),
                //             ),
                //           ),
                //
                //           Padding(
                //             padding: EdgeInsets.fromLTRB(8, 12, 10, 12),
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               crossAxisAlignment: CrossAxisAlignment.center,
                //               children: [
                //                 Expanded(
                //                   flex: 13,
                //                   child: TextWidget.fieldLabel(
                //                     "Winning",
                //                     fontSize: 14,
                //                     textAlign: TextAlign.center,
                //                     fontWeight: FontWeight.w500,
                //                     color: Colors.white,
                //                   ),
                //                 ),
                //                 Expanded(
                //                   flex: 22,
                //                   child: TextWidget.fieldLabel(
                //                     "ANZ",
                //                     fontSize: 14,
                //                     textAlign: TextAlign.center,
                //                     fontWeight: FontWeight.w500,
                //                     color: Color(0xffCECED1),
                //                   ),
                //                 ),
                //                 Expanded(
                //                   flex: 30,
                //                   child: TextWidget.fieldLabel(
                //                     "06-0231-6230352-02",
                //                     fontSize: 14,
                //                     textAlign: TextAlign.center,
                //                     fontWeight: FontWeight.w500,
                //                     color: Color(0xffCECED1),
                //                   ),
                //                 ),
                //                 Expanded(
                //                   flex: 25,
                //                   child: TextWidget.fieldLabel(
                //                     "Charlie5202",
                //                     fontSize: 14,
                //                     textAlign: TextAlign.center,
                //                     fontWeight: FontWeight.w500,
                //                     color: Color(0xffCECED1),
                //                   ),
                //                 ),
                //                 Expanded(
                //                   flex: 6,
                //                   child: Container(
                //                       width: 30,
                //                       height: 30,
                //                       child: AnimatedBuilder(
                //                           animation: _controller,
                //                           builder: (_, child) {
                //                             return Transform.rotate(
                //                                 angle: -(_controller.value * 2 * 3.14),
                //                                 child: Icon(Icons.sync, size: 16,
                //                                   color: Colors.white,));
                //                           }
                //                       )
                //                   ),
                //                 )
                //               ],
                //             ),
                //           ),
                //           Padding(
                //             padding: _dividerPending,
                //             child: Container(
                //               height: 1,
                //               color: Color(0xff4D525D),
                //             ),
                //           ),
                //
                //           Padding(
                //             padding: EdgeInsets.fromLTRB(8, 12, 10, 12),
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               crossAxisAlignment: CrossAxisAlignment.center,
                //               children: [
                //                 Expanded(
                //                   flex: 13,
                //                   child: TextWidget.fieldLabel(
                //                     "Winning",
                //                     fontSize: 14,
                //                     textAlign: TextAlign.center,
                //                     fontWeight: FontWeight.w500,
                //                     color: Colors.white,
                //                   ),
                //                 ),
                //                 Expanded(
                //                   flex: 22,
                //                   child: TextWidget.fieldLabel(
                //                     "ANZ",
                //                     fontSize: 14,
                //                     textAlign: TextAlign.center,
                //                     fontWeight: FontWeight.w500,
                //                     color: Color(0xffCECED1),
                //                   ),
                //                 ),
                //                 Expanded(
                //                   flex: 30,
                //                   child: TextWidget.fieldLabel(
                //                     "06-0231-6230352-02",
                //                     fontSize: 14,
                //                     textAlign: TextAlign.center,
                //                     fontWeight: FontWeight.w500,
                //                     color: Color(0xffCECED1),
                //                   ),
                //                 ),
                //                 Expanded(
                //                   flex: 25,
                //                   child: TextWidget.fieldLabel(
                //                     "Charlie5202",
                //                     fontSize: 14,
                //                     textAlign: TextAlign.center,
                //                     fontWeight: FontWeight.w500,
                //                     color: Color(0xffCECED1),
                //                   ),
                //                 ),
                //                 Expanded(
                //                   flex: 6,
                //                   child: Container(
                //                       width: 30,
                //                       height: 30,
                //                       child: Icon(Icons.cancel_outlined, size: 16,
                //                                 color: Colors.white,)
                //
                //                   ),
                //                 )
                //               ],
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //
                //   ]),
                // ),

                ///   Deposit Transactions
                SizedBox(height: _height,),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.assignment,size: _iconSize,color: Colors.white,),
                      SizedBox(width: 5,),
                      Expanded(
                        child: TextWidget.fieldLabel(
                          "Deposit Transactions",
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(children: [
                    ///  Table Head
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
                      width: double.infinity,
                      decoration: new BoxDecoration(
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
                              flex: 24,
                              child: TextWidget.fieldLabel(
                                "Transaction ID",
                                fontSize: 14,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffCECED1),
                              ),
                            ),
                            Expanded(
                              flex: 20,
                              child: TextWidget.fieldLabel(
                                "Type",
                                fontSize: 14,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffCECED1),
                              ),
                            ),
                            Expanded(
                              flex: 18,
                              child: TextWidget.fieldLabel(
                                "Account Ending",
                                fontSize: 14,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffCECED1),
                              ),
                            ),
                            Expanded(
                              flex: 20,
                              child: TextWidget.fieldLabel(
                                "Created At",
                                fontSize: 14,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffCECED1),
                              ),
                            ),
                            Expanded(
                              flex: 17,
                              child: TextWidget.fieldLabel(
                                "Amount (NZD)",
                                fontSize: 14,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffCECED1),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                width: 30,
                                height: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ///  Table Body
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      width: double.infinity,
                      decoration: new BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0)),
                      ),
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: meResponse.deposits.length,
                          itemBuilder: (BuildContext context, int index) {
                            print(index);
                            return Column(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 24,
                                            child: TextWidget.fieldLabel(
                                              "${meResponse.deposits[index].id}",
                                              fontSize: 14,
                                              textAlign: TextAlign.center,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 20,
                                            child: TextWidget.fieldLabel(
                                              "${meResponse.deposits[index].transactionClass}",
                                              fontSize: 14,
                                              textAlign: TextAlign.center,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xffCECED1),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 18,
                                            child: TextWidget.fieldLabel(
                                              "352-02",
                                              fontSize: 14,
                                              textAlign: TextAlign.center,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xffCECED1),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 20,
                                            child: TextWidget.fieldLabel(
                                              "${_utils.stringToDate(meResponse.deposits[index].transactionDate)}",
                                              fontSize: 14,
                                              textAlign: TextAlign.center,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xffCECED1),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 15,
                                            child: TextWidget.fieldLabel(
                                              "${meResponse.deposits[index].amount}",
                                              fontSize: 14,
                                              textAlign: TextAlign.center,
                                              fontWeight: FontWeight.w500,
                                              color: Theme.of(context).highlightColor,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 6,
                                            child: Container(
                                                width: 30,
                                                height: 30,
                                                child: Icon(
                                                  Icons.check_circle_outline,
                                                  size: 16,
                                                  color: Colors.white,
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                  index == meResponse.deposits.length
                                      ? Container()
                                      : Padding(
                                        padding: _dividerPending,
                                        child: Container(
                                          height: 1,
                                          color: Color(0xff4D525D),
                                        ),
                                      ),
                              ]
                            );
                          }),
                    ),

                    // Container(
                    //   margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    //   width: double.infinity,
                    //   decoration: new BoxDecoration(
                    //     color: Theme.of(context).accentColor,
                    //     borderRadius: BorderRadius.only(
                    //         topLeft: Radius.circular(0),
                    //         topRight: Radius.circular(0),
                    //         bottomLeft: Radius.circular(0),
                    //         bottomRight: Radius.circular(0)),
                    //   ),
                    //   child: Column(
                    //     children: [
                    //       Padding(
                    //         padding: EdgeInsets.fromLTRB(8, 12, 10, 12),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           children: [
                    //             Expanded(
                    //               flex: 24,
                    //               child: TextWidget.fieldLabel(
                    //                 "23ff349fgbc",
                    //                 fontSize: 14,
                    //                 textAlign: TextAlign.center,
                    //                 fontWeight: FontWeight.w500,
                    //                 color: Colors.white,
                    //               ),
                    //             ),
                    //             Expanded(
                    //               flex: 20,
                    //               child: TextWidget.fieldLabel(
                    //                 "Bank Transfer",
                    //                 fontSize: 14,
                    //                 textAlign: TextAlign.center,
                    //                 fontWeight: FontWeight.w500,
                    //                 color: Color(0xffCECED1),
                    //               ),
                    //             ),
                    //             Expanded(
                    //               flex: 18,
                    //               child: TextWidget.fieldLabel(
                    //                 "352-02",
                    //                 fontSize: 14,
                    //                 textAlign: TextAlign.center,
                    //                 fontWeight: FontWeight.w500,
                    //                 color: Color(0xffCECED1),
                    //               ),
                    //             ),
                    //             Expanded(
                    //               flex: 20,
                    //               child: TextWidget.fieldLabel(
                    //                 "22/08/2020",
                    //                 fontSize: 14,
                    //                 textAlign: TextAlign.center,
                    //                 fontWeight: FontWeight.w500,
                    //                 color: Color(0xffCECED1),
                    //               ),
                    //             ),
                    //             Expanded(
                    //               flex: 15,
                    //               child: TextWidget.fieldLabel(
                    //                 "\$5,000",
                    //                 fontSize: 14,
                    //                 textAlign: TextAlign.center,
                    //                 fontWeight: FontWeight.w500,
                    //                 color: Theme.of(context).highlightColor,
                    //               ),
                    //             ),
                    //             Expanded(
                    //               flex: 6,
                    //               child: Container(
                    //                   width: 30,
                    //                   height: 30,
                    //                   child:
                    //                   Icon(Icons.check_circle_outline, size: 16,
                    //                     color: Colors.white,)
                    //               ),
                    //             )
                    //           ],
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: _dividerPending,
                    //         child: Container(
                    //           height: 1,
                    //           color: Color(0xff4D525D),
                    //         ),
                    //       ),
                    //
                    //       Padding(
                    //         padding: EdgeInsets.fromLTRB(8, 12, 10, 12),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           children: [
                    //             Expanded(
                    //               flex: 24,
                    //               child: TextWidget.fieldLabel(
                    //                 "23ff349fgbc",
                    //                 fontSize: 14,
                    //                 textAlign: TextAlign.center,
                    //                 fontWeight: FontWeight.w500,
                    //                 color: Colors.white,
                    //               ),
                    //             ),
                    //             Expanded(
                    //               flex: 20,
                    //               child: TextWidget.fieldLabel(
                    //                 "Bank Transfer",
                    //                 fontSize: 14,
                    //                 textAlign: TextAlign.center,
                    //                 fontWeight: FontWeight.w500,
                    //                 color: Color(0xffCECED1),
                    //               ),
                    //             ),
                    //             Expanded(
                    //               flex: 18,
                    //               child: TextWidget.fieldLabel(
                    //                 "352-02",
                    //                 fontSize: 14,
                    //                 textAlign: TextAlign.center,
                    //                 fontWeight: FontWeight.w500,
                    //                 color: Color(0xffCECED1),
                    //               ),
                    //             ),
                    //             Expanded(
                    //               flex: 20,
                    //               child: TextWidget.fieldLabel(
                    //                 "22/08/2020",
                    //                 fontSize: 14,
                    //                 textAlign: TextAlign.center,
                    //                 fontWeight: FontWeight.w500,
                    //                 color: Color(0xffCECED1),
                    //               ),
                    //             ),
                    //             Expanded(
                    //               flex: 15,
                    //               child: TextWidget.fieldLabel(
                    //                 "\$5,000",
                    //                 fontSize: 14,
                    //                 textAlign: TextAlign.center,
                    //                 fontWeight: FontWeight.w500,
                    //                 color: Theme.of(context).highlightColor,
                    //               ),
                    //             ),
                    //             Expanded(
                    //               flex: 6,
                    //               child: Container(
                    //                   width: 30,
                    //                   height: 30,
                    //                   child: AnimatedBuilder(
                    //                       animation: _controller,
                    //                       builder: (_, child) {
                    //                         return Transform.rotate(
                    //                             angle: -(_controller.value * 2 * 3.14),
                    //                             child: Icon(Icons.sync, size: 16,
                    //                               color: Colors.white,));
                    //                       }
                    //                   )
                    //               ),
                    //             )
                    //           ],
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: _dividerPending,
                    //         child: Container(
                    //           height: 1,
                    //           color: Color(0xff4D525D),
                    //         ),
                    //       ),
                    //
                    //       Padding(
                    //         padding: EdgeInsets.fromLTRB(8, 12, 10, 12),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           children: [
                    //             Expanded(
                    //               flex: 24,
                    //               child: TextWidget.fieldLabel(
                    //                 "23ff349fgbc",
                    //                 fontSize: 14,
                    //                 textAlign: TextAlign.center,
                    //                 fontWeight: FontWeight.w500,
                    //                 color: Colors.white,
                    //               ),
                    //             ),
                    //             Expanded(
                    //               flex: 20,
                    //               child: TextWidget.fieldLabel(
                    //                 "Bank Transfer",
                    //                 fontSize: 14,
                    //                 textAlign: TextAlign.center,
                    //                 fontWeight: FontWeight.w500,
                    //                 color: Color(0xffCECED1),
                    //               ),
                    //             ),
                    //             Expanded(
                    //               flex: 18,
                    //               child: TextWidget.fieldLabel(
                    //                 "352-02",
                    //                 fontSize: 14,
                    //                 textAlign: TextAlign.center,
                    //                 fontWeight: FontWeight.w500,
                    //                 color: Color(0xffCECED1),
                    //               ),
                    //             ),
                    //             Expanded(
                    //               flex: 20,
                    //               child: TextWidget.fieldLabel(
                    //                 "22/08/2020",
                    //                 fontSize: 14,
                    //                 textAlign: TextAlign.center,
                    //                 fontWeight: FontWeight.w500,
                    //                 color: Color(0xffCECED1),
                    //               ),
                    //             ),
                    //             Expanded(
                    //               flex: 15,
                    //               child: TextWidget.fieldLabel(
                    //                 "\$5,000",
                    //                 fontSize: 14,
                    //                 textAlign: TextAlign.center,
                    //                 fontWeight: FontWeight.w500,
                    //                 color: Theme.of(context).highlightColor,
                    //               ),
                    //             ),
                    //             Expanded(
                    //               flex: 6,
                    //               child: Container(
                    //                   width: 30,
                    //                   height: 30,
                    //                   child: Icon(Icons.cancel_outlined, size: 16,
                    //                     color: Colors.white,)
                    //
                    //               ),
                    //             )
                    //           ],
                    //         ),
                    //       ),
                    //
                    //     ],
                    //   ),
                    // ),
                  ]),
                ),

                ///   Withdrawal Transactions
                SizedBox(height: _height,),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.assignment,size: _iconSize,color: Colors.white,),
                      SizedBox(width: 5,),
                      Expanded(
                        child: TextWidget.fieldLabel(
                          "Withdrawal Transactions",
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Column(children: [
                      ///  Table Head
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
                        width: double.infinity,
                        decoration: new BoxDecoration(
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
                                flex: 24,
                                child: TextWidget.fieldLabel(
                                  "Transaction ID",
                                  fontSize: 14,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffCECED1),
                                ),
                              ),
                              Expanded(
                                flex: 20,
                                child: TextWidget.fieldLabel(
                                  "Type",
                                  fontSize: 14,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffCECED1),
                                ),
                              ),
                              Expanded(
                                flex: 18,
                                child: TextWidget.fieldLabel(
                                  "Account Ending",
                                  fontSize: 14,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffCECED1),
                                ),
                              ),
                              Expanded(
                                flex: 20,
                                child: TextWidget.fieldLabel(
                                  "Created At",
                                  fontSize: 14,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffCECED1),
                                ),
                              ),
                              Expanded(
                                flex: 17,
                                child: TextWidget.fieldLabel(
                                  "Amount (NZD)",
                                  fontSize: 14,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffCECED1),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Container(
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      ///  Table Body
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        width: double.infinity,
                        decoration: new BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0)),
                        ),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: meResponse.deposits.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 24,
                                        child: TextWidget.fieldLabel(
                                          "${meResponse.deposits[index].id}",
                                          fontSize: 14,
                                          textAlign: TextAlign.center,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 20,
                                        child: TextWidget.fieldLabel(
                                          "${meResponse.deposits[index].transactionClass}",
                                          fontSize: 14,
                                          textAlign: TextAlign.center,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xffCECED1),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 18,
                                        child: TextWidget.fieldLabel(
                                          "352-02",
                                          fontSize: 14,
                                          textAlign: TextAlign.center,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xffCECED1),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 20,
                                        child: TextWidget.fieldLabel(
                                          "${_utils.stringToDate(meResponse.deposits[index].transactionDate)}",
                                          fontSize: 14,
                                          textAlign: TextAlign.center,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xffCECED1),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 15,
                                        child: TextWidget.fieldLabel(
                                          "${meResponse.deposits[index].amount}",
                                          fontSize: 14,
                                          textAlign: TextAlign.center,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Theme.of(context).highlightColor,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 6,
                                        child: Container(
                                            width: 30,
                                            height: 30,
                                            child: Icon(
                                              Icons.check_circle_outline,
                                              size: 16,
                                              color: Colors.white,
                                            )
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                index == meResponse.deposits.length
                                    ? Container()
                                    : Padding(
                                        padding: _dividerPending,
                                        child: Container(
                                          height: 1,
                                          color: Color(0xff4D525D),
                                        ),
                                      ),
                              ]);
                            }),
                      ),
                      // Container(
                      //   margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      //   width: double.infinity,
                      //   decoration: new BoxDecoration(
                      //     color: Theme.of(context).accentColor,
                      //     borderRadius: BorderRadius.only(
                      //         topLeft: Radius.circular(0),
                      //         topRight: Radius.circular(0),
                      //         bottomLeft: Radius.circular(0),
                      //         bottomRight: Radius.circular(0)),
                      //   ),
                      //   child: Column(
                      //     children: [
                      //       Padding(
                      //         padding: EdgeInsets.fromLTRB(8, 12, 10, 12),
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //           crossAxisAlignment: CrossAxisAlignment.center,
                      //           children: [
                      //             Expanded(
                      //               flex: 24,
                      //               child: TextWidget.fieldLabel(
                      //                 "23ff349fgbc",
                      //                 fontSize: 14,
                      //                 textAlign: TextAlign.center,
                      //                 fontWeight: FontWeight.w500,
                      //                 color: Colors.white,
                      //               ),
                      //             ),
                      //             Expanded(
                      //               flex: 20,
                      //               child: TextWidget.fieldLabel(
                      //                 "Bank Transfer",
                      //                 fontSize: 14,
                      //                 textAlign: TextAlign.center,
                      //                 fontWeight: FontWeight.w500,
                      //                 color: Color(0xffCECED1),
                      //               ),
                      //             ),
                      //             Expanded(
                      //               flex: 18,
                      //               child: TextWidget.fieldLabel(
                      //                 "352-02",
                      //                 fontSize: 14,
                      //                 textAlign: TextAlign.center,
                      //                 fontWeight: FontWeight.w500,
                      //                 color: Color(0xffCECED1),
                      //               ),
                      //             ),
                      //             Expanded(
                      //               flex: 20,
                      //               child: TextWidget.fieldLabel(
                      //                 "22/08/2020",
                      //                 fontSize: 14,
                      //                 textAlign: TextAlign.center,
                      //                 fontWeight: FontWeight.w500,
                      //                 color: Color(0xffCECED1),
                      //               ),
                      //             ),
                      //             Expanded(
                      //               flex: 15,
                      //               child: TextWidget.fieldLabel(
                      //                 "\$5,000",
                      //                 fontSize: 14,
                      //                 textAlign: TextAlign.center,
                      //                 fontWeight: FontWeight.w500,
                      //                 color: Theme.of(context).highlightColor,
                      //               ),
                      //             ),
                      //             Expanded(
                      //               flex: 6,
                      //               child: Container(
                      //                   width: 30,
                      //                   height: 30,
                      //                   child:
                      //                   Icon(Icons.check_circle_outline, size: 16,
                      //                     color: Colors.white,)
                      //               ),
                      //             )
                      //           ],
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding: _dividerPending,
                      //         child: Container(
                      //           height: 1,
                      //           color: Color(0xff4D525D),
                      //         ),
                      //       ),
                      //
                      //       Padding(
                      //         padding: EdgeInsets.fromLTRB(8, 12, 10, 12),
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //           crossAxisAlignment: CrossAxisAlignment.center,
                      //           children: [
                      //             Expanded(
                      //               flex: 24,
                      //               child: TextWidget.fieldLabel(
                      //                 "23ff349fgbc",
                      //                 fontSize: 14,
                      //                 textAlign: TextAlign.center,
                      //                 fontWeight: FontWeight.w500,
                      //                 color: Colors.white,
                      //               ),
                      //             ),
                      //             Expanded(
                      //               flex: 20,
                      //               child: TextWidget.fieldLabel(
                      //                 "Bank Transfer",
                      //                 fontSize: 14,
                      //                 textAlign: TextAlign.center,
                      //                 fontWeight: FontWeight.w500,
                      //                 color: Color(0xffCECED1),
                      //               ),
                      //             ),
                      //             Expanded(
                      //               flex: 18,
                      //               child: TextWidget.fieldLabel(
                      //                 "352-02",
                      //                 fontSize: 14,
                      //                 textAlign: TextAlign.center,
                      //                 fontWeight: FontWeight.w500,
                      //                 color: Color(0xffCECED1),
                      //               ),
                      //             ),
                      //             Expanded(
                      //               flex: 20,
                      //               child: TextWidget.fieldLabel(
                      //                 "22/08/2020",
                      //                 fontSize: 14,
                      //                 textAlign: TextAlign.center,
                      //                 fontWeight: FontWeight.w500,
                      //                 color: Color(0xffCECED1),
                      //               ),
                      //             ),
                      //             Expanded(
                      //               flex: 15,
                      //               child: TextWidget.fieldLabel(
                      //                 "\$5,000",
                      //                 fontSize: 14,
                      //                 textAlign: TextAlign.center,
                      //                 fontWeight: FontWeight.w500,
                      //                 color: Theme.of(context).highlightColor,
                      //               ),
                      //             ),
                      //             Expanded(
                      //               flex: 6,
                      //               child: Container(
                      //                   width: 30,
                      //                   height: 30,
                      //                   child: AnimatedBuilder(
                      //                       animation: _controller,
                      //                       builder: (_, child) {
                      //                         return Transform.rotate(
                      //                             angle: -(_controller.value * 2 * 3.14),
                      //                             child: Icon(Icons.sync, size: 16,
                      //                               color: Colors.white,));
                      //                       }
                      //                   )
                      //               ),
                      //             )
                      //           ],
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding: _dividerPending,
                      //         child: Container(
                      //           height: 1,
                      //           color: Color(0xff4D525D),
                      //         ),
                      //       ),
                      //
                      //       Padding(
                      //         padding: EdgeInsets.fromLTRB(8, 12, 10, 12),
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //           crossAxisAlignment: CrossAxisAlignment.center,
                      //           children: [
                      //             Expanded(
                      //               flex: 24,
                      //               child: TextWidget.fieldLabel(
                      //                 "23ff349fgbc",
                      //                 fontSize: 14,
                      //                 textAlign: TextAlign.center,
                      //                 fontWeight: FontWeight.w500,
                      //                 color: Colors.white,
                      //               ),
                      //             ),
                      //             Expanded(
                      //               flex: 20,
                      //               child: TextWidget.fieldLabel(
                      //                 "Bank Transfer",
                      //                 fontSize: 14,
                      //                 textAlign: TextAlign.center,
                      //                 fontWeight: FontWeight.w500,
                      //                 color: Color(0xffCECED1),
                      //               ),
                      //             ),
                      //             Expanded(
                      //               flex: 18,
                      //               child: TextWidget.fieldLabel(
                      //                 "352-02",
                      //                 fontSize: 14,
                      //                 textAlign: TextAlign.center,
                      //                 fontWeight: FontWeight.w500,
                      //                 color: Color(0xffCECED1),
                      //               ),
                      //             ),
                      //             Expanded(
                      //               flex: 20,
                      //               child: TextWidget.fieldLabel(
                      //                 "22/08/2020",
                      //                 fontSize: 14,
                      //                 textAlign: TextAlign.center,
                      //                 fontWeight: FontWeight.w500,
                      //                 color: Color(0xffCECED1),
                      //               ),
                      //             ),
                      //             Expanded(
                      //               flex: 15,
                      //               child: TextWidget.fieldLabel(
                      //                 "\$5,000",
                      //                 fontSize: 14,
                      //                 textAlign: TextAlign.center,
                      //                 fontWeight: FontWeight.w500,
                      //                 color: Theme.of(context).highlightColor,
                      //               ),
                      //             ),
                      //             Expanded(
                      //               flex: 6,
                      //               child: Container(
                      //                   width: 30,
                      //                   height: 30,
                      //                   child: Icon(Icons.cancel_outlined, size: 16,
                      //                     color: Colors.white,)
                      //
                      //               ),
                      //             )
                      //           ],
                      //         ),
                      //       ),
                      //
                      //     ],
                      //   ),
                      // ),
                    ]),
                  ),

                  /*///   Account Transactions
                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 5,),
                      Expanded(
                        child: TextWidget.fieldLabel(
                          "Account Transactions",
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(children: [
                    ///   Table Head
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
                      width: double.infinity,
                      decoration: new BoxDecoration(
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
                              flex: 24,
                              child: TextWidget.fieldLabel(
                                "Transaction ID",
                                fontSize: 14,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffCECED1),
                              ),
                            ),
                            Expanded(
                              flex: 20,
                              child: TextWidget.fieldLabel(
                                "Type",
                                fontSize: 14,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffCECED1),
                              ),
                            ),
                            Expanded(
                              flex: 18,
                              child: TextWidget.fieldLabel(
                                "Account Ending",
                                fontSize: 14,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffCECED1),
                              ),
                            ),
                            Expanded(
                              flex: 20,
                              child: TextWidget.fieldLabel(
                                "Created At",
                                fontSize: 14,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffCECED1),
                              ),
                            ),
                            Expanded(
                              flex: 17,
                              child: TextWidget.fieldLabel(
                                "Amount",
                                fontSize: 14,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffCECED1),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                width: 30,
                                height: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ///   Table Body
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      width: double.infinity,
                      decoration: new BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0)),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(8, 12, 10, 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 24,
                                  child: TextWidget.fieldLabel(
                                    "23ff349fgbc",
                                    fontSize: 14,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                Expanded(
                                  flex: 20,
                                  child: TextWidget.fieldLabel(
                                    "Bank Transfer",
                                    fontSize: 14,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffCECED1),
                                  ),
                                ),
                                Expanded(
                                  flex: 18,
                                  child: TextWidget.fieldLabel(
                                    "352-02",
                                    fontSize: 14,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffCECED1),
                                  ),
                                ),
                                Expanded(
                                  flex: 20,
                                  child: TextWidget.fieldLabel(
                                    "22/08/2020",
                                    fontSize: 14,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffCECED1),
                                  ),
                                ),
                                Expanded(
                                  flex: 15,
                                  child: TextWidget.fieldLabel(
                                    "\$5,000",
                                    fontSize: 14,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).highlightColor,
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                      width: 30,
                                      height: 30,
                                      child: AnimatedBuilder(
                                          animation: _controller,
                                          builder: (_, child) {
                                            return Transform.rotate(
                                                angle: -(_controller.value * 2 * 3.14),
                                                child: Icon(Icons.sync, size: 16,
                                                  color: Colors.white,));
                                          }
                                      )
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: _dividerPending,
                            child: Container(
                              height: 1,
                              color: Color(0xff4D525D),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.fromLTRB(8, 12, 10, 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 24,
                                  child: TextWidget.fieldLabel(
                                    "23ff349fgbc",
                                    fontSize: 14,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                Expanded(
                                  flex: 20,
                                  child: TextWidget.fieldLabel(
                                    "Bank Transfer",
                                    fontSize: 14,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffCECED1),
                                  ),
                                ),
                                Expanded(
                                  flex: 18,
                                  child: TextWidget.fieldLabel(
                                    "352-02",
                                    fontSize: 14,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffCECED1),
                                  ),
                                ),
                                Expanded(
                                  flex: 20,
                                  child: TextWidget.fieldLabel(
                                    "22/08/2020",
                                    fontSize: 14,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffCECED1),
                                  ),
                                ),
                                Expanded(
                                  flex: 15,
                                  child: TextWidget.fieldLabel(
                                    "\$5,000",
                                    fontSize: 14,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).highlightColor,
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                      width: 30,
                                      height: 30,
                                      child:
                                      Icon(Icons.check_circle_outline, size: 16,
                                        color: Colors.white,)
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: _dividerPending,
                            child: Container(
                              height: 1,
                              color: Color(0xff4D525D),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.fromLTRB(8, 12, 10, 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 24,
                                  child: TextWidget.fieldLabel(
                                    "23ff349fgbc",
                                    fontSize: 14,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                Expanded(
                                  flex: 20,
                                  child: TextWidget.fieldLabel(
                                    "Bank Transfer",
                                    fontSize: 14,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffCECED1),
                                  ),
                                ),
                                Expanded(
                                  flex: 18,
                                  child: TextWidget.fieldLabel(
                                    "352-02",
                                    fontSize: 14,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffCECED1),
                                  ),
                                ),
                                Expanded(
                                  flex: 20,
                                  child: TextWidget.fieldLabel(
                                    "22/08/2020",
                                    fontSize: 14,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffCECED1),
                                  ),
                                ),
                                Expanded(
                                  flex: 15,
                                  child: TextWidget.fieldLabel(
                                    "\$5,000",
                                    fontSize: 14,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).highlightColor,
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                      width: 30,
                                      height: 30,
                                      child: Icon(Icons.cancel_outlined, size: 16,
                                        color: Colors.white,)

                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),*/

                SizedBox(height: 25,),
              ],
            )
        ),
      ),
    );
  }

  _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(

            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(5, 30, 5, 25),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    child: Column(
                      children: [
                        ///  setting icon
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 25,
                                  width: 25,
                                  child: Icon(Icons.close , color: Colors.white,),
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
                          "Change Password",
                          /**/
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(
                          height: 20,
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
                  child: Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage("assets/gembot_logo.png")))),
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
                                color: Theme.of(context).primaryColor)),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(12.0),
                        onPressed: () {},
                        child: Text(
                          "deposit",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          );
        });
  }

  void _getData() async {
    _accountSettingPresentor = AccountSettingPresentor(this);

    if(_utils.isInternetAvailable() != null){   ///   True
      setState(() {
        _isLoading = true;
      });
      // _accountSettingPresentor.GetUserInfo(await Preferences().getAuthToken());
      _accountSettingPresentor.GetUserInfo(NetworkStrings().RichardToken);
    } else {
      onFailure(AppLocalizations.of(context).internet_not_available);
    }

  }

  @override
  void onFailure(String msg) {
    _utils.showToast(msg, context);
    Navigator.pop(context);
  }

  @override
  void onMyQuerySuccess(SettingMeQueryResponse meResponse) {
    setState(() {
      this.meResponse = meResponse;
      _isLoading = false;
    });
    print(meResponse.deposits.length);
  }
}
