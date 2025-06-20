class PlayerResultStatisticsFormats {
  static String formatNumber(double value) => '$value';
  static String formatPercent(double value) => '${(value * 100).round()}%';
  static String formatDuration(double value) => '${value.round()}s';
  static String formatPrecision(double value) => value.toStringAsPrecision(1);
}
