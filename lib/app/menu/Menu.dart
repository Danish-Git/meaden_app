import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meaden_app/play_ui/play_ui.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  double _rlMargin = 10;
  double _hight = 5;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          margin: EdgeInsets.fromLTRB(8, 10, 8, 0),
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
            ///   Profile
            GestureDetector(
              //onTap: () => Navigator.pushNamed(context, "/accountSetting"),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                /*decoration: BoxDecoration(
                  border: Border.all(color: Colors.white)
                ),*/
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.account_circle,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Container(width: 14,),
                        Container(
                          child: Text(
                            "Profile",
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Container(
                height: 1,
                color: Color(0xff4D525D),
              ),
            ),
            ///  Account Setting
            GestureDetector(
              //onTap: () => Navigator.pushNamed(context, "/accountSetting"),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                /*decoration: BoxDecoration(
                  border: Border.all(color: Colors.white)
                ),*/
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.account_circle,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Container(
                          width: 14,
                        ),
                        Container(
                          child: Text(
                            "Account Setting",
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Container(
                height: 1,
                color: Color(0xff4D525D),
              ),
            ),
            ///  OnBoarding
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/onBoarding"),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                /*decoration: BoxDecoration(
                  border: Border.all(color: Colors.white)
                ),*/
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.account_circle,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Container(
                          width: 14,
                        ),
                        Container(
                          child: Text(
                            "Onboarding",
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Container(
                height: 1,
                color: Color(0xff4D525D),
              ),
            ),
            ///  Deposit
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/Deposit"),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                /*decoration: BoxDecoration(
                  border: Border.all(color: Colors.white)
                ),*/
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.account_circle,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Container(
                          width: 14,
                        ),
                        Container(
                          child: Text(
                            "Deposit",
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
