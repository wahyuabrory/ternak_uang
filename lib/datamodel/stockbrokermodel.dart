class stockbrokermodel {
  final String ticker;
  final String name;

  stockbrokermodel({required this.ticker, required this.name});

  factory stockbrokermodel.fromJson(Map<String, dynamic> json) {
    return stockbrokermodel(ticker: json['ticker'], name: json['name']);
  }
}
