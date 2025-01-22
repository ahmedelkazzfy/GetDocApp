import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/core/theming/colors.dart';
import 'package:medicalassiss/core/theming/styles.dart';
import 'package:medicalassiss/features/doctor_features/appointment_page_detials/appointment_details.dart';
import 'package:medicalassiss/features/doctor_features/appointments_page/widgets/Appointment_card.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  AppointmentsPageState createState() => AppointmentsPageState();
}

class AppointmentsPageState extends State<AppointmentsPage> {
  DateTime _focusedDate = DateTime.now();

  void _updateAvailableHours(DateTime date) {
    setState(() {
      // Simulate fetching available hours for the selected date.
    });
  }

  @override
  void initState() {
    super.initState();
    _updateAvailableHours(_focusedDate); // Initialize with today's hours.
  }

  Widget _buildCalendar() {
    return EasyTheme(
      data: EasyTheme.of(context).copyWithState(
        selectedDayTheme: DayThemeData(
          backgroundColor: ColorManager.buttons,
        ),
        selectedCurrentDayTheme: DayThemeData(
          backgroundColor: ColorManager.buttons,
        ),
        unselectedDayTheme: const DayThemeData(
          backgroundColor: Colors.white,
        ),
        disabledDayTheme: const DayThemeData(
          backgroundColor: Color.fromARGB(255, 127, 28, 28),
        ),
      ),
      child: EasyDateTimeLinePicker(
        focusedDate: _focusedDate,
        firstDate: DateTime(2024, 1, 1),
        lastDate: DateTime(2030, 1, 1),
        onDateChange: (date) {
          setState(() {
            _focusedDate = date; // Update the selected date.
          });
          _updateAvailableHours(date); // Fetch hours for the new date.
        },
      ),
    );
  }

  // Widget _buildAvailableHours() {
  //   return _availableHours.isEmpty
  //       ? const Center(
  //           child: Text("No available hours for this date."),
  //         )
  //       : SizedBox(
  //           height: 270.h,
  //           child: Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 15.0).r,
  //             child: GridView.builder(
  //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //                 crossAxisCount: 5,
  //                 crossAxisSpacing: 16.w,
  //                 mainAxisSpacing: 16.h,
  //               ),
  //               itemCount: _availableHours.length,
  //               itemBuilder: (context, index) {
  //                 final hour = _availableHours[index];

  //                 return GestureDetector(
  //                   onTap: () {
  //                     ScaffoldMessenger.of(context).showSnackBar(
  //                       SnackBar(content: Text("Selected hour: $hour")),
  //                     );
  //                   },
  //                   child: Container(
  //                     alignment: Alignment.center,
  //                     decoration: BoxDecoration(
  //                       color: ColorManager.customBorder,
  //                       borderRadius: BorderRadius.circular(12.r),
  //                       boxShadow: [
  //                         BoxShadow(
  //                           color: Colors.black26,
  //                           blurRadius: 4.r,
  //                           offset: const Offset(2, 2),
  //                         ),
  //                       ],
  //                     ),
  //                     child: Text(
  //                       hour,
  //                       style: TextStyle(
  //                         color: Colors.white,
  //                         fontSize: 9.sp,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                   ),
  //                 );
  //               },
  //             ),
  //           ),
  //         );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 242, 242),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Appointments",
          style: TextStyles.appBarTextStyle,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt_outlined),
            onPressed: () {
              // Handle filter action
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCalendar(),
          SizedBox(height: 10.h),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(10.0).r,
            child: Text(
              "Today's Appointments",
              style: TextStyles.headline1,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
              child: ListView.builder(
                itemCount: 5, // Replace with dynamic count
                itemBuilder: (context, index) {
                  return AppointmentCard(
                    patientName: "Patient ${index + 1}",
                    appointmentTime: "${10 + index}:00 AM",
                    status: index % 2 == 0 ? "Confirmed" : "Pending",
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AppointmentDetailsPage(),
                      ));
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to create new appointment
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
