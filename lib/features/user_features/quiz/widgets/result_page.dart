import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicalassiss/core/theming/colors.dart';
import 'package:medicalassiss/core/theming/styles.dart';

class ResultPage extends StatelessWidget {
  final Map<String, double> results;

  const ResultPage(this.results, {super.key});

  @override
  Widget build(BuildContext context) {
    // Convert results.entries to a list for indexed access
    final List<MapEntry<String, double>> resultList = results.entries.toList();

    // Generating bar chart groups
    final List<BarChartGroupData> barGroups = resultList.asMap().entries.map(
      (entry) {
        final int index = entry.key; // Index (int)
// Map key (String)
        final double value = entry.value.value; // Map value (double)

        return BarChartGroupData(
          x: index, // Use the index as the x-axis position
          barRods: [
            BarChartRodData(
              toY: value, // The percentage value
              color: ColorManager.chatMainColor,
              width: 20,
              borderRadius: BorderRadius.circular(4).r,
            ),
          ],
        );
      },
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Results",
          style: TextStyles.appBarTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Analysis Summary",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BarChart(
                BarChartData(
                  barGroups: barGroups,
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            "${value.toInt()}%",
                            style: GoogleFonts.poppins(fontSize: 12),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          final keys = results.keys.toList();
                          if (value.toInt() >= 0 &&
                              value.toInt() < keys.length) {
                            return Text(
                              keys[value.toInt()],
                              style: TextStyles.font11darkblueBold,
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                    topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                  ),
                ),
              ),
            ),
            // Display the results list below the chart
            ...resultList.map(
              (entry) => ListTile(
                title: Text(
                  entry.key,
                  style: GoogleFonts.poppins(fontSize: 16),
                ),
                trailing: Text(
                  "${entry.value.toStringAsFixed(1)}%",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
