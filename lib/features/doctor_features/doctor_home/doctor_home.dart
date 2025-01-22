import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/core/helpers/date_helper.dart';
import 'package:medicalassiss/core/helpers/extensions.dart';
import 'package:medicalassiss/core/routing/routes_name.dart';
import 'package:medicalassiss/core/theming/colors.dart';
import 'package:medicalassiss/core/theming/styles.dart';
import 'package:medicalassiss/features/doctor_features/appointments_page/appointments_page.dart';
import 'package:medicalassiss/features/doctor_features/patient_profile.dart/patient_profile.dart';
import 'package:medicalassiss/features/doctor_features/patients/patients.dart';
import 'package:medicalassiss/features/realtime_chat/chats/chats_screen.dart';
import 'package:medicalassiss/features/user_features/user_home/widgets/section_title.dart';

// ignore: must_be_immutable
class DoctorHomePage extends StatelessWidget {
  const DoctorHomePage({super.key});

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
          "Doctor Dashboard",
          style: TextStyles.appBarTextStyle,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Doctor's Info Section
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0).r,
                  child: _buildDoctorInfo(context),
                ),
                SizedBox(height: 20.h),

                // Daily Overview Section
                const SectionTitle(title: "Today's Overview"),
                SizedBox(height: 10.h),
                _buildDailyOverview(context),
                SizedBox(height: 20.h),

                // Upcoming Appointments Section
                const SectionTitle(title: "Upcoming Appointments"),

                SizedBox(height: 10.h),
                _buildUpcomingAppointments(context),
                SizedBox(height: 20.h),

                // Quick Access Section
                const SectionTitle(title: "Quick Access"),
                SizedBox(height: 10.h),
                _buildQuickAccessGrid(context),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDoctorInfo(BuildContext context) {
    DateTime currentDate = DateHelper.currentDate;
    String dayName = DateHelper.getDayName(currentDate.weekday);
    return Row(
      children: [
        CircleAvatar(
          radius: 40.r,
          backgroundImage:
              const AssetImage("assets/images/doctors/doctor5.jpg"),
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dr. John Doe",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              "Cardiologist",
              style: TextStyle(fontSize: 11.sp, color: Colors.grey),
            ),
          ],
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                dayName,
                style: TextStyles.headline3,
              ),
              Text(
                '${currentDate.day}/${currentDate.month}/${currentDate.year}',
                style: TextStyles.headline1,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDailyOverview(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildOverviewCard("Appointments", "12", Icons.calendar_today, () {}),
        _buildOverviewCard("Patients", "8", Icons.people_outline, () {}),
        _buildOverviewCard("Earnings", "\$450", Icons.attach_money, () {}),
      ],
    );
  }

  Widget _buildOverviewCard(
      String title, String value, IconData icon, Function onTap) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Card(
        color: const Color.fromARGB(255, 254, 251, 251),
        elevation: 3,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        child: Container(
          width: 100.w,
          height: 100.h,
          padding: EdgeInsets.all(10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Icon(icon,
                      color: ColorManager.doctorIconColor, size: 15.sp)),
              SizedBox(height: 8.h),
              Expanded(
                child: Text(
                  value,
                  style:
                      TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 9.sp, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUpcomingAppointments(BuildContext context) {
    List<Map<String, String>> appointments = [
      {"name": "Alice Brown", "time": "10:00 AM"},
      {"name": "Bob Smith", "time": "11:30 AM"},
      {"name": "Clara Johnson", "time": "1:00 PM"},
    ];

    return Column(
      children: appointments
          .map(
            (appointment) => Card(
              color: const Color.fromARGB(255, 254, 251, 251),
              elevation: 2,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/home/user_5.png"),
                ),
                title: Text(appointment["name"]!),
                subtitle: Text(appointment["time"]!),
                trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PatientProfilePage(),
                  ));
                },
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildQuickAccessGrid(BuildContext context) {
    List<Map<String, dynamic>> actions = [
      {
        "title": "Prescriptions",
        "icon": Icons.medical_services,
        "Action": () {}
      },
      {
        "title": "Patients",
        "icon": Icons.person_outline,
        "Action": () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const PatientManagementPage(),
          ));
        },
      },
      {
        "title": "Chats",
        "icon": Icons.chat_sharp,
        "Action": () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const ChatsScreen(),
          ));
        },
      },
      {
        "title": "Reports",
        "icon": Icons.bar_chart,
        "Action": () {},
      },
      {
        "title": "Profile",
        "icon": Icons.person,
        "Action": () {
          context.pushNamed(
            RoutesName.doctorProfilePage,
          );
        },
      },
      {
        "title": "View Appointments",
        "icon": Icons.dashboard_customize,
        "Action": () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AppointmentsPage(),
          ));
        },
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
      ),
      itemCount: actions.length,
      itemBuilder: (context, index) {
        return Container(
          child: Card(
            color: const Color.fromARGB(255, 254, 251, 251),
            elevation: 3,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            // shape:
            //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
            child: InkWell(
              onTap: actions[index]["Action"],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    actions[index]["icon"],
                    size: 20.sp,
                    color: ColorManager.doctorIconColor,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    actions[index]["title"],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
