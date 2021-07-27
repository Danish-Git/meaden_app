import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meaden_app/app/changePassword/ChangePasswordView.dart';
import 'package:meaden_app/models/Login_Response.dart';
import 'package:meaden_app/webservices/Clients/AppClients.dart';

import '../networkStrings.dart';

void Create_ChangePasswordQuery(String token, String oldPassword, String newPassword, String newPasswordConfirmation, ChangePasswordView changePasswordView) {

  Map args = <String, dynamic>{
    "oldPassword": oldPassword,
    "newPassword": newPassword,
    "newPasswordConfirmation": newPasswordConfirmation
  };

  GraphQLClient _client = AppClients().initClientWithToken(token);

  _client.query(QueryOptions(document: gql(NetworkStrings().ChangePassword_QueryString), variables: args))
      .then((result) => _extractResult(result, changePasswordView));

}

_extractResult(QueryResult result, ChangePasswordView changePasswordView) {
  if(result.data == null) {
    if(result.toString().contains("jwt expired")){
      changePasswordView.onFailure("Session Expired! Login Again");
    } else {
      changePasswordView.onFailure("Some thing went wrong!. Please try after sometime");
    }
  } else {
    Login_Response login_response = Login_Response.fromJson(result.data["changePassword"]);
    print(login_response.name);
    changePasswordView.onPasswordChangeSuccess(login_response);
  }
}