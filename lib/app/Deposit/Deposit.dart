import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meaden_app/app/Preferences.dart';
import 'package:meaden_app/app/Utils.dart';
import 'package:meaden_app/play_ui/play_ui.dart';

class Deposit extends StatefulWidget {
  @override
  _DepositState createState() => _DepositState();
}

class _DepositState extends State<Deposit> {

  double _circleSize = 35, _pageNoSize = 16, _radioFontSize = 15, _fielsFontSize = 14;

  Utils get _utils => GetIt.I<Utils>();

  bool isLoading = false;
  int _depositStepNo = 1;
  String _amountNZD;
  String _usrName;

  @override
  void initState() {
    super.initState();
    _getDataFromSharedPreferences();
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
    
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        brightness: Brightness.dark,
        elevation: 0,
        leading:IconButton(
          padding: EdgeInsets.only(left: 15, right: 15),
          icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).primaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title:  Container(
          height: 40,
          width: 40,
          child: Image.asset('assets/gembot_logo.png'),
        ),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => showMenu(),
                          child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage(
                                          "assets/sample.jpg"),
                                  ),
                              ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          child: Image.asset(
                              'assets/settings_back.png'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ///   Username
                    TextWidget.fieldLabel(
                      "${_usrName}",
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  showMenu() {
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
                      _depositStepNo == 1 ? Step1Ui() : Container(),
                      _depositStepNo == 2 ? Step2Ui() : Container(),
                      _depositStepNo == 3 ? Step3Ui() : Container(),
                      _depositStepNo == 4 ? Step4Ui() : Container(),
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

  _getDataFromSharedPreferences() async {
    String _usrName_T = await Preferences().getUsrName();
    setState(() {
      _usrName = _usrName_T;
    });
  }

  Step1Ui () {
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

  Step2Ui() {
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
                      child: Icon(
                        Icons.cancel_outlined,
                        color: Colors.grey,
                        size: 25,),
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
              ///   Loan agreement
              Container(
                width: double.infinity,
                height: 50.0,
                decoration: BoxDecoration(
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

  Step3Ui() {
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

  Step4Ui() {
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
                      child: Icon(Icons.cancel_outlined,color: Colors.grey, size: 25,),
                  ),
                ],
              ),
              SizedBox(height: 35,),
              ///   Amount (NZD)
              Container(
                width: double.infinity,
                height: 50.0,
                //padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                decoration: BoxDecoration(
                  //color: Theme.of(context).accentColor,
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
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                height: 1,
                color: Theme.of(context).accentColor,
              ),
              ///   Account number
              Container(
                width: double.infinity,
                height: 50.0,
                //padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                decoration: BoxDecoration(
                  //color: Theme.of(context).accentColor,
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
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                height: 1,
                color: Theme.of(context).accentColor,
              ),
              ///   Reference
              Container(
                width: double.infinity,
                height: 50.0,
                //padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                decoration: BoxDecoration(
                  //color: Theme.of(context).accentColor,
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
                          padding: EdgeInsets.all(12.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Text(
                            "Finish",
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

  void _loadNextPage(int pageNo) {
    setState(() {
      _depositStepNo = pageNo;
    });
    Navigator.pop(context);
    showMenu();
  }
  
  Future sleep() {
    return Future.delayed(Duration(milliseconds: 2000), () => "3");
  }

}
