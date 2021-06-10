import 'package:daily_tracker_diet_app/User/models/chart_bar.dart';
import 'package:daily_tracker_diet_app/User/models/chart_pie.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart ' as charts;

class DataCardpie extends StatelessWidget {
  final List<ChartPie> data;

  const DataCardpie({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartPie, String>> series = [
      charts.Series(
        data: data,
        id: "ChartPie",
        domainFn: (ChartPie series, _) => series.workoutDay.toString(),
        measureFn: (ChartPie series, _) => series.caloriesNumber,
        colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
        labelAccessorFn: (ChartPie row, _) =>
            '${row.workoutDay}: ${row.caloriesNumber}',
      )
    ];

    return charts.PieChart(
      series,
      animate: true,
      defaultRenderer:
          new charts.ArcRendererConfig(arcWidth: 200, arcRendererDecorators: [
        // <-- add this to the code
        charts.ArcLabelDecorator() // <-- and this of course
      ]),
    );
  }
}
