class myMicroFunds_Response {
  List<MyMicroFunds> myMicroFunds;

  myMicroFunds_Response({this.myMicroFunds});

  myMicroFunds_Response.fromJson(Map<String, dynamic> json) {
    if (json['myMicroFunds'] != null) {
      myMicroFunds = new List<MyMicroFunds>();
      json['myMicroFunds'].forEach((v) {
        myMicroFunds.add(new MyMicroFunds.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.myMicroFunds != null) {
      data['myMicroFunds'] = this.myMicroFunds.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyMicroFunds {
  String id;
  String name;
  String description;

  MyMicroFunds({this.id, this.name, this.description});

  MyMicroFunds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}