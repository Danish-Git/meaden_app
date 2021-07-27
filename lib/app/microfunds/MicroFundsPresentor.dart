import 'package:meaden_app/webservices/Queries/myPortfolioPage_Query.dart';

import '../microfunds/MicroFundsView.dart';
import '../../webservices/Queries/DashboardMeQuery.dart';
import '../../webservices/Queries/user_Query.dart';

class MicroFundsPresentor {
  MicroFundsView _microFundsView;

  MicroFundsPresentor(this._microFundsView);

  GetUserInfo (String token) async {
    await Create_meRequestQuery(token, _microFundsView);
  }

  // GetMicroFunds (String token) async {
  //   await Create_userRequestQuery(token, _microFundsView);
  // }

  GetMicroFunds (String token) async {
      await Create_myPortfolioPageQuery(token, _microFundsView);
    }
}