import '../login/Login_View.dart';
import '../../webservices/Queries/LoginRequest.dart';

class Login_Presenter {

  Login_View _login_view;

  Login_Presenter(this._login_view);

  Perform_Signin (String email, String password) async {
    await Create_LogInRequest(email , password, _login_view);
  }
}