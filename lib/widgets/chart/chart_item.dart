import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChartItem {
  final double value;
  final String title;
  final Color color;
  final double? radius;

  const ChartItem({
    required this.value,
    required this.title,
    required this.color,
    this.radius,
  });

  PieChartSectionData toPieChartSectionData() {
    return PieChartSectionData(
      value: value,
      title: title,
      color: color,
      radius: radius ?? 80.r,
    );
  }
}
