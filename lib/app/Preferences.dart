import 'package:shared_preferences/shared_preferences.dart';

class Preferences {

  SharedPreferences pref;


  Preferences() {
    _getPrefInstance();
  }

  saveAuthToken(String auth) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("auth_token", auth);

  }

  Future<String> getAuthToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get("auth_token");
  }

  saveUserId(String id) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user_id", id);
  }

  Future<String>  getUserId() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.get("user_id");
  }

  clearPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  saveUserName(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user_userName", userName);
  }

  Future<String> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get("user_userName");
  }

  saveUsrName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user_usrName", name);
  }

  Future<String> getUsrName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get("user_usrName");
  }

  saveUsrEmail(String u_email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user_email", u_email);
  }

  Future<String> getUsrEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get("user_email");
  }

  _getPrefInstance() async {
    this.pref =  await SharedPreferences.getInstance();
  }

  saveTokenLinkGen(bool bool) {
    this.pref.setBool("token_link_gen", bool);
  }

  getTokenLinkGen() {
    return this.pref.getBool("token_link_gen");
  }

  saveUsrLogin(bool bool) async {
    print("bool $bool");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("IsLoggedIn", bool);
  }

  getUsrLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("IsLoggedIn");
  }

  saveIsTouched(bool bool) async {
    print("bool $bool");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("IsTouched", bool);
  }

  getIsTouched() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("IsTouched");
  }


}