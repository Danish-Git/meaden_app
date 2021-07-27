import 'package:meaden_app/webservices/Queries/ChangePasswordMutation.dart';

import 'ChangePasswordView.dart';

class ChangePasswordPresentor {
  ChangePasswordView _changePasswordView;

  ChangePasswordPresentor(this._changePasswordView);

  CreateChangePasswordRequest (String token, String oldPassword, String newPassword, String newPasswordConfirmation) async {
    await Create_ChangePasswordQuery(token, oldPassword, newPassword, newPasswordConfirmation, _changePasswordView);
  }

  // GetMicroFunds (String token) async {
  //   await Create_userRequestQuery(token, _microFundsView);
  // }

  // GetMicroFunds (String token) async {
  //   await Create_myPortfolioPageQuery(token, _microFundsView);
  // }
}