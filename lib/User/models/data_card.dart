import 'package:daily_tracker_diet_app/User/models/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart ' as charts;

class DataCardbar extends StatelessWidget {
  final List<ChartBar> data;

  const DataCardbar({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartBar, String>> series = [
      charts.Series(
        data: data,
        id: "ChartBar",
        domainFn: (ChartBar series, _) => series.workoutDay.toString(),
        measureFn: (ChartBar series, _) => series.workoutTime,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        labelAccessorFn: (ChartBar row, _) => "${row.workoutDay}",
      )
    ];
    return Expanded(
        child: charts.BarChart(
      series,
      animate: true,
    ));
  }
}
