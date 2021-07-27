class DashboardMeResponse {
  String username;
  String profilePicture;
  AccountCashBalance accountCashBalance;
  List<PortfoliosCashBalance> portfoliosCashBalance;
  AccountCashBalance cashBalance;
  Balance moneyDeployedToMicroFunds;

  DashboardMeResponse(
      {this.username,
        this.profilePicture,
        this.accountCashBalance,
        this.portfoliosCashBalance,
        this.cashBalance,
        this.moneyDeployedToMicroFunds});

  DashboardMeResponse.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    profilePicture = json['profilePicture'];
    accountCashBalance = json['accountCashBalance'] != null
        ? new AccountCashBalance.fromJson(json['accountCashBalance'])
        : null;
    if (json['portfoliosCashBalance'] != null) {
      portfoliosCashBalance = new List<PortfoliosCashBalance>();
      json['portfoliosCashBalance'].forEach((v) {
        portfoliosCashBalance.add(new PortfoliosCashBalance.fromJson(v));
      });
    }
    cashBalance = json['cashBalance'] != null
        ? new AccountCashBalance.fromJson(json['cashBalance'])
        : null;
    moneyDeployedToMicroFunds = json['moneyDeployedToMicroFunds'] != null
        ? new Balance.fromJson(json['moneyDeployedToMicroFunds'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['profilePicture'] = this.profilePicture;
    if (this.accountCashBalance != null) {
      data['accountCashBalance'] = this.accountCashBalance.toJson();
    }
    if (this.portfoliosCashBalance != null) {
      data['portfoliosCashBalance'] =
          this.portfoliosCashBalance.map((v) => v.toJson()).toList();
    }
    if (this.cashBalance != null) {
      data['cashBalance'] = this.cashBalance.toJson();
    }
    if (this.moneyDeployedToMicroFunds != null) {
      data['moneyDeployedToMicroFunds'] =
          this.moneyDeployedToMicroFunds.toJson();
    }
    return data;
  }
}

class AccountCashBalance {
  String nZD;

  AccountCashBalance({this.nZD});

  AccountCashBalance.fromJson(Map<String, dynamic> json) {
    nZD = json['NZD'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NZD'] = this.nZD;
    return data;
  }
}

class PortfoliosCashBalance {
  Portfolio portfolio;
  Balance balance;

  PortfoliosCashBalance({this.portfolio, this.balance});

  PortfoliosCashBalance.fromJson(Map<String, dynamic> json) {
    portfolio = json['portfolio'] != null
        ? new Portfolio.fromJson(json['portfolio'])
        : null;
    balance =
    json['balance'] != null ? new Balance.fromJson(json['balance']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.portfolio != null) {
      data['portfolio'] = this.portfolio.toJson();
    }
    if (this.balance != null) {
      data['balance'] = this.balance.toJson();
    }
    return data;
  }
}

class Portfolio {
  String id;
  String name;

  Portfolio({this.id, this.name});

  Portfolio.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Balance {
  double nZD;
  double uSD;

  Balance({this.nZD, this.uSD});

  Balance.fromJson(Map<String, dynamic> json) {
    nZD = json['NZD'];
    uSD = json['USD'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NZD'] = this.nZD;
    data['USD'] = this.uSD;
    return data;
  }
}