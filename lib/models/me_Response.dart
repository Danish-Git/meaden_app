class me_Response {
  String id;
  String username;
  String name;
  String email;
  String token;
  String status;
  List<String> privileges;
  String createdAt;
  String updatedAt;
  List<ManagedPortfolios> managedPortfolios;

  me_Response(
      {this.id,
        this.username,
        this.name,
        this.email,
        this.token,
        this.status,
        this.privileges,
        this.createdAt,
        this.updatedAt,
        this.managedPortfolios});

  me_Response.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
    email = json['email'];
    token = json['token'];
    status = json['status'];
    privileges = json['privileges'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['managedPortfolios'] != null) {
      managedPortfolios = new List<ManagedPortfolios>();
      json['managedPortfolios'].forEach((v) {
        managedPortfolios.add(new ManagedPortfolios.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['name'] = this.name;
    data['email'] = this.email;
    data['token'] = this.token;
    data['status'] = this.status;
    data['privileges'] = this.privileges;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.managedPortfolios != null) {
      data['managedPortfolios'] =
          this.managedPortfolios.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ManagedPortfolios {
  String id;
  String name;
  String description;
  List<Managers> managers;

  ManagedPortfolios({this.id, this.name, this.description, this.managers});

  ManagedPortfolios.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    if (json['managers'] != null) {
      managers = new List<Managers>();
      json['managers'].forEach((v) {
        managers.add(new Managers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.managers != null) {
      data['managers'] = this.managers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Managers {
  String id;

  Managers({this.id});

  Managers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}