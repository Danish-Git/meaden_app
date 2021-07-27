class MyPortfolioPageResponse {
  MyPortfolioPage myPortfolioPage;

  MyPortfolioPageResponse({this.myPortfolioPage});

  MyPortfolioPageResponse.fromJson(Map<String, dynamic> json) {
    myPortfolioPage = json['myPortfolioPage'] != null
        ? new MyPortfolioPage.fromJson(json['myPortfolioPage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.myPortfolioPage != null) {
      data['myPortfolioPage'] = this.myPortfolioPage.toJson();
    }
    return data;
  }
}

class MyPortfolioPage {
  List<Portfolios> portfolios;

  MyPortfolioPage({this.portfolios});

  MyPortfolioPage.fromJson(Map<String, dynamic> json) {
    if (json['portfolios'] != null) {
      portfolios = new List<Portfolios>();
      json['portfolios'].forEach((v) {
        portfolios.add(new Portfolios.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.portfolios != null) {
      data['portfolios'] = this.portfolios.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Portfolios {
  String id;
  String name;
  List<MicroFunds> microFunds;
  PatronPortfolio patronPortfolio;

  Portfolios({this.id, this.name, this.microFunds, this.patronPortfolio});

  Portfolios.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['microFunds'] != null) {
      microFunds = new List<MicroFunds>();
      json['microFunds'].forEach((v) {
        microFunds.add(new MicroFunds.fromJson(v));
      });
    }
    patronPortfolio = json['patronPortfolio'] != null
        ? new PatronPortfolio.fromJson(json['patronPortfolio'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.microFunds != null) {
      data['microFunds'] = this.microFunds.map((v) => v.toJson()).toList();
    }
    if (this.patronPortfolio != null) {
      data['patronPortfolio'] = this.patronPortfolio.toJson();
    }
    return data;
  }
}

class MicroFunds {
  String id;
  String name;
  String status;
  int daysAgo;
  bool isPatronOf;

  MicroFunds({this.id, this.name, this.status, this.daysAgo, this.isPatronOf});

  MicroFunds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    daysAgo = json['daysAgo'];
    isPatronOf = json['isPatronOf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['daysAgo'] = this.daysAgo;
    data['isPatronOf'] = this.isPatronOf;
    return data;
  }
}

class PatronPortfolio {
  String id;
  String userId;
  String portfolioId;
  String createdAt;
  String updatedAt;
  String entityType;
  String taxRate;
  String irdNumber;
  String initialLoanAmount;
  String numberOfInstallments;
  String onboardingStatus;
  double portfolioCommission;
  String signedDocuments;

  PatronPortfolio(
      {this.id,
        this.userId,
        this.portfolioId,
        this.createdAt,
        this.updatedAt,
        this.entityType,
        this.taxRate,
        this.irdNumber,
        this.initialLoanAmount,
        this.numberOfInstallments,
        this.onboardingStatus,
        this.portfolioCommission,
        this.signedDocuments});

  PatronPortfolio.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    portfolioId = json['portfolioId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    entityType = json['entityType'];
    taxRate = json['taxRate'];
    irdNumber = json['irdNumber'];
    initialLoanAmount = json['initialLoanAmount'];
    numberOfInstallments = json['numberOfInstallments'];
    onboardingStatus = json['onboardingStatus'];
    portfolioCommission = json['portfolioCommission'];
    signedDocuments = json['signedDocuments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['portfolioId'] = this.portfolioId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['entityType'] = this.entityType;
    data['taxRate'] = this.taxRate;
    data['irdNumber'] = this.irdNumber;
    data['initialLoanAmount'] = this.initialLoanAmount;
    data['numberOfInstallments'] = this.numberOfInstallments;
    data['onboardingStatus'] = this.onboardingStatus;
    data['portfolioCommission'] = this.portfolioCommission;
    data['signedDocuments'] = this.signedDocuments;
    return data;
  }
}

///     ORIGINAL    JSON

/*
{
    "data": {
        "__typename": "Query",
        "myPortfolioPage": {
            "__typename": "PortfolioPageView",
            "portfolios": [
                {
                    "__typename": "ProfilePagePortfolioView",
                    "id": "ck7d3j06e00650741219hdojw",
                    "name": "Gembot",
                    "microFunds": [
                        {
                            "__typename": "MicroFundView",
                            "id": "ckdikzp130qmo9qs6eu6n5ar2",
                            "name": "Beta Fund 1",
                            "status": "CLOSED",
                            "investment": {},
                            "currentValue": {},
                            "daysAgo": 1,
                            "isPatronOf": false
                        }
                    ],
                    "patronPortfolio": {
                        "__typename": "PatronPortfolioView",
                        "id": "6424c9db9576a3d2ae2e6f20409ed18e",
                        "userId": "ckel21o2e30g8gns6a8teep86",
                        "portfolioId": "ck7d3j06e00650741219hdojw",
                        "createdAt": "2021-05-09 06:25:20.166",
                        "updatedAt": "2021-05-09 06:25:20.166",
                        "entityType": null,
                        "taxRate": null,
                        "irdNumber": null,
                        "initialLoanAmount": null,
                        "numberOfInstallments": null,
                        "onboardingStatus": "VERIFIED_VIEWED",
                        "portfolioCommission": 0.2,
                        "signedDocuments": null
                    }
                }
            ]
        }
    }
}
*/

///       PARSED    JSON

/*
{
    "myPortfolioPage": {
        "portfolios": [
            {
                "id": "ck7d3j06e00650741219hdojw",
                "name": "Gembot",
                "microFunds": [
                    {
                        "id": "ckdikzp130qmo9qs6eu6n5ar2",
                        "name": "Beta Fund 1",
                        "status": "CLOSED",
                        "daysAgo": 1,
                        "isPatronOf": false
                    }
                ],
                "patronPortfolio": {
                    "id": "6424c9db9576a3d2ae2e6f20409ed18e",
                    "userId": "ckel21o2e30g8gns6a8teep86",
                    "portfolioId": "ck7d3j06e00650741219hdojw",
                    "createdAt": "2021-05-09 06:25:20.166",
                    "updatedAt": "2021-05-09 06:25:20.166",
                    "entityType": "null",
                    "taxRate": "null",
                    "irdNumber": "null",
                    "initialLoanAmount": "null",
                    "numberOfInstallments": "null",
                    "onboardingStatus": "VERIFIED_VIEWED",
                    "portfolioCommission": 0.2,
                    "signedDocuments": "null"
                }
            }
        ]
    }
}
*/