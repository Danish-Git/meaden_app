import 'package:graphql_flutter/graphql_flutter.dart';
import '../networkStrings.dart';


class AppClients {
  //NetworkStrings _networkStrings = NetworkStrings();

  GraphQLClient initClientWithoutToken() {
    NetworkStrings _networkStrings = NetworkStrings();
    final HttpLink _httpLink = HttpLink(_networkStrings.URL);

    return GraphQLClient(
      cache: GraphQLCache(),
      link: _httpLink, //_link,
    );
  }

  GraphQLClient initClientWithToken(String token) {
    NetworkStrings _networkStrings = NetworkStrings();
    final HttpLink _httpLink = HttpLink(_networkStrings.URL);

    final AuthLink _authLink = AuthLink(
      getToken: () => '$token',
    );

    final Link _link = _authLink.concat(_httpLink);

    return GraphQLClient(
      cache: GraphQLCache(),
      link: _link, //_link,
    );
  }
}




