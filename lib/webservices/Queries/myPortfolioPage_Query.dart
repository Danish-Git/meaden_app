import 'package:graphql_flutter/graphql_flutter.dart';
import '../../app/microfunds/MicroFundsView.dart';
import '../../models/me_Response.dart';
import '../../models/myPortfolioPage_Response.dart';
import '../../webservices/Clients/AppClients.dart';
import '../networkStrings.dart';

void Create_myPortfolioPageQuery(String token, MicroFundsView microFundsView) {

  GraphQLClient _client = AppClients().initClientWithToken(token);

  _client.query(QueryOptions(document: gql(NetworkStrings().MyPortfolioPage_QueryString)))
      .then((result) => _extractResult(result, microFundsView));
}

_extractResult(QueryResult result, MicroFundsView microFundsView) {
  if(result.data == null) {
    microFundsView.onFailure("${result.exception}");
  } else {
    MyPortfolioPageResponse _myPortfolioPageResponse = MyPortfolioPageResponse.fromJson(result.data);
    microFundsView.onMyPortfolioPageQuerySuccess(_myPortfolioPageResponse);
  }
}

