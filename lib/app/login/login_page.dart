import 'dart:async';
import 'dart:io';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:meaden_app/app/Utils.dart';
import 'package:meaden_app/app/login/Login_Presenter.dart';
import 'package:meaden_app/app/login/Login_View.dart';
import 'package:meaden_app/play_ui/page_scaffold/page_scaffold_widget.dart';
import 'package:meaden_app/play_ui/play_ui.dart';
import 'package:meaden_app/play_ui/text_widget/text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../main.dart';


class LoginPage extends StatefulWidget {


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements Login_View {

  Utils get _utils => GetIt.I<Utils>();

  Color switch1Color = const Color(0xff24485e);
  bool isRememberMe=true;
  bool _renderFlag = true;
  bool _linkGenFlag = false;

  bool showDialogVar = false; //checking whether dialog box is showing or not
  final _formKey = GlobalKey<FormState>();
  EventBus eventBus = EventBus();

  String loginEmail, loginPassword;
  bool notshowPassword = true;
  Color passwordEyeIconColor = Colors.grey;

  bool isSwitched = false;
  bool isLoading = false;
  String email='';
  String password='';


  @override
  void initState(){
    super.initState();

  }


  @override
  void dispose() {
    super.dispose();
  }


  Widget build(BuildContext context) {

    return Scaffold(
    body: PageScaffoldWidget(
              hideAppBar: true,
              child: //scaffold's body

                  Stack(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(height: 60,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                child: Image.asset('assets/gembot_logo.png'),
                              ),
                            ],
                          ),
                        ),
                        Container(height: 20,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget.title(
                                AppLocalizations.of(context).welcome_back,
                                fontSize: 24,
                                color: Colors.white,
                              ),
                              Container(
                                height: 10,
                              ),
                              TextWidget.fieldLabel(
                                AppLocalizations.of(context).sign_in_to_the_app,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        Container(height: 20,),

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
                                            AppLocalizations.of(context).email,
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
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            decoration: InputDecoration.collapsed(
                                                hintText: "",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey)
                                                // contentPadding:
                                                //     EdgeInsets.only(left: blockWidth * 5)
                                                ),
                                            onSaved: (val) {
                                              email = val.trim();
                                            },
                                            validator: (value) {
                                              if (value.isEmpty || !value.contains("@")) {
                                                return AppLocalizations.of(
                                                        context)
                                                    .enter_valid_email;
                                              }
                                              return null;
                                            },
                                          ))
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 20,
                                ),
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
                                            AppLocalizations.of(context)
                                                .password,
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
                                              hintStyle:
                                                  TextStyle(color: Colors.grey)
                                              // contentPadding:
                                              //     EdgeInsets.only(left: blockWidth * 5)
                                              ),
                                          onSaved: (val) {
                                            password = val.trim();
                                          },
                                          validator: (value) {
                                            if (value.isEmpty || value.length < 4 ) {
                                              return AppLocalizations.of(
                                                      context)
                                                  .enter_valid_password;
                                            }
                                            return null;
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(height: 15,),
                              ],
                            ),
                          ),
                        ),

                        isLoading
                            ? SpinKitCircle(
                          color: Theme.of(context).primaryColor,
                          size: 35.0,
                        )
                            : SizedBox(
                          width: double.infinity,
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
                              onPressed: () => _signIn(),
                              child: Text(
                                AppLocalizations.of(context).login,
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(height: 10,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: isLoading ? null : () {},
                              child: LabelFieldWidget(
                                  color: Color(0xffBABABD),
                                  size: 14,
                                  label: AppLocalizations.of(context)
                                      .forgot_password),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 30.0,
                      left: 1,
                      right: 1,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: TextWidget.fieldLabel(
                                    AppLocalizations.of(context)
                                        .dont_have_account,
                                    color: Color(0xffBABABD),
                                    fontSize: 14,
                                  ),
                                ),
                                Container(
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: isLoading
                                      ? null
                                      : () {
                                          // Navigator.pushNamed(context, '/signup');
                                          Navigator.pushNamed(context, "/onBoarding");
                                        },
                                  child: Text(
                                    AppLocalizations.of(context)
                                        .register_interest,
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 13,
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          //}
      //),
    );
  }

  Future<bool> _isInternetAvailable() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      enableButton();
      return null;
    }
  }

  bool _isFormValid() {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      return true;
    } else {
      enableButton();
      return false;
    }
  }

  void _signIn()  {
    FocusScope.of(context).unfocus();
    if(_isInternetAvailable() != null){ ///true
      disableButton();
      if (_isFormValid()){  ///true
        Login_Presenter(this).Perform_Signin(email, password);
      }
    } else {
      onLoginFailure("Not Connected");
      enableButton();
    }
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

  @override
  void onLoginFailure(String msg) {
    _utils.showToast(msg, context);
    enableButton();
  }

  @override
  void onLoginSuccess() {
    Navigator.pushReplacementNamed(context, '/dashboard');
    enableButton();
  }

}
