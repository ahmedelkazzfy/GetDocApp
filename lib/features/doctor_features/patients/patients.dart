import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/core/theming/styles.dart';
import 'package:medicalassiss/features/doctor_features/patient_profile.dart/patient_profile.dart';
import 'package:medicalassiss/features/doctor_features/patients/widgets/search.dart';
import 'package:medicalassiss/features/user_features/user_home/widgets/section_title.dart';

class PatientManagementPage extends StatefulWidget {
  const PatientManagementPage({super.key});

  @override
  PatientManagementPageState createState() => PatientManagementPageState();
}

class PatientManagementPageState extends State<PatientManagementPage> {
  bool isSearchActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearchActive
            ? FadeIn(
                delay: const Duration(milliseconds: 300),
                child: Text(
                  "Search",
                  style: TextStyles.appBarTextStyle,
                ),
              )
            : FadeIn(
                delay: const Duration(milliseconds: 300),
                child: Text(
                  "Patients",
                  style: TextStyles.appBarTextStyle,
                ),
              ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSearchActive = !isSearchActive;
              });
            },
            icon: isSearchActive
                ? const Icon(
                    Icons.search_off,
                    color: Colors.black,
                    size: 30,
                  )
                : const Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 30,
                  ),
          ),
        ],
      ),
      body: isSearchActive
          ? const Search()
          : FadeInDown(
              duration: const Duration(milliseconds: 300),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0).r,
                      child: const SectionTitle(title: "Your clients"),
                    ),
                    SizedBox(height: 10.h),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 10, // Replace with dynamic count
                        itemBuilder: (context, index) {
                          return _buildPatientCard(
                            patientName: "Patient ${index + 1}",
                            age: 25 + index, // Example age
                            contact: "+12345678${index}0",
                            lastVisit: "12 Dec 2024",
                            onTap: () {
                              // Navigate to patient details
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PatientProfilePage(),
                              ));
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildPatientCard({
    required String patientName,
    required int age,
    required String contact,
    required String lastVisit,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 3.h),
        elevation: 1,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundImage: const AssetImage(
                    "assets/images/home/user_5.png"), // Replace with dynamic image
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      patientName,
                      style: TextStyle(
                          fontSize: 13.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Age: $age",
                      style: TextStyle(fontSize: 11.sp, color: Colors.grey),
                    ),
                    Text(
                      "Contact: $contact",
                      style: TextStyle(fontSize: 11.sp, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Last Visit",
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  ),
                  Text(
                    lastVisit,
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.h),
                  Icon(Icons.arrow_forward_ios,
                      size: 13.sp, color: Colors.grey),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
