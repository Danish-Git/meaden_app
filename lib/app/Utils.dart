import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class Utils{

  Future<bool> isInternetAvailable() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  bool isFormValid(GlobalKey<FormState> _formKey) {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      return true;
    } else {
      return false;
    }
  }

  void showToast(String msg,BuildContext context){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Theme.of(context).primaryColor,
        //backgroundColor: const Color(0xff089BAB),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  showLoading (BuildContext context) {
    return SpinKitCircle(
        color: Theme.of(context).primaryColor,
        size: 35.0);
  }

  isPasswordValid(String value, BuildContext context){
    if (value.isEmpty || value.length < 8 ) {
      return AppLocalizations.of(context).enter_valid_password;
    }
    return null;
  }

  isPasswordSame(String value, String newPasswordTxt, BuildContext context) {
    if(value != newPasswordTxt){
      return "Please Check! Password miss march. ";
    }
    return null;
  }

  textStyle_bodyText1 () {
    return TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w400,
    );
  }

  genrealTextValidation(String value) {
    if(value.isEmpty){
      return "This field can't be empty";
    }
    return null;
  }

  stringToDate(String stringDate) {
    //return DateFormat('d/M/yyyy').parse(stringDate);
    return DateFormat("dd/MM/yy").format(DateTime.parse(stringDate));//formattedDate();
  }


}