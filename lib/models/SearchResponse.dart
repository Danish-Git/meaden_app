class SearchResponse {
  List<StockSearch> stockSearch;

  SearchResponse({this.stockSearch});

  SearchResponse.fromJson(Map<String, dynamic> json) {
    if (json['stockSearch'] != null) {
      stockSearch = new List<StockSearch>();
      json['stockSearch'].forEach((v) {
        stockSearch.add(new StockSearch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stockSearch != null) {
      data['stockSearch'] = this.stockSearch.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StockSearch {
  String id;
  String name;
  String ticker;
  bool currentlyActive;
  String currency;
  String exchange;
  StockDetails stockDetails;

  StockSearch(
      {this.id,
        this.name,
        this.ticker,
        this.currentlyActive,
        this.currency,
        this.exchange,
        this.stockDetails});

  StockSearch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    ticker = json['ticker'];
    currentlyActive = json['currentlyActive'];
    currency = json['currency'];
    exchange = json['exchange'];
    stockDetails = json['stockDetails'] != null
        ? new StockDetails.fromJson(json['stockDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['ticker'] = this.ticker;
    data['currentlyActive'] = this.currentlyActive;
    data['currency'] = this.currency;
    data['exchange'] = this.exchange;
    if (this.stockDetails != null) {
      data['stockDetails'] = this.stockDetails.toJson();
    }
    return data;
  }
}

class StockDetails {
  String currentPrice;
  String daysHigh;
  String daysLow;
  String daysOpen;
  String daysVolume;

  StockDetails(
      {this.currentPrice,
        this.daysHigh,
        this.daysLow,
        this.daysOpen,
        this.daysVolume});

  StockDetails.fromJson(Map<String, dynamic> json) {
    currentPrice = json['currentPrice'];
    daysHigh = json['daysHigh'];
    daysLow = json['daysLow'];
    daysOpen = json['daysOpen'];
    daysVolume = json['daysVolume'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPrice'] = this.currentPrice;
    data['daysHigh'] = this.daysHigh;
    data['daysLow'] = this.daysLow;
    data['daysOpen'] = this.daysOpen;
    data['daysVolume'] = this.daysVolume;
    return data;
  }
}