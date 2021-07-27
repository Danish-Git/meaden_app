import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:meaden_app/play_ui/play_ui.dart';

import '../Utils.dart';

class Search extends StatefulWidget {

  bool isLoading = false;
  Utils get _utils => GetIt.I<Utils>();

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
                padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: Colors.white38,
                      fontSize: 15,
                    ),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.white38,
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 20,
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
                            padding: EdgeInsets.fromLTRB(8, 12, 10, 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 15,
                                  child: TextWidget.fieldLabel(
                                    "name",
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
                                    color: Theme.of(context).highlightColor,
                                  ),
                                ),
                                Expanded(
                                  flex: 12,
                                  child: TextWidget.fieldLabel(
                                    "daysAgo",
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
                                    child:
                                        Image.asset('assets/arrow_right.png'),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Container(
                            height: 1,
                            color: Color(0xff4D525D),
                          ),
                        )
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
