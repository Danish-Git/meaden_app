import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meaden_app/models/DashboardMeResponse.dart';
import '../../app/microfunds/MicroFundsView.dart';
import '../../models/me_Response.dart';
import '../../webservices/Clients/AppClients.dart';
import '../networkStrings.dart';

void Create_meRequestQuery(String token, MicroFundsView microFundsView) {

  GraphQLClient _client = AppClients().initClientWithToken(token);

  _client.query(QueryOptions(document: gql(NetworkStrings().DashboardMe_QueryString)))
      .then((result) => _extractResult(result, microFundsView));

  // _client.query(QueryOptions(document: gql(NetworkStrings().MyPortfolioPage_QueryString)))
  //     .then((result) => _extractResult(result, microFundsView));
}

_extractResult(QueryResult result, MicroFundsView microFundsView) {
  print(result);
  if(result.data == null) {
    microFundsView.onFailure("${result.exception}");
  } else {
    DashboardMeResponse dashboardMeResponse = DashboardMeResponse.fromJson(result.data["me"]);
    print(dashboardMeResponse.moneyDeployedToMicroFunds.nZD);
    microFundsView.onMyQuerySuccess(dashboardMeResponse);
  }
}

