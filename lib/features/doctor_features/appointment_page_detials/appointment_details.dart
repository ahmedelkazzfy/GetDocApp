import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/config/constants/custom_dialog.dart';
import 'package:medicalassiss/config/constants/main_button.dart';
import 'package:medicalassiss/core/helpers/extensions.dart';
import 'package:medicalassiss/core/theming/colors.dart';
import 'package:medicalassiss/core/theming/styles.dart';
import 'package:medicalassiss/features/doctor_features/appointment_page_detials/widgets/appointment_details.dart';

class AppointmentDetailsPage extends StatelessWidget {
  const AppointmentDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Appointment Details",
          style: TextStyles.appBarTextStyle,
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value) {
              _onMenuItemSelected(context, value);
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'done',
                child: Text('Done'),
              ),
              const PopupMenuItem<String>(
                value: 'edit',
                child: Text(
                  'Edit',
                  style: TextStyle(color: Colors.green),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'cancel',
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: ListView(
          children: [
            _buildSectionHeader("Patient Information"),
            SizedBox(height: 10.h),
            _buildPatientInfo(),
            SizedBox(height: 20.h),
            DoctorDetailAppointment(
              text1: "Date: Monday, 12th Dec 2024",
              subtext1: "Time: 10:30 AM",
              text2: "Location",
              subtext2: "Egypt ,15 wara mas3 alkarasi",
            ),
            SizedBox(height: 20.h),
            _buildSectionHeader("Notes"),
            SizedBox(height: 10.h),
            _buildNotes(),
          ],
        ),
      ),
    );
  }

  void _onMenuItemSelected(BuildContext context, String value) {
    switch (value) {
      case 'cancel':
        _handleCancel(context);
        break;
      case 'edit':
        _handleEdit(context);
        break;
      case 'done':
        _handleDone(context);
        break;
      default:
        break;
    }
  }

  void _handleCancel(BuildContext context) {
    // Handle cancel action
    showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialog(
        isAnotherButton: true,
        backgroundColor: ColorManager.failureColor,
        title: "Cancel Appointment",
        description:
            "Are you sure you want to cancel this appointment? This action cannot be undone.",
        buttonText: "Confirm",
        icon: Icons.info_outline_rounded,
        button: MainButton(
          text: "Confirm",
          icon: Icons.done,
          iconColor: Colors.white,
          buttonColor: ColorManager.failureColor,
          func: () {
            context.pop();
          },
        ),
      ),
    );
  }

  void _handleEdit(BuildContext context) {
    // Handle edit action
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text("Edit Appointment"), backgroundColor: Colors.green),
    );
  }

  void _handleDone(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialog(
        isAnotherButton: false,
        backgroundColor: ColorManager.successColor,
        title: "Success",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        buttonText: "Okay",
        icon: Icons.info_outline_rounded,
        button: MainButton(
          text: "Ok",
          icon: Icons.done,
          iconColor: Colors.white,
          buttonColor: ColorManager.successColor,
          func: () {
            context.pop();
          },
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyles.headline1.copyWith(
        color: ColorManager.buttons,
      ),
    );
  }

  Widget _buildPatientInfo() {
    return Row(
      children: [
        CircleAvatar(
          radius: 30.r,
          backgroundImage: const AssetImage(
              "assets/images/home/user_5.png"), // Replace with actual patient image
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "John Doe", // Replace with patient name
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.h),
            Text(
              "Age: 35",
              style: TextStyles.secondhintStyle,
            ),
            Text(
              "Contact: +1234567890",
              style: TextStyles.headline3,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNotes() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        "The patient needs to undergo a blood test before the next visit. ", // Replace with actual notes
        style: TextStyles.headline1,
      ),
    );
  }
}
