import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:planted/load_data.dart';
import 'package:planted/model/ist.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class IstChart extends StatefulWidget {
  const IstChart({Key? key}) : super(key: key);

  @override
  _IstChartState createState() => _IstChartState();
}

class _IstChartState extends State<IstChart> {
  late List<Ist> istData;
  static List<ChartSeries> istDataSeries = [];
  late TooltipBehavior tooltipBehavior;
  late ZoomPanBehavior zoomPanBehavior;

  @override
  void initState() {
    LoadData().loadIstData();
    istData = LoadData.istData;
    loadSeries();

    tooltipBehavior = TooltipBehavior(enable: true);
    zoomPanBehavior = ZoomPanBehavior(
      enablePinching: true,
      enableDoubleTapZooming: true,
      enableSelectionZooming: true,
      enableMouseWheelZooming: true,
      enablePanning: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        title: ChartTitle(text: 'IST data'),
        legend: Legend(isVisible: true),
        tooltipBehavior: tooltipBehavior,
        zoomPanBehavior: zoomPanBehavior,
        series: istDataSeries,
        primaryXAxis: DateTimeAxis(
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            dateFormat: DateFormat.Hms(),
            intervalType: DateTimeIntervalType.hours,
            interactiveTooltip: const InteractiveTooltip(enable: false)),
        primaryYAxis: NumericAxis(
            labelFormat: r'{value} bar',
            decimalPlaces: 1,
            interactiveTooltip: const InteractiveTooltip(enable: false)));
  }

  loadSeries() {
    double maxValue = istData
        .map((e) => e.mesurements)
        .reduce((value, element) => value > element ? value : element);

    istDataSeries = [
      LineSeries<Ist, DateTime>(
          name: "IST",
          dataSource: istData,
          xValueMapper: (Ist pops, _) => pops.time,
          yValueMapper: (Ist pops, _) => pops.mesurements,
          dataLabelSettings: const DataLabelSettings(isVisible: false),
          color: const Color.fromRGBO(90, 153, 124, 1),
          enableTooltip: true),
      LineSeries<Ist, DateTime>(
          name: 'Maximum value',
          dataSource: istData,
          xValueMapper: (Ist pops, _) => pops.time,
          yValueMapper: (Ist pops, _) => maxValue,
          dataLabelSettings: const DataLabelSettings(
              isVisible: false),
          color: const Color.fromRGBO(160, 69, 57, 1),
          enableTooltip: true)
    ];
  }
}
