import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../utils/global_values.dart';
import '../../utils/text_styles.dart';

class SportsDataChart extends StatelessWidget {
  final List<SportsData> sportsData = [
    SportsData('Online Booking', 60, Colors.green),
    SportsData('Offline Booking', 40, Colors.red),
  ];

  SportsDataChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 10,
                  ),
                  AppSizes.kWidth5,
                  Text(
                    "Football",
                    style: AppTextStyles.textH4,
                  )
                ],
              ),
              AppSizes.kHeight10,
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 10,
                  ),
                  AppSizes.kWidth5,
                  Text(
                    "Cricket",
                    style: AppTextStyles.textH4,
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 230,
            width: 230,
            child: SfCircularChart(
              series: <CircularSeries>[
                // Render pie chart
                PieSeries<SportsData, String>(
                  dataSource: sportsData,
                  pointColorMapper: (SportsData data, _) => data.color,
                  xValueMapper: (SportsData data, _) => data.category,
                  yValueMapper: (SportsData data, _) => data.percentage,
                  // Enable data label
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                    textStyle: TextStyle(fontWeight: FontWeight.w600),
                    labelPosition: ChartDataLabelPosition.inside,
                  ),
                  // Enable tooltip
                  enableTooltip: true,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SportsData {
  final String category;
  final double percentage;
  final Color color;

  SportsData(
    this.category,
    this.percentage,
    this.color,
  );
}
