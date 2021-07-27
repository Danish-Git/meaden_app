class Login_Response {
  String token;
  String id;
  String username;
  String name;
  String email;

  Login_Response({this.token, this.id, this.username, this.name, this.email});

  Login_Response.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    id = json['id'];
    username = json['username'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['id'] = this.id;
    data['username'] = this.username;
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}