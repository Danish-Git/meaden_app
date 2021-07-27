import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:meaden_app/Bloc/Blog_main.dart';
import 'package:meaden_app/app/Utils.dart';
import 'package:meaden_app/app/onBoading/OnBoadingPresentor.dart';
import 'package:meaden_app/app/onBoading/OnBoadingView.dart';
import 'package:meaden_app/play_ui/play_ui.dart';

class OnBoading extends StatefulWidget {
  @override
  _OnBoadingState createState() => _OnBoadingState();
}

class _OnBoadingState extends State<OnBoading> with SingleTickerProviderStateMixin implements OnBoadingView {
  double _width = 0;
  bool isLoading = false;
  int _loadPage = 1;
  double _circleSize = 35, _pageNoSize = 16, _radioFontSize = 15, _fielsFontSize = 14;

  Utils get _utils => GetIt.I<Utils>();
  var _pageCount_bloc ;
  final _formPage1 = GlobalKey<FormState>();
  final _formPage2 = GlobalKey<FormState>();
  final _formPage3 = GlobalKey<FormState>();
  final _formPage4 = GlobalKey<FormState>();

  double beginAnim = 0.0 ;
  double endAnim = 1.0 ;
  double progressValue = 0.0906 ;

  OnBoadingPresentor _onBoadingPresentor;

  int _entryType = 0;
  String _company, _trust, _industry ;
  String _amountNZD, _installments, _irdNumber, _incomeTex ;
  String _gevName, _midName, _famName, _dob, _street, _suburb, _city, _postcode;
  String _number, _version;
  bool _loanAgreement, _sow, _safeHarbours, _cloudCheck;
  bool _isVerified, _isDrivilingLicense = true;


  @override
  void initState() {
    super.initState();
    _onBoadingPresentor = OnBoadingPresentor(this);
    _loadNextPage(_loadPage);
  }

  List<Widget> pageList = [
//    Page1(),
//    Page2(),
//    Page3(),
//    Page4(),
//    Page5(),
//    Page6()
  ];

  @override
  Widget build(BuildContext context) {



    ///   Test Case
     //autoLoad();
    if(_loadPage == 5) {
      sleep().then((value) {
        if (value == "3") {
          _loadNextPage(6);
        }
      });
    }
    /*setState(() {// 1-1 ,2-3 ,3-5 ,4-7 ,5-9 ,6-11
      progressValue = 0.0906*11;
    });*/
    /*setState(() {// 1-1 ,2-3 ,3-5 ,4-7
      // 4-7, 3-5, 2-3, 1-1
      progressValue = 0.0906 * ();
    });*/
    ///   -----------   ///
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ///   body
          //pageList[_loadPage],
          _loadPage == 1
              ? Page1()
              : Container(),

          _loadPage == 2
              ? Page2()
              : Container(),

          _loadPage == 3
              ? Page3()
              : Container(),

          _loadPage == 4
              ? Page4()
              : Container(),

          _loadPage == 5
              ? Page5()
              : Container(),

          _loadPage == 6
              ? Page6()
              : Container(),

          Column(
            children: [
              Container(
                color: Theme.of(context).accentColor,
                padding: EdgeInsets.fromLTRB(10, 48, 10, 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 2,
                      ),
                    ),
                    ///   1
                    Container(
                      width: _circleSize,
                      height: _circleSize,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _loadPage == 1 ? Theme.of(context).primaryColor : Theme.of(context).backgroundColor,
                          border: Border.all(
                            width: 1,
                            color: _loadPage >= 1 ? Theme.of(context).primaryColor : Theme.of(context).backgroundColor,
                          )
                      ),
                      alignment: Alignment.center,
                      child: _loadPage > 1
                          ? Icon(Icons.check, color: Theme.of(context).primaryColor,)
                          : TextWidget.fieldLabel(
                        "1",
                        fontSize: _pageNoSize,
                        textAlign: TextAlign.center,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    ///   2
                    Expanded(
                      flex: 8,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
//                    width: _width,
                        height: 2,
                        color: _loadPage >= 2 ? Theme.of(context).primaryColor : Theme.of(context).backgroundColor,
                      ),
                    ),
                    Container(
                      width: _circleSize,
                      height: _circleSize,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _loadPage == 2 ? Theme.of(context).primaryColor : Theme.of(context).backgroundColor,
                          border: Border.all(
                            width: 1,
                            color: _loadPage >= 2 ? Theme.of(context).primaryColor : Theme.of(context).backgroundColor,
                          )
                      ),
                      alignment: Alignment.center,
                      child: _loadPage > 2
                          ? Icon(Icons.check, color: Theme.of(context).primaryColor,)
                          : TextWidget.fieldLabel(
                        "2",
                        fontSize: _pageNoSize,
                        textAlign: TextAlign.center,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    ///   3
                    Expanded(
                      flex: 8,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        width: _width,
                        height: 2,
                        color: _loadPage >= 3 ? Theme.of(context).primaryColor : Theme.of(context).backgroundColor,
                      ),
                    ),
                    Container(
                      width: _circleSize,
                      height: _circleSize,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _loadPage == 3 ? Theme.of(context).primaryColor : Theme.of(context).backgroundColor,
                          border: Border.all(
                            width: 1,
                            color: _loadPage >= 3 ? Theme.of(context).primaryColor : Theme.of(context).backgroundColor,
                          )
                      ),
                      alignment: Alignment.center,
                      child: _loadPage > 3
                          ? Icon(Icons.check, color: Theme.of(context).primaryColor,)
                          : TextWidget.fieldLabel(
                        "3",
                        fontSize: _pageNoSize,
                        textAlign: TextAlign.center,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    ///   4
                    Expanded(
                      flex: 8,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        width: _width,
                        height: 2,
                        color: _loadPage >= 4 ? Theme.of(context).primaryColor : Theme.of(context).backgroundColor,
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _loadPage == 4 ? Theme.of(context).primaryColor : Theme.of(context).backgroundColor,
                          border: Border.all(
                            width: 1,
                            color: _loadPage >= 4 ? Theme.of(context).primaryColor : Theme.of(context).backgroundColor,
                          )
                      ),
                      alignment: Alignment.center,
                      child: _loadPage > 4
                          ? Icon(Icons.check, color: Theme.of(context).primaryColor,)
                          : TextWidget.fieldLabel(
                        "4",
                        fontSize: _pageNoSize,
                        textAlign: TextAlign.center,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    ///   5
                    Expanded(
                      flex: 8,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        width: _width,
                        height: 2,
                        color: _loadPage >= 5 ? Theme.of(context).primaryColor : Theme.of(context).backgroundColor,
                      ),
                    ),
                    Container(
                      width: _circleSize,
                      height: _circleSize,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _loadPage == 5 ? Theme.of(context).primaryColor : Theme.of(context).backgroundColor,
                          border: Border.all(
                            width: 1,
                            color: _loadPage >= 5 ? Theme.of(context).primaryColor : Theme.of(context).backgroundColor,
                          )
                      ),
                      alignment: Alignment.center,
                      child: _loadPage > 5
                          ? Icon(Icons.check, color: Theme.of(context).primaryColor,)
                          : TextWidget.fieldLabel(
                        "5",
                        fontSize: _pageNoSize,
                        textAlign: TextAlign.center,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    ///   6
                    Expanded(
                      flex: 8,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        width: _width,
                        height: 2,
                        color: _loadPage >= 6 ? Theme.of(context).primaryColor : Theme.of(context).backgroundColor,
                      ),
                    ),
                    Container(
                      width: _circleSize,
                      height: _circleSize,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _loadPage == 6 ? Theme.of(context).primaryColor : Theme.of(context).backgroundColor,
                          border: Border.all(
                            width: 1,
                            color: _loadPage >= 6 ? Theme.of(context).primaryColor : Theme.of(context).backgroundColor,
                          )
                      ),
                      alignment: Alignment.center,
                      child: _loadPage > 6
                          ? Icon(Icons.check, color: Theme.of(context).primaryColor,)
                          : TextWidget.fieldLabel(
                        "6",
                        fontSize: _pageNoSize,
                        textAlign: TextAlign.center,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 2,
                      ),
                    ),
                  ],
                ),
              ),
              ///   Progress Bar
              Container(
                child: Row(
                    children: [
                      Expanded(
                        flex: 16,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          width: _width,
                          height: 3.5,
                          color: _loadPage >= 1 ? Theme.of(context).primaryColor : Theme.of(context).backgroundColor,
                        ),
                      ),
                      Expanded(
                        flex: 16,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          width: _width,
                          height: 3.5,
                          color: _loadPage >= 2 ? Theme.of(context).primaryColor : Theme.of(context).backgroundColor,
                        ),
                      ),
                      Expanded(
                        flex: 16,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          width: _width,
                          height: 3.5,
                          color: _loadPage >= 3 ? Theme.of(context).primaryColor : Theme.of(context).backgroundColor,
                        ),
                      ),
                      Expanded(
                        flex: 16,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          width: _width,
                          height: 3.5,
                          color: _loadPage >= 4 ? Theme.of(context).primaryColor : Theme.of(context).backgroundColor,
                        ),
                      ),
                      Expanded(
                        flex: 16,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          width: _width,
                          height: 3.5,
                          color: _loadPage >= 5 ? Theme.of(context).primaryColor : Theme.of(context).backgroundColor,
                        ),
                      ),
                      Expanded(
                        flex: 16,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          width: _width,
                          height: 3.5,
                          color: _loadPage >= 6 ? Theme.of(context).primaryColor : Theme.of(context).backgroundColor,
                        ),
                      ),
                    ],
                ),
              ),
//              SizedBox(height: 5,),
//              Container(
//                width: double.infinity,
//                child: LinearProgressIndicator(
//                  //value: animation.value,
//                  //backgroundColor: Theme.of(context).primaryColor,
//                  valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
//                  value: progressValue,
//
//                ),
//              ),
            ],
          ),
        ],
      ),
    );
  }

  _loadNextPage(int pageNo) {
      setState(() {
        progressValue = 0.0906 * (_loadPage + pageNo);
        _loadPage = pageNo;

      });
  }
  // 1-1 ,2-3 ,3-5 ,4-7 ,5-9 ,6-11
  //(_loadPage + pageNo)  1-3 ,2-5 ,3-7
  //(_loadPage - pageNo)  1-1 ,2-1 ,3-1
  //(_loadPage - pageNo) - pageNo  1-2 ,2-3 ,3-4
  //(_loadPage + pageNo) - (_loadPage - pageNo) - (_loadPage - pageNo)  1-1 ,2-3 ,3-5
  _loadPreviousPage(int pageNo) {
    //print("($_loadPage , $pageNo) = ${(_loadPage + pageNo) - (_loadPage - pageNo) - (_loadPage - pageNo)}");
    setState(() {
      progressValue = 0.0906 * ((_loadPage + pageNo) - 2);
      _loadPage = pageNo;
    });
  }

  finishOnBoading() {
    Navigator.pop(context);
  }

  Future sleep() {
    return Future.delayed(const Duration(milliseconds: 2000), () => "3");
  }

  ///
//  void autoLoad() {
//    if(_loadPage > 6) {
//      _loadPage = 1;
//      sleep().then((value) {
//        if (value == "3") {
//          _loadNextPage(_loadPage);
//        }
//      });
//    } else {
//      sleep().then((value) {
//        if (value == "3") {
//          _loadNextPage(_loadPage+1);
//        }
//      });
//    }
//  }

  Page1() {
    return Stack(
      children: [
        ///   Page Body
        Container(
          padding: EdgeInsets.fromLTRB(0, 90, 0, 0),
          child: ListView(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Form(
                    key: _formPage1,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20,),
                          ///   Type of entry
                          TextWidget.fieldLabel(
                            "Type of entry",
                            fontSize: 25,
                            textAlign: TextAlign.start,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
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
                          ///   Company
                          GestureDetector(
                            onTap: () {setState(() {
                              _entryType = 1;
                            });},
                            child: Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1,color: _entryType == 1 ? Theme.of(context).primaryColor : Theme.of(context).accentColor),
                                color: _entryType == 1 ? Color.fromRGBO(81, 134, 237, 0.20) :  Theme.of(context).backgroundColor,
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                                    child: Text(
                                      "Company",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: _radioFontSize,
                                          fontWeight: FontWeight.bold,
                                          color: _entryType == 1 ? Colors.white : Color(0xff9C9EA5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          ///   Trust
                          GestureDetector(
                            onTap: () {setState(() {
                              _entryType = 2;
                            });},
                            child: Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1 ,color: _entryType == 2 ? Theme.of(context).primaryColor : Theme.of(context).accentColor),
                                color: _entryType == 2 ? Color.fromRGBO(81, 134, 237, 0.20) :  Theme.of(context).backgroundColor,
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                                    child: Text(
                                      "Trust",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: _radioFontSize,
                                          fontWeight: FontWeight.bold,
                                          color: _entryType == 2 ? Colors.white : Color(0xff9C9EA5)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          ///   Industry
                          GestureDetector(
                            onTap: () {setState(() {
                              _entryType = 3;
                            });},
                            child: Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1 ,color: _entryType == 3 ? Theme.of(context).primaryColor : Theme.of(context).accentColor),
                                color: _entryType == 3 ? Color.fromRGBO(81, 134, 237, 0.20) :  Theme.of(context).backgroundColor,
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                                    child: Text(
                                      "Industry",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: _radioFontSize,
                                          fontWeight: FontWeight.bold,
                                          color: _entryType == 3 ? Colors.white : Color(0xff9C9EA5)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),

//                          BlocBuilder<Bloc_main,int>(
//                              builder: (context, count) {
//                                return Text(
//                                  "$count",
//                                  textAlign: TextAlign.start,
//                                  overflow: TextOverflow.ellipsis,
//                                  style: TextStyle(
//                                      fontSize: 12,
//                                      fontWeight: FontWeight.bold,
//                                      color: Color(0xff9C9EA5)),
//                                );
//                              })
                        ],
                      ),
                    ),
                  ),
                ],
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
                  if (isLoading) _utils.showLoading(context) else GestureDetector(
                    onTap: () => _entryType == 0 ? null : _validateNdSavePage1(), //_loadNextPage(2),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 50.0,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Container(
                          padding: EdgeInsets.all(12.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: _entryType == 0 ? Color(0x5F5186ED) : Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Text(
                            "Next Step",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: _entryType == 0 ? Colors.grey : Colors.white,
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

  _validateNdSavePage1() {
    FocusScope.of(context).unfocus();
    if(_utils.isInternetAvailable() != null){ ///true
      //disableButton();
      if (_utils.isFormValid(_formPage1)){
        ///true
        //context.read<Bloc_main>().mapEventToState(PageChange.increment);
        _loadNextPage(2);

      }
    } else {
      onFailure("Not Connected to Internet");
      //enableButton();
    }
  }

  Page2() {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
          child: ListView(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            children: [
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Form(
                      key: _formPage2,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            ///  Back Buttton
                            GestureDetector(
                              onTap: () => _loadPreviousPage(1),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.arrow_back_ios,
                                    color: Theme.of(context).primaryColor,
                                    size: 16,
                                  ),
                                  SizedBox(width: 3,),
                                  TextWidget.fieldLabel(
                                    "Back",
                                    fontSize: 16,
                                    textAlign: TextAlign.start,
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20,),
                            ///   Info
                            TextWidget.fieldLabel(
                              "Info",
                              fontSize: 25,
                              textAlign: TextAlign.start,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
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
                            SizedBox(height: 20,),
                            ///   Installments
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
                                        "Installments",
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
                                          onSaved: (val) => _installments = val.trim(),
                                          validator: (value) => _utils.genrealTextValidation(value.trim()),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                            SizedBox(height: 20,),
                            ///   IRD Number
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
                                      padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                                      child: Text(
                                        "IRD Number",
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
                                          keyboardType: TextInputType.text,
                                          style: Theme.of(context).textTheme.bodyText1,
                                          textAlignVertical: TextAlignVertical.center,
                                          textAlign: TextAlign.end,
                                          decoration: InputDecoration.collapsed(
                                              hintText: "",
                                              hintStyle: TextStyle(color: Colors.grey)
                                          ),
                                          onSaved: (val) => _irdNumber = val.trim(),
                                          validator: (value) => _utils.genrealTextValidation(value.trim()),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                            SizedBox(height: 20,),
                            ///   Income Tax
                            Container(
                              width: double.infinity,
                              height: 50.0,
                              ///padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                              decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Text(
                                        "Income Tax",
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
                                          keyboardType: TextInputType.text,
                                          style: Theme.of(context).textTheme.bodyText1,
                                          textAlignVertical: TextAlignVertical.center,
                                          textAlign: TextAlign.end,
                                          decoration: InputDecoration.collapsed(
                                              hintText: "",
                                              hintStyle: TextStyle(color: Colors.grey)
                                          ),
                                          onSaved: (val) => _incomeTex = val.trim(),
                                          validator: (value) => _utils.genrealTextValidation(value.trim()),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                            SizedBox(height: 90,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ///   Next Step
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
                    onTap: () => _loadNextPage(3),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 50.0,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                              color: Colors.white,
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

  _validateNdSavePage2() {
    FocusScope.of(context).unfocus();
    if(_utils.isInternetAvailable() != null){
      if(_utils.isFormValid(_formPage2)){
        _loadNextPage(3);
      }
    } else {
      //onLoginFailure("Not Connected");
      //enableButton();
    }
  }

  Page3() {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
          child: ListView(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            children: [
              Form(
                key: _formPage3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    ///   Back
                    GestureDetector(
                      onTap: () => _loadPreviousPage(2),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            color: Theme.of(context).primaryColor,
                            size: 16,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          TextWidget.fieldLabel(
                            "Back",
                            fontSize: 16,
                            textAlign: TextAlign.start,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    ///   Verify identity
                    TextWidget.fieldLabel(
                      "Verify identity",
                      fontSize: 25,
                      textAlign: TextAlign.start,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(height: 15,),

                    TextWidget.fieldLabel(
                      "Description here",
                      fontSize: 18,
                      textAlign: TextAlign.start,
                      color: Color(0xff9C9EA5),
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(height: 35,),
                    ///   Given Name
                    Container(
                      width: double.infinity,
                      height: 50.0,
                      ///padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: Text(
                                "Given Name",
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
                                  keyboardType: TextInputType.text,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlignVertical: TextAlignVertical.center,
                                  textAlign: TextAlign.end,
                                  decoration: InputDecoration.collapsed(
                                      hintText: "",
                                      hintStyle: TextStyle(color: Colors.grey)
                                  ),
                                  onSaved: (val) => _gevName = val.trim(),
                                  validator: (value) => _utils.genrealTextValidation(value.trim()),
                                ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    ///   Middle Name
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
                              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                              child: Text(
                                "Middle Name",
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
                                      hintStyle: TextStyle(color: Colors.grey)
                                  ),
                                  onSaved: (val) => _midName = val.trim(),
                                  validator: (value) => _utils.genrealTextValidation(value.trim()),
                                ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    ///   Family Name
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
                              padding: EdgeInsets.all(12),
                              child: Text(
                                "Family Name",
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
                                  keyboardType: TextInputType.text,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlignVertical: TextAlignVertical.center,
                                  textAlign: TextAlign.end,
                                  decoration: InputDecoration.collapsed(
                                      hintText: "",
                                      hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                  onSaved: (val) => _famName = val.trim(),
                                  validator: (value) => _utils.genrealTextValidation(value.trim()),
                                ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    ///   Date of Birth
                    Container(
                      width: double.infinity,
                      height: 50.0,
                      ///padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: Text(
                                "Date of Birth",
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
                                  keyboardType: TextInputType.datetime,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlignVertical: TextAlignVertical.center,
                                  textAlign: TextAlign.end,
                                  decoration: InputDecoration.collapsed(
                                      hintText: "",
                                      hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                  onSaved: (val) => _dob = val.trim(),
                                  validator: (value) => _utils.genrealTextValidation(value.trim()),
                                ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    ///   Street
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
                              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                              child: Text(
                                "Street",
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
                                  keyboardType: TextInputType.text,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlignVertical: TextAlignVertical.center,
                                  textAlign: TextAlign.end,
                                  decoration: InputDecoration.collapsed(
                                      hintText: "",
                                      hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                  onSaved: (val) => _street = val.trim(),
                                  validator: (value) => _utils.genrealTextValidation(value.trim()),
                                ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    ///   Suburb
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
                              padding: EdgeInsets.all(12),
                              child: Text(
                                "Suburb",
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
                                  keyboardType: TextInputType.text,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlignVertical: TextAlignVertical.center,
                                  textAlign: TextAlign.end,
                                  decoration: InputDecoration.collapsed(
                                      hintText: "",
                                      hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                  onSaved: (val) => _suburb = val.trim(),
                                  validator: (value) => _utils.genrealTextValidation(value.trim()),
                                ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    ///   City
                    Container(
                      width: double.infinity,
                      height: 50.0,
                      ///padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: Text(
                                "City",
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
                                  keyboardType: TextInputType.text,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlignVertical: TextAlignVertical.center,
                                  textAlign: TextAlign.end,
                                  decoration: InputDecoration.collapsed(
                                      hintText: "",
                                      hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                  onSaved: (val) => _city = val.trim(),
                                  validator: (value) => _utils.genrealTextValidation(value.trim()),
                                ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    ///   Postcode
                    Container(
                      width: double.infinity,
                      height: 50.0,
                      ///padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                              child: Text(
                                "Postcode",
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
                                  onSaved: (val) => _postcode = val.trim(),
                                  validator: (value) => _utils.genrealTextValidation(value.trim()),
                                ),
                              ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40,),
                    ///   Dl or Passport
                    Container(
                      width: double.infinity,
                      height: 30,
                      ///padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      child: Row(
                        children: [
                          ///   Driving License
                          Expanded(
                            flex: 50,
                            child: GestureDetector(
                              onTap: () {setState(() {
                                _isDrivilingLicense = true;
                              });},
                              child: Container(
                                height: 30,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: _isDrivilingLicense ? Theme.of(context).primaryColor : Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                                child: Text(
                                  "Driving License",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: _fielsFontSize,
                                      fontWeight: FontWeight.bold,
                                      color: _isDrivilingLicense ? Colors.white : Color(0xff9C9EA5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ///   Passport
                          Expanded(
                            flex: 50,
                            child: GestureDetector(
                              onTap: () {setState(() {
                                _isDrivilingLicense = false;
                              });},
                              child: Container(
                                height: 30,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: !_isDrivilingLicense ? Theme.of(context).primaryColor : Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                                child: Text(
                                  "Passport",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: _fielsFontSize ,
                                    fontWeight: FontWeight.bold,
                                    color: !_isDrivilingLicense ? Colors.white : Color(0xff9C9EA5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    ///   Number
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
                              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                              child: Text(
                                "Number",
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
                                  keyboardType: TextInputType.text,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlignVertical: TextAlignVertical.center,
                                  textAlign: TextAlign.end,
                                  decoration: InputDecoration.collapsed(
                                      hintText: "",
                                      hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                  onSaved: (val) => _number = val.trim(),
                                  validator: (value) => _utils.genrealTextValidation(value.trim()),
                                ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    ///   Version
                    Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                              child: Text(
                                "Version",
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
                                  keyboardType: TextInputType.text,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlignVertical: TextAlignVertical.center,
                                  textAlign: TextAlign.end,
                                  decoration: InputDecoration.collapsed(
                                      hintText: "",
                                      hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                  onSaved: (val) => _version = val.trim(),
                                  validator: (value) => _utils.genrealTextValidation(value.trim()),
                                ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(height: 50,),
                    /// Next Step
                    Container(
                      child: Column(
                        children: [
                          isLoading
                              ? _utils.showLoading(context)
                              : GestureDetector(
                            onTap: () => _loadNextPage(4),
                            child: Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: 50.0,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
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
      ],
    );
  }
  Page4() {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
          child: ListView(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      ///   Back
                      GestureDetector(
                        onTap: () => _loadPreviousPage(3),
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              color: Theme.of(context).primaryColor,
                              size: 16,
                            ),
                            SizedBox(width: 3,),
                            TextWidget.fieldLabel(
                              "Back",
                              fontSize: 16,
                              textAlign: TextAlign.start,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      ///   Agreements
                      TextWidget.fieldLabel(
                        "Agreements",
                        fontSize: 25,
                        textAlign: TextAlign.start,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(height: 15,),

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
                          color: Theme.of(context).accentColor,
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
                                        fontSize: 13,
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
                      SizedBox(height: 20,),
                      ///   SOW
                      Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    "SOW",
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
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
                                  SizedBox(
                                    width: 12,
                                  ),
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
                                  SizedBox(
                                    width: 12,
                                  ),
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
                      SizedBox(height: 20,),
                      ///   Safe harbours
                      Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    "Safe harbours",
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
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
                                  SizedBox(
                                    width: 12,
                                  ),
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
                                  SizedBox(
                                    width: 12,
                                  ),
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
                      SizedBox(height: 20,),
                      ///   Cloud Check
                      Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    "Cloud Check",
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Container(
                                    height: 18,
                                    width: 18,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/user_check_icon.png"),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    "Verify",
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
                      SizedBox(height: 90,),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        ///   Next Step
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
                    onTap: () => _loadNextPage(5),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 50.0,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                              color: Colors.white,
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
  Page5() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: MediaQuery.of(context).size.height / 2.6,
          left: 0,
          right: 0,
          child: Column(
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
                child: Icon(Icons.access_time, color: Theme.of(context).primaryColor, size: 45,),
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
        ),
      ],
    );
  }
  Page6() {
    return Stack(
      children: [
        Positioned(
          top: MediaQuery.of(context).size.height / 2.6,
          left: 0,
          right: 0,
          child: Column(
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
                child: Icon(Icons.check, color: Theme.of(context).primaryColor, size: 45,),
              ),
              ///   Congratulations!
              SizedBox(height: 10,),
              TextWidget.fieldLabel(
                "Congratulations!",
                fontSize: 25,
                textAlign: TextAlign.start,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              ///  You’re account is now active.
              SizedBox(height: 10,),
              TextWidget.fieldLabel(
                "You’re account is now active.",
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
        ),
        ///   Start investing!
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
                    onTap: () => finishOnBoading(),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 50.0,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Container(
                          padding: EdgeInsets.all(12.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Text(
                            "Start investing!",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
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

  @override
  void onFailure(String msg) {
    _utils.showToast(msg, context);
  }

  @override
  void disableButton() {}

  @override
  void enableButton() {}




}



//          ///   body
//          _loadPage == 1
//              ? Stack(
//            children: [
//              ///   Page Body
//              Container(
//                padding: EdgeInsets.fromLTRB(0, 90, 0, 0),
//                child: ListView(
//                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
//                  children: [
//                    Column(
//                      mainAxisSize: MainAxisSize.max,
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: [
//                        Container(
//                          child: Column(
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: [
//                              SizedBox(height: 10,),
//                              ///   Type of entry
//                              TextWidget.fieldLabel(
//                                "Type of entry",
//                                fontSize: 25,
//                                textAlign: TextAlign.start,
//                                color: Colors.white,
//                                fontWeight: FontWeight.w700,
//                              ),
//                              SizedBox(height: 10,),
//                              ///   Description here
//                              TextWidget.fieldLabel(
//                                "Description here",
//                                fontSize: 18,
//                                textAlign: TextAlign.start,
//                                color: Color(0xff9C9EA5),
//                                fontWeight: FontWeight.w700,
//                              ),
//                              SizedBox(height: 20,),
//                              ///   Company
//                              Container(
//                                width: double.infinity,
//                                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
//                                height: 50.0,
//                                decoration: new BoxDecoration(
//                                  color: Theme.of(context).accentColor,
//                                  borderRadius: BorderRadius.circular(3.0),
//                                ),
//                                child: Row(
//                                  children: [
//                                    Expanded(
//                                      flex: 4,
//                                      child: Text(
//                                        "Company",
//                                        textAlign: TextAlign.start,
//                                        overflow: TextOverflow.ellipsis,
//                                        style: new TextStyle(
//                                            fontSize: 12,
//                                            fontWeight: FontWeight.bold,
//                                            color: Color(0xff9C9EA5)),
//                                      ),
//                                    ),
//                                    Flexible(
//                                        flex: 6,
//                                        child: TextFormField(
//                                          keyboardType: TextInputType.text,
//                                          style: Theme.of(context).textTheme.bodyText1,
//                                          textAlignVertical: TextAlignVertical.center,
//                                          textAlign: TextAlign.end,
//                                          decoration: InputDecoration.collapsed(
//                                              hintText: "",
//                                              hintStyle: TextStyle(color: Colors.grey),
//                                              //contentPadding: EdgeInsets.only(left: blockWidth * 5)
//                                          ),
//                                          onSaved: (val) {
//                                            //email = val.trim();
//                                          },
//                                          validator: (value) {
//                                            /*if (value.isEmpty || !value.contains("@")) {
//                                      return AppLocalizations.of(context).enter_valid_email;
//                                    }*/
//                                            return null;
//                                          },
//                                        ))
//                                  ],
//                                ),
//                              ),
//                              SizedBox(height: 20,),
//                              ///   Trust
//                              Container(
//                                width: double.infinity,
//                                height: 50.0,
//                                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
//                                decoration: new BoxDecoration(
//                                  color: Theme.of(context).accentColor,
//                                  borderRadius: BorderRadius.circular(3.0),
//                                ),
//                                child: Row(
//                                  children: [
//                                    Expanded(
//                                      flex: 4,
//                                      child: Text(
//                                        "Trust",
//                                        textAlign: TextAlign.start,
//                                        overflow: TextOverflow.ellipsis,
//                                        style: new TextStyle(
//                                            fontSize: 12,
//                                            fontWeight: FontWeight.bold,
//                                            color: Color(0xff9C9EA5)),
//                                      ),
//                                    ),
//                                    Flexible(
//                                        flex: 6,
//                                        child: TextFormField(
//                                          keyboardType: TextInputType.text,
//                                          style: Theme.of(context).textTheme.bodyText1,
//                                          textAlignVertical: TextAlignVertical.center,
//                                          textAlign: TextAlign.end,
//                                          decoration: InputDecoration.collapsed(
//                                              hintText: "",
//                                              hintStyle: TextStyle(color: Colors.grey)
//                                            // contentPadding:
//                                            //     EdgeInsets.only(left: blockWidth * 5)
//                                          ),
//                                          onSaved: (val) {
//                                            //email = val.trim();
//                                          },
//                                          validator: (value) {
//                                            /*if (value.isEmpty || !value.contains("@")) {
//                                      return AppLocalizations.of(context).enter_valid_email;
//                                    }*/
//                                            return null;
//                                          },
//                                        ))
//                                  ],
//                                ),
//                              ),
//                              SizedBox(height: 20,),
//                              ///   Industry
//                              Container(
//                                width: double.infinity,
//                                height: 50.0,
//                                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
//                                decoration: new BoxDecoration(
//                                  color: Theme.of(context).accentColor,
//                                  borderRadius: BorderRadius.circular(3.0),
//                                ),
//                                child: Row(
//                                  children: [
//                                    Expanded(
//                                      flex: 4,
//                                      child: Text(
//                                        "Industry",
//                                        textAlign: TextAlign.start,
//                                        overflow: TextOverflow.ellipsis,
//                                        style: new TextStyle(
//                                            fontSize: 12,
//                                            fontWeight: FontWeight.bold,
//                                            color: Color(0xff9C9EA5)),
//                                      ),
//                                    ),
//                                    Flexible(
//                                        flex: 6,
//                                        child: TextFormField(
//                                          keyboardType: TextInputType.text,
//                                          style: Theme.of(context).textTheme.bodyText1,
//                                          textAlignVertical: TextAlignVertical.center,
//                                          textAlign: TextAlign.end,
//                                          decoration: InputDecoration.collapsed(
//                                              hintText: "",
//                                              hintStyle: TextStyle(color: Colors.grey)
//                                            // contentPadding:
//                                            //     EdgeInsets.only(left: blockWidth * 5)
//                                          ),
//                                          onSaved: (val) {
//                                            //email = val.trim();
//                                          },
//                                          validator: (value) {
//                                            /*if (value.isEmpty || !value.contains("@")) {
//                                      return AppLocalizations.of(context).enter_valid_email;
//                                    }*/
//                                            return null;
//                                          },
//                                        ))
//                                  ],
//                                ),
//                              ),
//                              SizedBox(height: 20,),
//                            ],
//                          ),
//                        ),
//                      ],
//                    ),
//                  ],
//                ),
//              ),
//              ///   Next Page
//              Positioned(
//                bottom: 0,right: 0,left: 0,
//                child: Padding(
//                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                  child: Container(
//                    child: Column(
//                      children: [
//                        isLoading
//                            ? SpinKitCircle(
//                          color: Theme.of(context).primaryColor,
//                          size: 35.0,
//                        )
//                            : GestureDetector(
//                          onTap: () => _loadNextPage(2),
//                          child: Container(
//                            alignment: Alignment.center,
//                            width: double.infinity,
//                            child: Padding(
//                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
//                              child: Container(
//                                padding: EdgeInsets.all(12.0),
//                                alignment: Alignment.center,
//                                decoration: BoxDecoration(
//                                  color: Theme.of(context).primaryColor,
//                                  borderRadius: BorderRadius.circular(3),
//                                ),
//                                child: Text(
//                                  "Next Step",
//                                  style: TextStyle(
//                                    fontSize: 16.0,
//                                    fontWeight: FontWeight.w600,
//                                    color: Colors.white,
//                                  ),
//                                ),
//                              ),
//                            ),
//                          ),
//                        ),
//                        SizedBox(
//                          height: 25,
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//              ),
//            ],
//          )
//              : Container(),
//
//          _loadPage == 2
//              ? Stack(
//            children: [
//              Container(
//                padding: EdgeInsets.fromLTRB(0, 90, 0, 0),
//                child: ListView(
//                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
//                  children: [
//                    Container(
//
//                      child: Column(
//                        mainAxisSize: MainAxisSize.max,
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: [
//                          Container(
//                            child: Column(
//                              crossAxisAlignment: CrossAxisAlignment.start,
//                              children: [
//                                ///  Back Buttton
//                                GestureDetector(
//                                  onTap: () => _loadPreviousPage(1),
//                                  child: Row(
//                                    children: [
//                                      Icon(
//                                        Icons.arrow_back_ios,
//                                        color: Theme
//                                            .of(context)
//                                            .primaryColor,
//                                        size: 16,
//                                      ),
//                                      SizedBox(
//                                        width: 3,
//                                      ),
//                                      TextWidget.fieldLabel(
//                                        "Back",
//                                        fontSize: 16,
//                                        textAlign: TextAlign.start,
//                                        color: Theme
//                                            .of(context)
//                                            .primaryColor,
//                                        fontWeight: FontWeight.w700,
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                                SizedBox(
//                                  height: 10,
//                                ),
//                                ///   Info
//                                TextWidget.fieldLabel(
//                                  "Info",
//                                  fontSize: 25,
//                                  textAlign: TextAlign.start,
//                                  color: Colors.white,
//                                  fontWeight: FontWeight.w700,
//                                ),
//                                SizedBox(
//                                  height: 10,
//                                ),
//                                ///   Description here
//                                TextWidget.fieldLabel(
//                                  "Description here",
//                                  fontSize: 18,
//                                  textAlign: TextAlign.start,
//                                  color: Color(0xff9C9EA5),
//                                  fontWeight: FontWeight.w700,
//                                ),
//                                SizedBox(
//                                  height: 20,
//                                ),
//                                ///   Amount (NZD)
//                                Container(
//                                  width: double.infinity,
//                                  height: 50.0,
//                                  padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
//                                  decoration: new BoxDecoration(
//                                    color: Theme
//                                        .of(context)
//                                        .accentColor,
//                                    borderRadius: BorderRadius.circular(3.0),
//                                  ),
//                                  child: Row(
//                                    children: [
//                                      Expanded(
//                                        flex: 4,
//                                        child: Text(
//                                          "Amount (NZD)",
//                                          textAlign: TextAlign.start,
//                                          overflow: TextOverflow.ellipsis,
//                                          style: new TextStyle(
//                                              fontSize: 12,
//                                              fontWeight: FontWeight.bold,
//                                              color: Color(0xff9C9EA5)),
//                                        ),
//                                      ),
//                                      Flexible(
//                                          flex: 6,
//                                          child: TextFormField(
//                                            keyboardType: TextInputType.number,
//                                            style: Theme.of(context).textTheme.bodyText1,
//                                            textAlignVertical: TextAlignVertical.center,
//                                            textAlign: TextAlign.end,
//                                            decoration: InputDecoration.collapsed(
//                                                hintText: "",
//                                                hintStyle: TextStyle(color: Colors.grey)
//                                              // contentPadding:
//                                              //     EdgeInsets.only(left: blockWidth * 5)
//                                            ),
//                                            onSaved: (val) {
//                                              //email = val.trim();
//                                            },
//                                            validator: (value) {
//                                              /*if (value.isEmpty || !value.contains("@")) {
//                                          return AppLocalizations.of(context).enter_valid_email;
//                                        }*/
//                                              return null;
//                                            },
//                                          ))
//                                    ],
//                                  ),
//                                ),
//                                SizedBox(
//                                  height: 20,
//                                ),
//                                ///   Installments
//                                Container(
//                                  width: double.infinity,
//                                  height: 50.0,
//                                  padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
//                                  decoration: new BoxDecoration(
//                                    color: Theme.of(context).accentColor,
//                                    borderRadius: BorderRadius.circular(3.0),
//                                  ),
//                                  child: Row(
//                                    children: [
//                                      Expanded(
//                                        flex: 4,
//                                        child: Text(
//                                          "Installments",
//                                          textAlign: TextAlign.start,
//                                          overflow: TextOverflow.ellipsis,
//                                          style: new TextStyle(
//                                              fontSize: 12,
//                                              fontWeight: FontWeight.bold,
//                                              color: Color(0xff9C9EA5)),
//                                        ),
//                                      ),
//                                      Flexible(
//                                          flex: 6,
//                                          child: TextFormField(
//                                            keyboardType: TextInputType.number,
//                                            style: Theme.of(context).textTheme.bodyText1,
//                                            textAlignVertical: TextAlignVertical.center,
//                                            textAlign: TextAlign.end,
//                                            decoration: InputDecoration.collapsed(
//                                                hintText: "",
//                                                hintStyle: TextStyle(color: Colors.grey)
//                                              // contentPadding:
//                                              //     EdgeInsets.only(left: blockWidth * 5)
//                                            ),
//                                            onSaved: (val) {
//                                              //email = val.trim();
//                                            },
//                                            validator: (value) {
//                                              /*if (value.isEmpty || !value.contains("@")) {
//                                          return AppLocalizations.of(context).enter_valid_email;
//                                        }*/
//                                              return null;
//                                            },
//                                          ))
//                                    ],
//                                  ),
//                                ),
//                                SizedBox(
//                                  height: 20,
//                                ),
//                                ///   IRD Number
//                                Container(
//                                  width: double.infinity,
//                                  height: 50.0,
//                                  padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
//                                  decoration: new BoxDecoration(
//                                    color: Theme.of(context).accentColor,
//                                    borderRadius: BorderRadius.circular(3.0),
//                                  ),
//                                  child: Row(
//                                    children: [
//                                      Expanded(
//                                        flex: 4,
//                                        child: Text(
//                                          "IRD Number",
//                                          textAlign: TextAlign.start,
//                                          overflow: TextOverflow.ellipsis,
//                                          style: new TextStyle(
//                                              fontSize: 12,
//                                              fontWeight: FontWeight.bold,
//                                              color: Color(0xff9C9EA5)),
//                                        ),
//                                      ),
//                                      Flexible(
//                                          flex: 6,
//                                          child: TextFormField(
//                                            keyboardType: TextInputType.text,
//                                            style: Theme.of(context).textTheme.bodyText1,
//                                            textAlignVertical: TextAlignVertical.center,
//                                            textAlign: TextAlign.end,
//                                            decoration: InputDecoration.collapsed(
//                                                hintText: "",
//                                                hintStyle: TextStyle(color: Colors.grey)
//                                              // contentPadding:
//                                              //     EdgeInsets.only(left: blockWidth * 5)
//                                            ),
//                                            onSaved: (val) {
//                                              //email = val.trim();
//                                            },
//                                            validator: (value) {
//                                              /*if (value.isEmpty || !value.contains("@")) {
//                                          return AppLocalizations.of(context).enter_valid_email;
//                                        }*/
//                                              return null;
//                                            },
//                                          ))
//                                    ],
//                                  ),
//                                ),
//                                SizedBox(
//                                  height: 20,
//                                ),
//                                ///   Income Tax
//                                Container(
//                                  width: double.infinity,
//                                  height: 50.0,
//                                  padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
//                                  decoration: new BoxDecoration(
//                                    color: Theme.of(context).accentColor,
//                                    borderRadius: BorderRadius.circular(3.0),
//                                  ),
//                                  child: Row(
//                                    children: [
//                                      Expanded(
//                                        flex: 4,
//                                        child: Text(
//                                          "Income Tax",
//                                          textAlign: TextAlign.start,
//                                          overflow: TextOverflow.ellipsis,
//                                          style: new TextStyle(
//                                              fontSize: 12,
//                                              fontWeight: FontWeight.bold,
//                                              color: Color(0xff9C9EA5)),
//                                        ),
//                                      ),
//                                      Flexible(
//                                          flex: 6,
//                                          child: TextFormField(
//                                            keyboardType: TextInputType.text,
//                                            style: Theme.of(context).textTheme.bodyText1,
//                                            textAlignVertical: TextAlignVertical.center,
//                                            textAlign: TextAlign.end,
//                                            decoration: InputDecoration.collapsed(
//                                                hintText: "",
//                                                hintStyle: TextStyle(color: Colors.grey)
//                                              // contentPadding:
//                                              //     EdgeInsets.only(left: blockWidth * 5)
//                                            ),
//                                            onSaved: (val) {
//                                              //email = val.trim();
//                                            },
//                                            validator: (value) {
//                                              /*if (value.isEmpty || !value.contains("@")) {
//                                          return AppLocalizations.of(context).enter_valid_email;
//                                        }*/
//                                              return null;
//                                            },
//                                          ))
//                                    ],
//                                  ),
//                                ),
//                                SizedBox(
//                                  height: 20,
//                                ),
//                              ],
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//              ///   Next Step
//              Positioned(
//                bottom: 0,right: 0,left: 0,
//                child: Padding(
//                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                  child: Container(
//                    child: Column(
//                      children: [
//                        isLoading
//                            ? SpinKitCircle(
//                          color: Theme.of(context).primaryColor,
//                          size: 35.0,
//                        )
//                            : GestureDetector(
//                          onTap: () => _loadNextPage(3),
//                          child: Container(
//                            alignment: Alignment.center,
//                            width: double.infinity,
//                            child: Padding(
//                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
//                              child: Container(
//                                padding: EdgeInsets.all(12.0),
//                                alignment: Alignment.center,
//                                decoration: BoxDecoration(
//                                  color: Theme.of(context).primaryColor,
//                                  borderRadius: BorderRadius.circular(3),
//                                ),
//                                child: Text(
//                                  "Next Step",
//                                  style: TextStyle(
//                                    fontSize: 16.0,
//                                    fontWeight: FontWeight.w600,
//                                    color: Colors.white,
//                                  ),
//                                ),
//                              ),
//                            ),
//                          ),
//                        ),
//                        SizedBox(
//                          height: 25,
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//              ),
//            ],
//          )
//              : Container(),
//
//          _loadPage == 3
//              ? Stack(
//            children: [
//              Container(
//                padding: EdgeInsets.fromLTRB(0, 90, 0, 0),
//                child: ListView(
//                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
//                  children: [
//                    Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: [
//                        ///   Back
//                        GestureDetector(
//                          onTap: () => _loadPreviousPage(2),
//                          child: Row(
//                            children: [
//                              Icon(
//                                Icons.arrow_back_ios,
//                                color: Theme.of(context).primaryColor,
//                                size: 16,
//                              ),
//                              SizedBox(
//                                width: 3,
//                              ),
//                              TextWidget.fieldLabel(
//                                "Back",
//                                fontSize: 16,
//                                textAlign: TextAlign.start,
//                                color: Theme.of(context).primaryColor,
//                                fontWeight: FontWeight.w700,
//                              ),
//                            ],
//                          ),
//                        ),
//                        SizedBox(
//                          height: 10,
//                        ),
//                        ///   Verify identity
//                        TextWidget.fieldLabel(
//                          "Verify identity",
//                          fontSize: 25,
//                          textAlign: TextAlign.start,
//                          color: Colors.white,
//                          fontWeight: FontWeight.w700,
//                        ),
//                        SizedBox(
//                          height: 10,
//                        ),
//
//                        TextWidget.fieldLabel(
//                          "Description here",
//                          fontSize: 18,
//                          textAlign: TextAlign.start,
//                          color: Color(0xff9C9EA5),
//                          fontWeight: FontWeight.w700,
//                        ),
//                        SizedBox(
//                          height: 20,
//                        ),
//                        ///   Given Name
//                        Container(
//                          width: double.infinity,
//                          height: 50.0,
//                          padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
//                          decoration: new BoxDecoration(
//                            color: Theme.of(context).accentColor,
//                            borderRadius: BorderRadius.circular(3.0),
//                          ),
//                          child: Row(
//                            children: [
//                              Expanded(
//                                flex: 4,
//                                child: Text(
//                                  "Given Name",
//                                  textAlign: TextAlign.start,
//                                  overflow: TextOverflow.ellipsis,
//                                  style: new TextStyle(
//                                      fontSize: 12,
//                                      fontWeight: FontWeight.bold,
//                                      color: Color(0xff9C9EA5)),
//                                ),
//                              ),
//                              Flexible(
//                                  flex: 6,
//                                  child: TextFormField(
//                                    keyboardType: TextInputType.text,
//                                    style: Theme.of(context).textTheme.bodyText1,
//                                    textAlignVertical: TextAlignVertical.center,
//                                    textAlign: TextAlign.end,
//                                    decoration: InputDecoration.collapsed(
//                                        hintText: "",
//                                        hintStyle: TextStyle(color: Colors.grey)
//                                      // contentPadding:
//                                      //     EdgeInsets.only(left: blockWidth * 5)
//                                    ),
//                                    onSaved: (val) {
//                                      //email = val.trim();
//                                    },
//                                    validator: (value) {
//                                      /*if (value.isEmpty || !value.contains("@")) {
//                                        return AppLocalizations.of(context).enter_valid_email;
//                                      }*/
//                                      return null;
//                                    },
//                                  ))
//                            ],
//                          ),
//                        ),
//                        SizedBox(height: 20,),
//                        ///   Middle Name
//                        Container(
//                          width: double.infinity,
//                          height: 50.0,
//                          padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
//                          decoration: new BoxDecoration(
//                            color: Theme.of(context).accentColor,
//                            borderRadius: BorderRadius.circular(3.0),
//                          ),
//                          child: Row(
//                            children: [
//                              Expanded(
//                                flex: 4,
//                                child: Text(
//                                  "Middle Name",
//                                  textAlign: TextAlign.start,
//                                  overflow: TextOverflow.ellipsis,
//                                  style: new TextStyle(
//                                      fontSize: 12,
//                                      fontWeight: FontWeight.bold,
//                                      color: Color(0xff9C9EA5)),
//                                ),
//                              ),
//                              Flexible(
//                                  flex: 6,
//                                  child: TextFormField(
//                                    keyboardType: TextInputType.text,
//                                    style: Theme.of(context).textTheme.bodyText1,
//                                    textAlignVertical: TextAlignVertical.center,
//                                    textAlign: TextAlign.end,
//                                    decoration: InputDecoration.collapsed(
//                                        hintText: "",
//                                        hintStyle: TextStyle(color: Colors.grey)
//                                      // contentPadding:
//                                      //     EdgeInsets.only(left: blockWidth * 5)
//                                    ),
//                                    onSaved: (val) {
//                                      //email = val.trim();
//                                    },
//                                    validator: (value) {
//                                      /*if (value.isEmpty || !value.contains("@")) {
//                                        return AppLocalizations.of(context).enter_valid_email;
//                                      }*/
//                                      return null;
//                                    },
//                                  ))
//                            ],
//                          ),
//                        ),
//                        SizedBox(height: 20,),
//                        ///   Family Name
//                        Container(
//                          width: double.infinity,
//                          height: 50.0,
//                          padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
//                          decoration: new BoxDecoration(
//                            color: Theme.of(context).accentColor,
//                            borderRadius: BorderRadius.circular(3.0),
//                          ),
//                          child: Row(
//                            children: [
//                              Expanded(
//                                flex: 4,
//                                child: Text(
//                                  "Family Name",
//                                  textAlign: TextAlign.start,
//                                  overflow: TextOverflow.ellipsis,
//                                  style: new TextStyle(
//                                      fontSize: 12,
//                                      fontWeight: FontWeight.bold,
//                                      color: Color(0xff9C9EA5)),
//                                ),
//                              ),
//                              Flexible(
//                                  flex: 6,
//                                  child: TextFormField(
//                                    keyboardType: TextInputType.text,
//                                    style: Theme.of(context).textTheme.bodyText1,
//                                    textAlignVertical: TextAlignVertical.center,
//                                    textAlign: TextAlign.end,
//                                    decoration: InputDecoration.collapsed(
//                                        hintText: "",
//                                        hintStyle: TextStyle(color: Colors.grey)
//                                      // contentPadding:
//                                      //     EdgeInsets.only(left: blockWidth * 5)
//                                    ),
//                                    onSaved: (val) {
//                                      //email = val.trim();
//                                    },
//                                    validator: (value) {
//                                      /*if (value.isEmpty || !value.contains("@")) {
//                                        return AppLocalizations.of(context).enter_valid_email;
//                                      }*/
//                                      return null;
//                                    },
//                                  ))
//                            ],
//                          ),
//                        ),
//                        SizedBox(height: 20,),
//                        ///   Date of Birth
//                        Container(
//                          width: double.infinity,
//                          height: 50.0,
//                          padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
//                          decoration: new BoxDecoration(
//                            color: Theme.of(context).accentColor,
//                            borderRadius: BorderRadius.circular(3.0),
//                          ),
//                          child: Row(
//                            children: [
//                              Expanded(
//                                flex: 4,
//                                child: Text(
//                                  "Date of Birth",
//                                  textAlign: TextAlign.start,
//                                  overflow: TextOverflow.ellipsis,
//                                  style: new TextStyle(
//                                      fontSize: 12,
//                                      fontWeight: FontWeight.bold,
//                                      color: Color(0xff9C9EA5)),
//                                ),
//                              ),
//                              Flexible(
//                                  flex: 6,
//                                  child: TextFormField(
//                                    keyboardType: TextInputType.datetime,
//                                    style: Theme.of(context).textTheme.bodyText1,
//                                    textAlignVertical: TextAlignVertical.center,
//                                    textAlign: TextAlign.end,
//                                    decoration: InputDecoration.collapsed(
//                                        hintText: "",
//                                        hintStyle: TextStyle(color: Colors.grey)
//                                      // contentPadding:
//                                      //     EdgeInsets.only(left: blockWidth * 5)
//                                    ),
//                                    onSaved: (val) {
//                                      //email = val.trim();
//                                    },
//                                    validator: (value) {
//                                      /*if (value.isEmpty || !value.contains("@")) {
//                                        return AppLocalizations.of(context).enter_valid_email;
//                                      }*/
//                                      return null;
//                                    },
//                                  ))
//                            ],
//                          ),
//                        ),
//                        SizedBox(height: 20,),
//                        ///   Street
//                        Container(
//                          width: double.infinity,
//                          height: 50.0,
//                          padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
//                          decoration: new BoxDecoration(
//                            color: Theme.of(context).accentColor,
//                            borderRadius: BorderRadius.circular(3.0),
//                          ),
//                          child: Row(
//                            children: [
//                              Expanded(
//                                flex: 4,
//                                child: Text(
//                                  "Street",
//                                  textAlign: TextAlign.start,
//                                  overflow: TextOverflow.ellipsis,
//                                  style: new TextStyle(
//                                      fontSize: 12,
//                                      fontWeight: FontWeight.bold,
//                                      color: Color(0xff9C9EA5)),
//                                ),
//                              ),
//                              Flexible(
//                                  flex: 6,
//                                  child: TextFormField(
//                                    keyboardType: TextInputType.text,
//                                    style: Theme.of(context).textTheme.bodyText1,
//                                    textAlignVertical: TextAlignVertical.center,
//                                    textAlign: TextAlign.end,
//                                    decoration: InputDecoration.collapsed(
//                                        hintText: "",
//                                        hintStyle: TextStyle(color: Colors.grey)
//                                      // contentPadding:
//                                      //     EdgeInsets.only(left: blockWidth * 5)
//                                    ),
//                                    onSaved: (val) {
//                                      //email = val.trim();
//                                    },
//                                    validator: (value) {
//                                      /*if (value.isEmpty || !value.contains("@")) {
//                                        return AppLocalizations.of(context).enter_valid_email;
//                                      }*/
//                                      return null;
//                                    },
//                                  ))
//                            ],
//                          ),
//                        ),
//                        SizedBox(height: 20,),
//                        ///   Suburb
//                        Container(
//                          width: double.infinity,
//                          height: 50.0,
//                          padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
//                          decoration: new BoxDecoration(
//                            color: Theme.of(context).accentColor,
//                            borderRadius: BorderRadius.circular(3.0),
//                          ),
//                          child: Row(
//                            children: [
//                              Expanded(
//                                flex: 4,
//                                child: Text(
//                                  "Suburb",
//                                  textAlign: TextAlign.start,
//                                  overflow: TextOverflow.ellipsis,
//                                  style: new TextStyle(
//                                      fontSize: 12,
//                                      fontWeight: FontWeight.bold,
//                                      color: Color(0xff9C9EA5)),
//                                ),
//                              ),
//                              Flexible(
//                                  flex: 6,
//                                  child: TextFormField(
//                                    keyboardType: TextInputType.text,
//                                    style: Theme.of(context).textTheme.bodyText1,
//                                    textAlignVertical: TextAlignVertical.center,
//                                    textAlign: TextAlign.end,
//                                    decoration: InputDecoration.collapsed(
//                                        hintText: "",
//                                        hintStyle: TextStyle(color: Colors.grey)
//                                      // contentPadding:
//                                      //     EdgeInsets.only(left: blockWidth * 5)
//                                    ),
//                                    onSaved: (val) {
//                                      //email = val.trim();
//                                    },
//                                    validator: (value) {
//                                      /*if (value.isEmpty || !value.contains("@")) {
//                                        return AppLocalizations.of(context).enter_valid_email;
//                                      }*/
//                                      return null;
//                                    },
//                                  ))
//                            ],
//                          ),
//                        ),
//                        SizedBox(height: 20,),
//                        ///   City
//                        Container(
//                          width: double.infinity,
//                          height: 50.0,
//                          padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
//                          decoration: new BoxDecoration(
//                            color: Theme.of(context).accentColor,
//                            borderRadius: BorderRadius.circular(3.0),
//                          ),
//                          child: Row(
//                            children: [
//                              Expanded(
//                                flex: 4,
//                                child: Text(
//                                  "City",
//                                  textAlign: TextAlign.start,
//                                  overflow: TextOverflow.ellipsis,
//                                  style: new TextStyle(
//                                      fontSize: 12,
//                                      fontWeight: FontWeight.bold,
//                                      color: Color(0xff9C9EA5)),
//                                ),
//                              ),
//                              Flexible(
//                                  flex: 6,
//                                  child: TextFormField(
//                                    keyboardType: TextInputType.text,
//                                    style: Theme.of(context).textTheme.bodyText1,
//                                    textAlignVertical: TextAlignVertical.center,
//                                    textAlign: TextAlign.end,
//                                    decoration: InputDecoration.collapsed(
//                                        hintText: "",
//                                        hintStyle: TextStyle(color: Colors.grey)
//                                      // contentPadding:
//                                      //     EdgeInsets.only(left: blockWidth * 5)
//                                    ),
//                                    onSaved: (val) {
//                                      //email = val.trim();
//                                    },
//                                    validator: (value) {
//                                      /*if (value.isEmpty || !value.contains("@")) {
//                                        return AppLocalizations.of(context).enter_valid_email;
//                                      }*/
//                                      return null;
//                                    },
//                                  ))
//                            ],
//                          ),
//                        ),
//                        SizedBox(height: 20,),
//                        ///   Postcode
//                        Container(
//                          width: double.infinity,
//                          height: 50.0,
//                          padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
//                          decoration: new BoxDecoration(
//                            color: Theme.of(context).accentColor,
//                            borderRadius: BorderRadius.circular(3.0),
//                          ),
//                          child: Row(
//                            children: [
//                              Expanded(
//                                flex: 4,
//                                child: Text(
//                                  "Postcode",
//                                  textAlign: TextAlign.start,
//                                  overflow: TextOverflow.ellipsis,
//                                  style: new TextStyle(
//                                      fontSize: 12,
//                                      fontWeight: FontWeight.bold,
//                                      color: Color(0xff9C9EA5)),
//                                ),
//                              ),
//                              Flexible(
//                                  flex: 6,
//                                  child: TextFormField(
//                                    keyboardType: TextInputType.number,
//                                    style: Theme.of(context).textTheme.bodyText1,
//                                    textAlignVertical: TextAlignVertical.center,
//                                    textAlign: TextAlign.end,
//                                    decoration: InputDecoration.collapsed(
//                                        hintText: "",
//                                        hintStyle: TextStyle(color: Colors.grey)
//                                      // contentPadding:
//                                      //     EdgeInsets.only(left: blockWidth * 5)
//                                    ),
//                                    onSaved: (val) {
//                                      //email = val.trim();
//                                    },
//                                    validator: (value) {
//                                      /*if (value.isEmpty || !value.contains("@")) {
//                                        return AppLocalizations.of(context).enter_valid_email;
//                                      }*/
//                                      return null;
//                                    },
//                                  ))
//                            ],
//                          ),
//                        ),
//                        SizedBox(height: 20,),
//                        ///   Number
//                        Container(
//                          width: double.infinity,
//                          height: 50.0,
//                          padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
//                          decoration: new BoxDecoration(
//                            color: Theme.of(context).accentColor,
//                            borderRadius: BorderRadius.circular(3.0),
//                          ),
//                          child: Row(
//                            children: [
//                              Expanded(
//                                flex: 4,
//                                child: Text(
//                                  "Number",
//                                  textAlign: TextAlign.start,
//                                  overflow: TextOverflow.ellipsis,
//                                  style: new TextStyle(
//                                      fontSize: 12,
//                                      fontWeight: FontWeight.bold,
//                                      color: Color(0xff9C9EA5)),
//                                ),
//                              ),
//                              Flexible(
//                                  flex: 6,
//                                  child: TextFormField(
//                                    keyboardType: TextInputType.phone,
//                                    style: Theme.of(context).textTheme.bodyText1,
//                                    textAlignVertical: TextAlignVertical.center,
//                                    textAlign: TextAlign.end,
//                                    decoration: InputDecoration.collapsed(
//                                        hintText: "",
//                                        hintStyle: TextStyle(color: Colors.grey)
//                                    ),
//                                    onSaved: (val) {
//                                      //email = val.trim();
//                                    },
//                                    validator: (value) {
//                                      /*if (value.isEmpty || !value.contains("@")) {
//                                        return AppLocalizations.of(context).enter_valid_email;
//                                      }*/
//                                      return null;
//                                    },
//                                  ))
//                            ],
//                          ),
//                        ),
//                        SizedBox(height: 20,),
//                        ///   Version
//                        Container(
//                          width: double.infinity,
//                          height: 50.0,
//                          padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
//                          decoration: new BoxDecoration(
//                            color: Theme.of(context).accentColor,
//                            borderRadius: BorderRadius.circular(3.0),
//                          ),
//                          child: Row(
//                            children: [
//                              Expanded(
//                                flex: 4,
//                                child: Text(
//                                  "Version",
//                                  textAlign: TextAlign.start,
//                                  overflow: TextOverflow.ellipsis,
//                                  style: new TextStyle(
//                                      fontSize: 12,
//                                      fontWeight: FontWeight.bold,
//                                      color: Color(0xff9C9EA5)),
//                                ),
//                              ),
//                              Flexible(
//                                  flex: 6,
//                                  child: TextFormField(
//                                    keyboardType: TextInputType.text,
//                                    style: Theme.of(context).textTheme.bodyText1,
//                                    textAlignVertical: TextAlignVertical.center,
//                                    textAlign: TextAlign.end,
//                                    decoration: InputDecoration.collapsed(
//                                        hintText: "",
//                                        hintStyle: TextStyle(color: Colors.grey)
//                                      // contentPadding:
//                                      //     EdgeInsets.only(left: blockWidth * 5)
//                                    ),
//                                    onSaved: (val) {
//                                      //email = val.trim();
//                                    },
//                                    validator: (value) {
//                                      /*if (value.isEmpty || !value.contains("@")) {
//                                        return AppLocalizations.of(context).enter_valid_email;
//                                      }*/
//                                      return null;
//                                    },
//                                  ))
//                            ],
//                          ),
//                        ),
//                        SizedBox(height: 20,),
//                        /// Next Step
//                        Container(
//                          child: Column(
//                            children: [
//                              isLoading
//                                  ? SpinKitCircle(
//                                color: Theme.of(context).primaryColor,
//                                size: 35.0,
//                              )
//                                  : GestureDetector(
//                                      onTap: () => _loadNextPage(4),
//                                      child: Container(
//                                        alignment: Alignment.center,
//                                        width: double.infinity,
//                                        child: Padding(
//                                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
//                                          child: Container(
//                                            padding: EdgeInsets.all(12.0),
//                                            alignment: Alignment.center,
//                                            decoration: BoxDecoration(
//                                              color: Theme.of(context).primaryColor,
//                                              borderRadius: BorderRadius.circular(3),
//                                            ),
//                                            child: Text(
//                                              "Next Step",
//                                              style: TextStyle(
//                                                fontSize: 16.0,
//                                                fontWeight: FontWeight.w600,
//                                                color: Colors.white,
//                                              ),
//                                            ),
//                                          ),
//                                        ),
//                                      ),
//                                    ),
//                              SizedBox(
//                                height: 25,
//                              ),
//                            ],
//                          ),
//                        ),
//                      ],
//                    ),
//                  ],
//                ),
//              ),
//              ///
////              Positioned(
////                bottom: 0,right: 0,left: 0,
////                child: Padding(
////                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
////                  child: Container(
////                    child: Column(
////                      children: [
////                        isLoading
////                            ? SpinKitCircle(
////                          color: Theme.of(context).primaryColor,
////                          size: 35.0,
////                        )
////                            : GestureDetector(
////                          onTap: () => _loadNextPage(4),
////                          child: Container(
////                            alignment: Alignment.center,
////                            width: double.infinity,
////                            child: Padding(
////                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
////                              child: Container(
////                                padding: EdgeInsets.all(12.0),
////                                alignment: Alignment.center,
////                                decoration: BoxDecoration(
////                                  color: Theme.of(context).primaryColor,
////                                  borderRadius: BorderRadius.circular(3),
////                                ),
////                                child: Text(
////                                  "Next Step",
////                                  style: TextStyle(
////                                    fontSize: 16.0,
////                                    fontWeight: FontWeight.w600,
////                                    color: Colors.white,
////                                  ),
////                                ),
////                              ),
////                            ),
////                          ),
////                        ),
////                        SizedBox(
////                          height: 25,
////                        ),
////                      ],
////                    ),
////                  ),
////                ),
////              ),
//            ],
//          )
//              : Container(),
//
//          _loadPage == 4
//              ? Stack(
//            children: [
//              Container(
//                padding: EdgeInsets.fromLTRB(0, 90, 0, 0),
//                child: ListView(
//                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
//                  children: [
//                    Column(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: [
//                        Column(
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          children: [
//                            ///   Back
//                            GestureDetector(
//                              onTap: () => _loadPreviousPage(3),
//                              child: Row(
//                                children: [
//                                  Icon(
//                                    Icons.arrow_back_ios,
//                                    color: Theme.of(context).primaryColor,
//                                    size: 16,
//                                  ),
//                                  SizedBox(
//                                    width: 3,
//                                  ),
//                                  TextWidget.fieldLabel(
//                                    "Back",
//                                    fontSize: 16,
//                                    textAlign: TextAlign.start,
//                                    color: Theme.of(context).primaryColor,
//                                    fontWeight: FontWeight.w700,
//                                  ),
//                                ],
//                              ),
//                            ),
//                            SizedBox(
//                              height: 10,
//                            ),
//
//                            ///   Agreements
//                            TextWidget.fieldLabel(
//                              "Agreements",
//                              fontSize: 25,
//                              textAlign: TextAlign.start,
//                              color: Colors.white,
//                              fontWeight: FontWeight.w700,
//                            ),
//
//                            SizedBox(
//                              height: 10,
//                            ),
//                            TextWidget.fieldLabel(
//                              "Description here",
//                              fontSize: 18,
//                              textAlign: TextAlign.start,
//                              color: Color(0xff9C9EA5),
//                              fontWeight: FontWeight.w700,
//                            ),
//
//                            ///   Loan agreement
//                            SizedBox(
//                              height: 20,
//                            ),
//                            Container(
//                              width: double.infinity,
//                              height: 50.0,
//                              decoration: new BoxDecoration(
//                                color: Theme.of(context).accentColor,
//                                borderRadius: BorderRadius.circular(3.0),
//                              ),
//                              child: Row(
//                                mainAxisAlignment:
//                                MainAxisAlignment.spaceBetween,
//                                children: [
//                                  Container(
//                                    child: Row(
//                                      children: [
//                                        SizedBox(
//                                          width: 12,
//                                        ),
//                                        Text(
//                                          "Loan agreement",
//                                          textAlign: TextAlign.start,
//                                          overflow: TextOverflow.ellipsis,
//                                          style: new TextStyle(
//                                              fontSize: 13,
//                                              fontWeight: FontWeight.bold,
//                                              color: Colors.white),
//                                        ),
//                                        SizedBox(
//                                          width: 12,
//                                        ),
//                                        Container(
//                                          height: 18,
//                                          width: 18,
//                                          decoration: BoxDecoration(
//                                            image: DecorationImage(
//                                              image: AssetImage(
//                                                  "assets/cloud_download.png"),
//                                            ),
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                  Container(
//                                    child: Row(
//                                      children: [
//                                        SizedBox(
//                                          width: 12,
//                                        ),
//                                        Container(
//                                          height: 18,
//                                          width: 18,
//                                          decoration: BoxDecoration(
//                                            image: DecorationImage(
//                                              image: AssetImage(
//                                                  "assets/cloud_upload.png"),
//                                            ),
//                                          ),
//                                        ),
//                                        SizedBox(
//                                          width: 12,
//                                        ),
//                                        Text(
//                                          "Upload",
//                                          textAlign: TextAlign.start,
//                                          overflow: TextOverflow.ellipsis,
//                                          style: new TextStyle(
//                                              fontSize: 13,
//                                              fontWeight: FontWeight.bold,
//                                              color: Theme.of(context)
//                                                  .primaryColor),
//                                        ),
//                                        SizedBox(
//                                          width: 12,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//
//                            ///   SOW
//                            SizedBox(
//                              height: 20,
//                            ),
//                            Container(
//                              width: double.infinity,
//                              height: 50.0,
//                              decoration: new BoxDecoration(
//                                color: Theme.of(context).accentColor,
//                                borderRadius: BorderRadius.circular(3.0),
//                              ),
//                              child: Row(
//                                mainAxisAlignment:
//                                MainAxisAlignment.spaceBetween,
//                                children: [
//                                  Container(
//                                    child: Row(
//                                      children: [
//                                        SizedBox(
//                                          width: 12,
//                                        ),
//                                        Text(
//                                          "SOW",
//                                          textAlign: TextAlign.start,
//                                          overflow: TextOverflow.ellipsis,
//                                          style: new TextStyle(
//                                              fontSize: 13,
//                                              fontWeight: FontWeight.bold,
//                                              color: Colors.white),
//                                        ),
//                                        SizedBox(
//                                          width: 12,
//                                        ),
//                                        Container(
//                                          height: 18,
//                                          width: 18,
//                                          decoration: BoxDecoration(
//                                            image: DecorationImage(
//                                              image: AssetImage(
//                                                  "assets/cloud_download.png"),
//                                            ),
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                  Container(
//                                    child: Row(
//                                      children: [
//                                        SizedBox(
//                                          width: 12,
//                                        ),
//                                        Container(
//                                          height: 18,
//                                          width: 18,
//                                          decoration: BoxDecoration(
//                                            image: DecorationImage(
//                                              image: AssetImage(
//                                                  "assets/cloud_upload.png"),
//                                            ),
//                                          ),
//                                        ),
//                                        SizedBox(
//                                          width: 12,
//                                        ),
//                                        Text(
//                                          "Upload",
//                                          textAlign: TextAlign.start,
//                                          overflow: TextOverflow.ellipsis,
//                                          style: new TextStyle(
//                                              fontSize: 13,
//                                              fontWeight: FontWeight.bold,
//                                              color: Theme.of(context)
//                                                  .primaryColor),
//                                        ),
//                                        SizedBox(
//                                          width: 12,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//
//                            ///   Safe harbours
//                            SizedBox(
//                              height: 20,
//                            ),
//                            Container(
//                              width: double.infinity,
//                              height: 50.0,
//                              decoration: new BoxDecoration(
//                                color: Theme.of(context).accentColor,
//                                borderRadius: BorderRadius.circular(3.0),
//                              ),
//                              child: Row(
//                                mainAxisAlignment:
//                                MainAxisAlignment.spaceBetween,
//                                children: [
//                                  Container(
//                                    child: Row(
//                                      children: [
//                                        SizedBox(
//                                          width: 12,
//                                        ),
//                                        Text(
//                                          "Safe harbours",
//                                          textAlign: TextAlign.start,
//                                          overflow: TextOverflow.ellipsis,
//                                          style: new TextStyle(
//                                              fontSize: 13,
//                                              fontWeight: FontWeight.bold,
//                                              color: Colors.white),
//                                        ),
//                                        SizedBox(
//                                          width: 12,
//                                        ),
//                                        Container(
//                                          height: 18,
//                                          width: 18,
//                                          decoration: BoxDecoration(
//                                            image: DecorationImage(
//                                              image: AssetImage(
//                                                  "assets/cloud_download.png"),
//                                            ),
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                  Container(
//                                    child: Row(
//                                      children: [
//                                        SizedBox(
//                                          width: 12,
//                                        ),
//                                        Container(
//                                          height: 18,
//                                          width: 18,
//                                          decoration: BoxDecoration(
//                                            image: DecorationImage(
//                                              image: AssetImage(
//                                                  "assets/cloud_upload.png"),
//                                            ),
//                                          ),
//                                        ),
//                                        SizedBox(
//                                          width: 12,
//                                        ),
//                                        Text(
//                                          "Upload",
//                                          textAlign: TextAlign.start,
//                                          overflow: TextOverflow.ellipsis,
//                                          style: new TextStyle(
//                                              fontSize: 13,
//                                              fontWeight: FontWeight.bold,
//                                              color: Theme.of(context)
//                                                  .primaryColor),
//                                        ),
//                                        SizedBox(
//                                          width: 12,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//
//                            ///   Cloud Check
//                            SizedBox(
//                              height: 20,
//                            ),
//                            Container(
//                              width: double.infinity,
//                              height: 50.0,
//                              decoration: new BoxDecoration(
//                                color: Theme.of(context).accentColor,
//                                borderRadius: BorderRadius.circular(3.0),
//                              ),
//                              child: Row(
//                                mainAxisAlignment:
//                                MainAxisAlignment.spaceBetween,
//                                children: [
//                                  Container(
//                                    child: Row(
//                                      children: [
//                                        SizedBox(
//                                          width: 12,
//                                        ),
//                                        Text(
//                                          "Cloud Check",
//                                          textAlign: TextAlign.start,
//                                          overflow: TextOverflow.ellipsis,
//                                          style: new TextStyle(
//                                              fontSize: 13,
//                                              fontWeight: FontWeight.bold,
//                                              color: Colors.white),
//                                        ),
//                                        SizedBox(
//                                          width: 12,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                  Container(
//                                    child: Row(
//                                      children: [
//                                        SizedBox(
//                                          width: 12,
//                                        ),
//                                        Container(
//                                          height: 18,
//                                          width: 18,
//                                          decoration: BoxDecoration(
//                                            image: DecorationImage(
//                                              image: AssetImage(
//                                                  "assets/user_check_icon.png"),
//                                            ),
//                                          ),
//                                        ),
//                                        SizedBox(
//                                          width: 12,
//                                        ),
//                                        Text(
//                                          "Verify",
//                                          textAlign: TextAlign.start,
//                                          overflow: TextOverflow.ellipsis,
//                                          style: new TextStyle(
//                                              fontSize: 13,
//                                              fontWeight: FontWeight.bold,
//                                              color: Theme.of(context)
//                                                  .primaryColor),
//                                        ),
//                                        SizedBox(
//                                          width: 12,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//
//                            SizedBox(
//                              height: 20,
//                            ),
//                          ],
//                        ),
//                      ],
//                    ),
//                  ],
//                ),
//              ),
//              ///   Next Step
//              Positioned(
//                bottom: 0,right: 0,left: 0,
//                child: Padding(
//                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                  child: Container(
//                    child: Column(
//                      children: [
//                        isLoading
//                            ? SpinKitCircle(
//                          color: Theme.of(context).primaryColor,
//                          size: 35.0,
//                        )
//                            : GestureDetector(
//                          onTap: () => _loadNextPage(5),
//                          child: Container(
//                            alignment: Alignment.center,
//                            width: double.infinity,
//                            child: Padding(
//                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
//                              child: Container(
//                                padding: EdgeInsets.all(12.0),
//                                alignment: Alignment.center,
//                                decoration: BoxDecoration(
//                                  color: Theme.of(context).primaryColor,
//                                  borderRadius: BorderRadius.circular(3),
//                                ),
//                                child: Text(
//                                  "Next Step",
//                                  style: TextStyle(
//                                    fontSize: 16.0,
//                                    fontWeight: FontWeight.w600,
//                                    color: Colors.white,
//                                  ),
//                                ),
//                              ),
//                            ),
//                          ),
//                        ),
//                        SizedBox(
//                          height: 25,
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//              ),
//            ],
//          )
//              : Container(),
//
//          _loadPage == 5
//              ? Stack(
//            alignment: Alignment.center,
//            children: [
//              Positioned(
//                top: MediaQuery.of(context).size.height / 2.6,
//                left: 0,
//                right: 0,
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: [
//                    ///   Clock
//                    Container(
//                      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
//                      decoration: BoxDecoration(
//                        color: Color(0xff303A53),
//                        borderRadius: BorderRadius.circular(40),
//                      ),
//                      child: Icon(Icons.access_time, color: Theme.of(context).primaryColor, size: 45,),
//                    ),
//                    ///   Wait for verification
//                    SizedBox(height: 10,),
//                    TextWidget.fieldLabel(
//                      "Wait for verification",
//                      fontSize: 25,
//                      textAlign: TextAlign.start,
//                      color: Colors.white,
//                      fontWeight: FontWeight.w700,
//                    ),
//                    ///  It usually takes from 1 to 2 days.
//                    SizedBox(height: 10,),
//                    TextWidget.fieldLabel(
//                      "It usually takes from 1 to 2 days.",
//                      fontSize: 18,
//                      textAlign: TextAlign.start,
//                      color: Color(0xff9C9EA5),
//                      fontWeight: FontWeight.w700,
//                    ),
//                    SizedBox(
//                      height: 20,
//                    ),
//                  ],
//                ),
//              ),
//            ],
//          )
//              : Container(),
//
//          _loadPage == 6
//              ? Stack(
//            children: [
//              Positioned(
//                top: MediaQuery.of(context).size.height / 2.6,
//                left: 0,
//                right: 0,
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: [
//                    ///   Clock
//                    Container(
//                      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
//                      decoration: BoxDecoration(
//                        color: Color(0xff303A53),
//                        borderRadius: BorderRadius.circular(40),
//                      ),
//                      child: Icon(Icons.check, color: Theme.of(context).primaryColor, size: 45,),
//                    ),
//                    ///   Congratulations!
//                    SizedBox(height: 10,),
//                    TextWidget.fieldLabel(
//                      "Congratulations!",
//                      fontSize: 25,
//                      textAlign: TextAlign.start,
//                      color: Colors.white,
//                      fontWeight: FontWeight.w700,
//                    ),
//                    ///  You’re account is now active.
//                    SizedBox(height: 10,),
//                    TextWidget.fieldLabel(
//                      "You’re account is now active.",
//                      fontSize: 18,
//                      textAlign: TextAlign.start,
//                      color: Color(0xff9C9EA5),
//                      fontWeight: FontWeight.w700,
//                    ),
//                    SizedBox(
//                      height: 20,
//                    ),
//                  ],
//                ),
//              ),
//              ///   Start investing!
//              Positioned(
//                bottom: 0,right: 0,left: 0,
//                child: Padding(
//                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                  child: Container(
//                    child: Column(
//                      children: [
//                        isLoading
//                            ? SpinKitCircle(
//                          color: Theme.of(context).primaryColor,
//                          size: 35.0,
//                        )
//                            : GestureDetector(
//                          onTap: () => Navigator.pop(context),
//                          child: Container(
//                            alignment: Alignment.center,
//                            width: double.infinity,
//                            child: Padding(
//                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
//                              child: Container(
//                                padding: EdgeInsets.all(12.0),
//                                alignment: Alignment.center,
//                                decoration: BoxDecoration(
//                                  color: Theme.of(context).primaryColor,
//                                  borderRadius: BorderRadius.circular(3),
//                                ),
//                                child: Text(
//                                  "Start investing!",
//                                  style: TextStyle(
//                                    fontSize: 16.0,
//                                    fontWeight: FontWeight.w600,
//                                    color: Colors.white,
//                                  ),
//                                ),
//                              ),
//                            ),
//                          ),
//                        ),
//                        SizedBox(
//                          height: 25,
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//              ),
//            ],
//          )
//              : Container(),