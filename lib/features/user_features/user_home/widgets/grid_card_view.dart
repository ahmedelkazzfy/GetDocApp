import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/core/helpers/shared_preferences_manager.dart';

class GridCardView extends StatefulWidget {
  const GridCardView({super.key});

  @override
  GridCardViewState createState() => GridCardViewState();
}

class GridCardViewState extends State<GridCardView> {
  // This will hold the updated options list with the correct progress values
  List<Map<String, dynamic>> options = [
    {
      "title": "Mental Health",
      "progress": 0.0, // Use double instead of int
      "icon": Icons.sentiment_very_satisfied,
      "color": Colors.purple[300]!,
    },
    {
      "title": "Physical Health",
      "progress": 0.0, // Use double instead of int
      "icon": Icons.fitness_center,
      "color": Colors.orange[300]!,
    },
    {
      "title": "Stress Levels",
      "progress": 0.0, // Use double instead of int
      "icon": Icons.local_fire_department,
      "color": Colors.pink[300]!,
    },
    {
      "title": "General Health",
      "progress": 0.0, // Use double instead of int
      "icon": Icons.health_and_safety,
      "color": Colors.blue[300]!,
    },
  ];

  @override
  void initState() {
    super.initState();
    // Load the test result data when the widget is initialized
    loadTestResult();
  }

  // Example usage of loading a map and updating the options list with the progress values
  Future<void> loadTestResult() async {
    SharedPreferencesManager preferencesManager = SharedPreferencesManager();
    await preferencesManager.init(); // Initialize SharedPreferences
    Map<String, dynamic> result =
        await preferencesManager.loadMap('test_result'); // Load the result

    // Convert it to a Map<String, double>
    Map<String, double> resultMap =
        result.map((key, value) => MapEntry(key, value.toDouble()));

    setState(() {
      // Update the options list with the progress values from SharedPreferences
      options[0]['progress'] = resultMap['Mental Health'] ?? 0.0;
      options[1]['progress'] = resultMap['Physical Health'] ?? 0.0;
      options[2]['progress'] = resultMap['Stress Levels'] ?? 0.0;
      options[3]['progress'] = resultMap['Overall Well-being'] ?? 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 20.0),
      child: GridView.builder(
        shrinkWrap: true, // Ensures the GridView only takes up required space
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          childAspectRatio: 0.9,
        ),
        itemCount: options.length,
        itemBuilder: (context, index) {
          final lesson = options[index];
          return _buildContentCard(
            context,
            title: lesson['title'] as String,
            progress: lesson['progress'] as double, // Use double here
            icon: lesson['icon'] as IconData,
            color: lesson['color'] as Color,
          );
        },
      ),
    );
  }

  Widget _buildContentCard(BuildContext context,
      {required String title,
      required double progress, // Accept double here
      required IconData icon,
      required Color color}) {
    return GestureDetector(
      onTap: () {
        // Add functionality here
        debugPrint("Card tapped");
        loadTestResult(); // Optionally reload data on tap if needed
      },
      child: Card(
        color: const Color.fromARGB(255, 222, 221, 221),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0).r,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                // ignore: deprecated_member_use
                backgroundColor: color.withOpacity(0.2),
                radius: 30.r,
                child: Icon(icon, size: 30, color: color),
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${progress.toStringAsFixed(1)}% completed", // Display with 1 decimal place
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8).r,
                      child: LinearProgressIndicator(
                        value: progress / 100,
                        backgroundColor: Colors.grey[300],
                        color: color,
                        minHeight: 8.h,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
