import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/core/theming/styles.dart';

class PatientProfilePage extends StatelessWidget {
  // Mock Data
  final String patientName = "John Doe";
  final String patientId = "1234567890";
  final String gender = "Male";
  final String dob = "01/01/1985";
  final String avatarUrl =
      "https://via.placeholder.com/150"; // Placeholder for avatar
  final List<String> medicalHistory = [
    "Diabetes Type 2 (Diagnosed 2015)",
    "Hypertension (Diagnosed 2018)",
    "Asthma (Diagnosed 2019)"
  ];
  final List<String> upcomingAppointments = [
    "Consultation with Dr. Smith - 14/12/2024",
    "Blood Pressure Check - 20/12/2024"
  ];

  PatientProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFd3d3d3),
                Color.fromARGB(255, 202, 243, 253),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          "Patient Profile",
          style: TextStyles.appBarTextStyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 202, 243, 253),
                Colors.white,
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Patient Info Section
                Card(
                  elevation: 3,
                  shadowColor: Colors.blueGrey.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage("assets/images/home/user_5.png"),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              patientName,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Patient ID: $patientId",
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Gender: $gender",
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "DOB: $dob",
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Medical History Section
                Text("Medical History", style: TextStyles.headline1),
                const SizedBox(height: 12),
                Card(
                  elevation: 4,
                  shadowColor: Colors.blueGrey.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: medicalHistory
                          .map((history) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Row(
                                  children: [
                                    const Icon(Icons.medical_services,
                                        size: 20, color: Colors.blue),
                                    const SizedBox(width: 8),
                                    Expanded(
                                        child: Text(history,
                                            style:
                                                const TextStyle(fontSize: 16))),
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Upcoming Appointments Section
                Text(
                  "Upcoming Appointments",
                  style: TextStyles.font11darkblueBold,
                ),
                const SizedBox(height: 12),
                Card(
                  elevation: 4,
                  shadowColor: Colors.blueGrey.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: upcomingAppointments
                          .map((appointment) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Row(
                                  children: [
                                    const Icon(Icons.calendar_today,
                                        size: 20, color: Colors.blue),
                                    const SizedBox(width: 8),
                                    Expanded(
                                        child: Text(appointment,
                                            style:
                                                const TextStyle(fontSize: 16))),
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Take Action Button
                // MainButton(text: "", iconColor: iconColor, buttonColor: buttonColor, func: func)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
