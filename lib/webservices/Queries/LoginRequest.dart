import 'package:graphql_flutter/graphql_flutter.dart';
import '../../app/Preferences.dart';
import '../../app/login/Login_View.dart';
import '../../models/Login_Response.dart';
import '../../webservices/Clients/AppClients.dart';
import '../networkStrings.dart';

void Create_LogInRequest(String email, String password, Login_View login_view) {

    Map args = <String, dynamic>{
        "email": email,
        "password": password
    };

    GraphQLClient _client = AppClients().initClientWithoutToken();

    _client.mutate(MutationOptions(document: gql((NetworkStrings().LoginQueryString)), variables: args,))
      .then((result) {
        print("Login Result --> $result");
        _extractResult(result,login_view);
        onError: (err) => print(err);
      });
}

_extractResult(QueryResult result, Login_View login_view,) {

  if(result.exception != null) {
    if(result.exception.graphqlErrors[0].message.contains("Email") || result.exception.graphqlErrors[0].message.contains("Invalid Login Credentials")){
      login_view.onLoginFailure("Invalid E-Mail or Password");
    } else {
      login_view.onLoginFailure("Some thing went wrong!. Please try after sometime");
    }
  } else if(result.data != null) {
    print(result.data["login"]);
    Login_Response login_response = Login_Response.fromJson(result.data["login"]);
    print(login_response.token);
    if(_saveDataPreferences(login_response)){
      login_view.onLoginSuccess();
    } else {
      login_view.onLoginFailure("Some thing went wrong!");
    }
  }
}

bool _saveDataPreferences(Login_Response result) {
  try {
    print("token = ${result.token} \n"
        "id = ${result.id} \n"
        "username = ${result.username} \n"
        "name = ${result.name} \n"
        "email = ${result.email} \n"
        "saveUsrLogin = ${true} \n"
    );
    Preferences pref = Preferences();
    pref.saveAuthToken(
      result.token == "" ?
        //  "NULL"
      /// Richard Token
           "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJja2E3Z2k0YTQyMG"
           "I4a25zNjVldWQyMDg4IiwicHJpdmlsZWdlcyI6WyJVU0VSX1ZJRVdFUiJdLCJpYXQiO"
           "jE2MjM0MTU3ODYsImV4cCI6MTYyNDAyMDU4Nn0.OLCft6pg6QLyCTqjiN7iK-qvKGBg"
           "bnuWnxEKpS_YEbM"
      /// Charlie Token
      //      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJja21lMHB5Z3kxdm"
      //      "xnajFzNmJldDAyajlqIiwicHJpdmlsZWdlcyI6WyJVU0VSX1ZJRVdFUiJdLCJpYXQiO"
      //      "jE2MjMyMjQ4NDcsImV4cCI6MTYyMzgyOTY0N30.hJ_OODESRpEmSmiG_uD7xLX9bMv7"
      //      "O5EZC28WNXnhAIs"
      /// Sahil Token
      //      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJja2VsMjFvMmUzMG"
      //      "c4Z25zNmE4dGVlcDg2IiwicHJpdmlsZWdlcyI6WyJVU0VSX1ZJRVdFUiJdLCJpYXQiO"
      //      "jE2MjI3Nzk3MDIsImV4cCI6MTYyMzM4NDUwMn0.6pKBWIPJDBrDbTwdHeD6cSQjmKBe"
      //      "g_hgQuIPxYE35VE"
     : result.token);
    pref.saveUserId(result.id);
    pref.saveUserName(result.username);
    pref.saveUsrName(result.name);
    pref.saveUsrEmail(result.email);
    pref.saveUsrLogin(true);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}