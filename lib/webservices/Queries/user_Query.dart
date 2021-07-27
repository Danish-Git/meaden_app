import 'package:graphql_flutter/graphql_flutter.dart';
import '../../app/microfunds/MicroFundsView.dart';
import '../../webservices/Clients/AppClients.dart';
import '../../webservices/networkStrings.dart';
import '../../models/myMicroFunds_Response.dart';

void Create_userRequestQuery(String token, MicroFundsView microFundsView) {
  GraphQLClient _client = AppClients().initClientWithToken(token);

  _client.query(QueryOptions(document: gql(NetworkStrings().MyMicroFunds_QueryString)))
      .then((result) => _extractResult(result, microFundsView));
}

_extractResult(QueryResult result, MicroFundsView microFundsView) {
  if(result.data == null) {
    microFundsView.onFailure("${result.exception}");
  } else {
    myMicroFunds_Response _microFunds_Response = myMicroFunds_Response.fromJson(result.data);
    print(_microFunds_Response.myMicroFunds[0].description);
    microFundsView.onMyMicroFundQuerySuccess(_microFunds_Response);
  }
}