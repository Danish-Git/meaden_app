import 'package:meaden_app/models/DashboardMeResponse.dart';
import 'package:meaden_app/models/myMicroFunds_Response.dart';
import 'package:meaden_app/models/myPortfolioPage_Response.dart';

class MicroFundsView {
  void onMyQuerySuccess(DashboardMeResponse meResponse){}
  void onMyMicroFundQuerySuccess(myMicroFunds_Response funds_response){}
  void onFailure(String msg){}
  void onMyPortfolioPageQuerySuccess(MyPortfolioPageResponse myPortfolioPageResponse) {}
  //void enableButton() {}
  //void disableButton(){}
}