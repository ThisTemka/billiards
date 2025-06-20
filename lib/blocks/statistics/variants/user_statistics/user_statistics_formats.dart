class UserStatisticsFormats {
  static String formatNumber(double value) => '$value';
  static String formatPercent(double value) => '${(value * 100).round()}%';
  static String formatPrecision(double value) => value.toStringAsFixed(1);
  static String formatDuration(double value) => '${value}s';
}
