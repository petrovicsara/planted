import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:planted/load_data.dart';
import 'package:planted/model/druck.dart';

class DruckChart extends StatelessWidget {
  const DruckChart({Key? key}) : super(key: key);
  static List<Druck> druckData = [];
  static List<Series<Druck, DateTime>> druckDataSeries = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: LoadData().loadDruckData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          druckData = LoadData.druckData;
          loadSeries();

          return TimeSeriesChart(
            druckDataSeries,
            domainAxis: const DateTimeAxisSpec(
              tickFormatterSpec: AutoDateTimeTickFormatterSpec(
                hour: TimeFormatterSpec(format: 'Hm', transitionFormat: 'Hm'),
              ),
            ),
            behaviors: [
              ChartTitle(
                'Druck endplate over time',
                behaviorPosition: BehaviorPosition.top,
                titleOutsideJustification: OutsideJustification.middle,
                innerPadding: 60,
              ),
              ChartTitle(
                'Time',
                behaviorPosition: BehaviorPosition.bottom,
                titleOutsideJustification: OutsideJustification.middleDrawArea,
              ),
              ChartTitle(
                'Druck endplatte',
                behaviorPosition: BehaviorPosition.start,
                titleOutsideJustification: OutsideJustification.middleDrawArea,
              ),
              SeriesLegend(position: BehaviorPosition.bottom),
            ],
          );
        } else {
          return const CircularProgressIndicator(
            color: Colors.green,
            strokeWidth: 2,
          );
        }
      },
    );
  }

  loadSeries() {
    double averageValue = druckData
            .map((e) => e.measurements)
            .reduce((value, element) => value + element) /
        druckData.length;

    druckDataSeries = [
      Series(
        id: "Druck Endplatte",
        data: druckData,
        domainFn: (Druck pops, _) => pops.time,
        measureFn: (Druck pops, _) => pops.measurements,
        colorFn: (Druck pops, _) => Color.fromHex(code: '#5a7c99'),
      ),
      Series(
        id: 'Average value',
        data: druckData,
        domainFn: (Druck pops, _) => pops.time,
        measureFn: (Druck pops, _) => averageValue,
        colorFn: (Druck pops, _) => Color.fromHex(code: '#a04539'),
      )
    ];
  }
}
