import 'package:meaden_app/webservices/Queries/SettingMeQuery.dart';

import 'AccountSettingView.dart';

class AccountSettingPresentor {
  AccountSettingView _accountSettingView;

  AccountSettingPresentor(this._accountSettingView);

  GetUserInfo (String token) async {
    await Create_meRequestQuery(token, _accountSettingView);
  }

  // GetMicroFunds (String token) async {
  //   await Create_userRequestQuery(token, _microFundsView);
  // }

  // GetMicroFunds (String token) async {
  //   await Create_myPortfolioPageQuery(token, _microFundsView);
  // }
}