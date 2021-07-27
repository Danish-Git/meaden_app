class SettingMeQueryResponseWithdrawals {
/*
{
  "id": "ckel2bg7630hbgns63t110o0f",
  "createdAt": "2020-09-02 07:31:57.762",
  "updatedAt": "2020-09-02 07:31:57.762",
  "fee": 0,
  "currency": "NZD",
  "transactionClass": "USER_BANK",
  "objectFrom": "ckel21o2e30g8gns6a8teep86",
  "objectTo": "null",
  "amount": 16668,
  "transactionDate": "2020-09-02 07:31:57.762",
  "pairedWith": "null"
}
*/

  String id;
  String createdAt;
  String updatedAt;
  int fee;
  String currency;
  String transactionClass;
  String objectFrom;
  String objectTo;
  int amount;
  String transactionDate;
  String pairedWith;

  SettingMeQueryResponseWithdrawals({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.fee,
    this.currency,
    this.transactionClass,
    this.objectFrom,
    this.objectTo,
    this.amount,
    this.transactionDate,
    this.pairedWith,
  });
  SettingMeQueryResponseWithdrawals.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toString();
    createdAt = json["createdAt"]?.toString();
    updatedAt = json["updatedAt"]?.toString();
    fee = json["fee"]?.toInt();
    currency = json["currency"]?.toString();
    transactionClass = json["transactionClass"]?.toString();
    objectFrom = json["objectFrom"]?.toString();
    objectTo = json["objectTo"]?.toString();
    amount = json["amount"]?.toInt();
    transactionDate = json["transactionDate"]?.toString();
    pairedWith = json["pairedWith"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    data["fee"] = fee;
    data["currency"] = currency;
    data["transactionClass"] = transactionClass;
    data["objectFrom"] = objectFrom;
    data["objectTo"] = objectTo;
    data["amount"] = amount;
    data["transactionDate"] = transactionDate;
    data["pairedWith"] = pairedWith;
    return data;
  }
}

class SettingMeQueryResponseDeposits {
/*
{
  "id": "cki6xz7ht0porwis6et64661f",
  "createdAt": "2020-12-02 05:00:31.025",
  "updatedAt": "2020-12-02 05:00:31.025",
  "fee": 0,
  "currency": "NZD",
  "transactionClass": "BANK_USER",
  "objectFrom": "null",
  "objectTo": "ckel21o2e30g8gns6a8teep86",
  "amount": 10000,
  "transactionDate": "2020-12-02 00:00:00.000",
  "pairedWith": "null"
}
*/

  String id;
  String createdAt;
  String updatedAt;
  int fee;
  String currency;
  String transactionClass;
  String objectFrom;
  String objectTo;
  int amount;
  String transactionDate;
  String pairedWith;

  SettingMeQueryResponseDeposits({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.fee,
    this.currency,
    this.transactionClass,
    this.objectFrom,
    this.objectTo,
    this.amount,
    this.transactionDate,
    this.pairedWith,
  });
  SettingMeQueryResponseDeposits.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toString();
    createdAt = json["createdAt"]?.toString();
    updatedAt = json["updatedAt"]?.toString();
    fee = json["fee"]?.toInt();
    currency = json["currency"]?.toString();
    transactionClass = json["transactionClass"]?.toString();
    objectFrom = json["objectFrom"]?.toString();
    objectTo = json["objectTo"]?.toString();
    amount = json["amount"]?.toInt();
    transactionDate = json["transactionDate"]?.toString();
    pairedWith = json["pairedWith"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    data["fee"] = fee;
    data["currency"] = currency;
    data["transactionClass"] = transactionClass;
    data["objectFrom"] = objectFrom;
    data["objectTo"] = objectTo;
    data["amount"] = amount;
    data["transactionDate"] = transactionDate;
    data["pairedWith"] = pairedWith;
    return data;
  }
}

class SettingMeQueryResponse {
/*
{
  "name": "sahil",
  "username": "sahil",
  "addressNeighbourhood": "null",
  "addressStreetNumber": "null",
  "addressStreetName": "null",
  "addressCity": "null",
  "addressCountry": "null",
  "addressZip": "null",
  "contactNumber": "7470713778",
  "email": "sahil@gembot.local",
  "deposits": [
    {
      "id": "cki6xz7ht0porwis6et64661f",
      "createdAt": "2020-12-02 05:00:31.025",
      "updatedAt": "2020-12-02 05:00:31.025",
      "fee": 0,
      "currency": "NZD",
      "transactionClass": "BANK_USER",
      "objectFrom": "null",
      "objectTo": "ckel21o2e30g8gns6a8teep86",
      "amount": 10000,
      "transactionDate": "2020-12-02 00:00:00.000",
      "pairedWith": "null"
    }
  ],
  "withdrawals": [
    {
      "id": "ckel2bg7630hbgns63t110o0f",
      "createdAt": "2020-09-02 07:31:57.762",
      "updatedAt": "2020-09-02 07:31:57.762",
      "fee": 0,
      "currency": "NZD",
      "transactionClass": "USER_BANK",
      "objectFrom": "ckel21o2e30g8gns6a8teep86",
      "objectTo": "null",
      "amount": 16668,
      "transactionDate": "2020-09-02 07:31:57.762",
      "pairedWith": "null"
    }
  ]
}
*/

  String name;
  String username;
  String addressNeighbourhood;
  String addressStreetNumber;
  String addressStreetName;
  String addressCity;
  String addressCountry;
  String addressZip;
  String contactNumber;
  String email;
  List<SettingMeQueryResponseDeposits> deposits;
  List<SettingMeQueryResponseWithdrawals> withdrawals;

  SettingMeQueryResponse({
    this.name,
    this.username,
    this.addressNeighbourhood,
    this.addressStreetNumber,
    this.addressStreetName,
    this.addressCity,
    this.addressCountry,
    this.addressZip,
    this.contactNumber,
    this.email,
    this.deposits,
    this.withdrawals,
  });
  SettingMeQueryResponse.fromJson(Map<String, dynamic> json) {
    name = json["name"]?.toString();
    username = json["username"]?.toString();
    addressNeighbourhood = json["addressNeighbourhood"]?.toString();
    addressStreetNumber = json["addressStreetNumber"]?.toString();
    addressStreetName = json["addressStreetName"]?.toString();
    addressCity = json["addressCity"]?.toString();
    addressCountry = json["addressCountry"]?.toString();
    addressZip = json["addressZip"]?.toString();
    contactNumber = json["contactNumber"]?.toString();
    email = json["email"]?.toString();
    if (json["deposits"] != null) {
      final v = json["deposits"];
      final arr0 = <SettingMeQueryResponseDeposits>[];
      v.forEach((v) {
        arr0.add(SettingMeQueryResponseDeposits.fromJson(v));
      });
      deposits = arr0;
    }
    if (json["withdrawals"] != null) {
      final v = json["withdrawals"];
      final arr0 = <SettingMeQueryResponseWithdrawals>[];
      v.forEach((v) {
        arr0.add(SettingMeQueryResponseWithdrawals.fromJson(v));
      });
      withdrawals = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["name"] = name;
    data["username"] = username;
    data["addressNeighbourhood"] = addressNeighbourhood;
    data["addressStreetNumber"] = addressStreetNumber;
    data["addressStreetName"] = addressStreetName;
    data["addressCity"] = addressCity;
    data["addressCountry"] = addressCountry;
    data["addressZip"] = addressZip;
    data["contactNumber"] = contactNumber;
    data["email"] = email;
    if (deposits != null) {
      final v = deposits;
      final arr0 = [];
      v.forEach((v) {
        arr0.add(v.toJson());
      });
      data["deposits"] = arr0;
    }
    if (withdrawals != null) {
      final v = withdrawals;
      final arr0 = [];
      v.forEach((v) {
        arr0.add(v.toJson());
      });
      data["withdrawals"] = arr0;
    }
    return data;
  }
}