import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:meaden_app/app/Utils.dart';
import 'package:meaden_app/app/changePassword/ChangePasswordPresentor.dart';
import 'package:meaden_app/app/changePassword/ChangePasswordView.dart';
import 'package:meaden_app/models/Login_Response.dart';
import 'package:meaden_app/play_ui/play_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:meaden_app/webservices/networkStrings.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> implements ChangePasswordView {

  Utils get _utils => GetIt.I<Utils>();
  
  final _formKey = GlobalKey<FormState>();
  bool notshowPassword = true;
  bool isLoading = false;

  TextEditingController _newPasswordControler = TextEditingController();
  ChangePasswordPresentor _changePasswordPresentor;

  Color passwordEyeIconColor = Colors.grey;
  String _oldPasswordTxt='';
  String _newPasswordTxt='';
  String _confirmPasswordTxt='';

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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 30,),
              TextWidget.fieldLabel(
                "Change Password",
                fontSize: 20,
                textAlign: TextAlign.center,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 30,),
              /// Password
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                // color: Colors.yellow,
                // height: blockHeight * 15,
                alignment: Alignment.topLeft,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ///   Old Password
                      Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: new BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "Old Password",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: new TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff9C9EA5)),
                                ),
                              ),
                            ),
                            Flexible(
                                flex: 6,
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1,
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration.collapsed(
                                      hintText: "",
                                      hintStyle: TextStyle(
                                          color: Colors.grey),
                                    // contentPadding:
                                    //     EdgeInsets.only(left: blockWidth * 5)
                                  ),
                                  onSaved: (val) {
                                    _oldPasswordTxt = val.trim();
                                  },
                                  validator: (value) => _utils.isPasswordValid(value, context),
                                ))
                          ],
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                      ///   New Password
                      Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: new BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  "New Password",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff9C9EA5)),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 6,
                              child: TextFormField(
                                controller: _newPasswordControler,
                                obscureText: notshowPassword,
                                keyboardType: TextInputType.text,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration.collapsed(
                                    hintText: "",
                                    hintStyle: TextStyle(color: Colors.grey)
                                  // contentPadding:
                                  //     EdgeInsets.only(left: blockWidth * 5)
                                ),
                                onSaved: (val) {
                                  _newPasswordTxt = val.trim();
                                },
                                validator: (value) => _utils.isPasswordValid(value, context),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                      ///   Confirm Password
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: new BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  "Confirm Password",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff9C9EA5)),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 6,
                              child: TextFormField(
                                obscureText: notshowPassword,
                                keyboardType: TextInputType.text,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1,
                                textAlignVertical:
                                TextAlignVertical.center,
                                decoration: InputDecoration.collapsed(
                                    hintText: "",
                                    hintStyle: TextStyle(color: Colors.grey)
                                  // contentPadding:
                                  //     EdgeInsets.only(left: blockWidth * 5)
                                ),
                                onSaved: (val) {
                                  _confirmPasswordTxt = val.trim();
                                },
                                validator: (value) => _utils.isPasswordSame(value, _newPasswordControler.text.trim(), context),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(height: 50,),

                      isLoading
                          ? _utils.showLoading(context)
                          : SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3.0),
                                      side: BorderSide(
                                          color:
                                              Theme.of(context).primaryColor)),
                                  color: Theme.of(context).primaryColor,
                                  textColor: Colors.white,
                                  padding: EdgeInsets.all(12.0),
                                  onPressed: () => _validateNdUpdatePassword(),
                                  child: Text(
                                    "Change Password",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _validateNdUpdatePassword() {
    FocusScope.of(context).unfocus();
    if(_utils.isInternetAvailable() != null){ ///true
      disableButton();
      if (_utils.isFormValid(_formKey)){  ///true
        ChangePasswordPresentor(this).CreateChangePasswordRequest(NetworkStrings().SahilToken, _oldPasswordTxt, _newPasswordTxt, _confirmPasswordTxt);
      } else {
        enableButton();
      }
    } else {
      onFailure(AppLocalizations.of(context).internet_not_available);

//      onLoginFailure("Not Connected");
//      enableButton();
    }
  }

  @override
  void onFailure(String msg) {
    _utils.showToast(msg, context);
    enableButton();
  }

  @override
  void onPasswordChangeSuccess(Login_Response response) {
    onFailure("Password Changed Successfully");
    _formKey.currentState.reset();
    _newPasswordControler.text = "";
    enableButton();
    Navigator.pop(context);
  }

  @override
  void disableButton() {
    // TODO: implement disableButton
    setState(() {
      isLoading = true;
    });
  }

  @override
  void enableButton() {
    setState(() {
      isLoading = false;
    });
  }
}
