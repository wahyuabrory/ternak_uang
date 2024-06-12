class stockpricemodel {
  final String date;
  final String symbol;
  final int open;
  final int high;
  final int low;
  final int close;
  final int volume;
  final int change;
  final double changePct;

  stockpricemodel({
    required this.date,
    required this.symbol,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
    required this.change,
    required this.changePct,
  });

  factory stockpricemodel.fromJson(Map<String, dynamic> json) {
    return stockpricemodel(
      date: json['date'],
      symbol: json['symbol'],
      open: json['open'],
      high: json['high'],
      low: json['low'],
      close: json['close'],
      volume: json['volume'],
      change: json['change'],
      changePct: json['change_pct'].toDouble(),
    );
  }
}
