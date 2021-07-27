import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meaden_app/app/accountSetting/AccountSettingView.dart';
import 'package:meaden_app/models/SettingMeQueryResponse.dart';
import 'package:meaden_app/webservices/Clients/AppClients.dart';

import '../networkStrings.dart';

void Create_meRequestQuery(String token, AccountSettingView accountSettingView) {

  GraphQLClient _client = AppClients().initClientWithToken(token);

  _client.query(QueryOptions(document: gql(NetworkStrings().SettingMe_QueryString)))
      .then((result) => _extractResult(result, accountSettingView));

}

_extractResult(QueryResult result, AccountSettingView accountSettingView) {
  if(result.data == null) {
    if(result.toString().contains("jwt expired")){
      accountSettingView.onFailure("Session Expired! Login Again");
    } else {
      accountSettingView.onFailure("Some thing went wrong!. Please try after sometime");
    }
  } else {
    SettingMeQueryResponse settingMeQueryResponse = SettingMeQueryResponse.fromJson(result.data["me"]);
    print(settingMeQueryResponse.name);
    accountSettingView.onMyQuerySuccess(settingMeQueryResponse);
  }
}