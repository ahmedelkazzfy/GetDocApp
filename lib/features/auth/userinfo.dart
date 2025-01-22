import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/config/constants/core.dart';
import 'package:medicalassiss/config/constants/slide_button.dart';
import 'package:medicalassiss/core/routing/routes_name.dart';
import 'package:medicalassiss/features/auth/components/curved-form.dart';
import 'package:medicalassiss/features/auth/components/curved-left-shadow.dart';
import 'package:medicalassiss/features/auth/components/curved-left.dart';
import 'package:medicalassiss/features/auth/components/curved-right-shadow.dart';
import 'package:medicalassiss/features/auth/components/curved-right.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:medicalassiss/features/auth/components/divider.dart';

// ignore: must_be_immutable
class UserInfoPage extends StatelessWidget {
  UserInfoPage({super.key});

  final formKey = GlobalKey<FormState>();
  // final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  String selectedGender = "Male";

  Widget buildTextField({
    required String labelText,
    required IconData prefixIcon,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
    BuildContext? context,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10).r,
      child: TextFormField(
        controller: controller,
        style: TextStyle(
            fontSize: 15.0.sp,
            fontFamily: "cairo",
            color: Colors.black,
            fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon, color: Colors.grey),
          hintText: labelText,
          hintStyle: const TextStyle(fontSize: 13.0, color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(
            vertical: 12.0.h,
            horizontal: 16.0.w,
          ),
          border: InputBorder.none,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppLocalizations.of(context!)!.enterYourData;
          }
          return null;
        },
      ),
    );
  }

  Widget buildSignupForm(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          buildTextField(
            labelText: AppLocalizations.of(context)!.fullname,
            context: context,
            prefixIcon: Icons.person,
            controller: nameController,
            validator: (value) => value == null || value.isEmpty
                ? AppLocalizations.of(context)!.enterYourData
                : null,
          ),
          const CustomDivider(),
          buildTextField(
            labelText: AppLocalizations.of(context)!.phone,
            prefixIcon: Icons.phone,
            controller: phoneController,
            keyboardType: TextInputType.phone,
            context: context,
            validator: (value) => value == null || value.isEmpty
                ? AppLocalizations.of(context)!.enterYourData
                : null,
          ),
          const CustomDivider(),
          buildTextField(
            labelText: AppLocalizations.of(context)!.address,
            context: context,
            prefixIcon: Icons.location_city,
            controller: addressController,
            validator: (value) => value == null || value.isEmpty
                ? AppLocalizations.of(context)!.enterYourData
                : null,
          ),
          //part of birth date
          const CustomDivider(),
          buildTextField(
            labelText: AppLocalizations.of(context)!.dateofbirth,
            prefixIcon: Icons.date_range,
            controller: dobController,
            keyboardType: TextInputType.phone,
            context: context,
            validator: (value) => value == null || value.isEmpty
                ? AppLocalizations.of(context)!.enterYourData
                : null,
          ),
          const CustomDivider(),
          // part of gender
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: DropdownButtonFormField<String>(
              value: selectedGender,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.people, color: Colors.grey),
                labelText: AppLocalizations.of(context)!.gender,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              items: ["Male", "Female"]
                  .map((gender) => DropdownMenuItem<String>(
                        value: gender,
                        child: Text(gender),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value != null) selectedGender = value;
              },
              validator: (value) => value == null || value.isEmpty
                  ? AppLocalizations.of(context)!.enterYourData
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.createprofile,
          style: TextStyle(
              fontSize: 20.0.sp,
              fontFamily: "cairo",
              color: maintitlecolor,
              fontWeight: FontWeight.w700),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0.w, vertical: 20.0.h),
          child: Text(
            AppLocalizations.of(context)!.createprofileinfo,
            style: TextStyle(
                fontSize: 13.0.sp,
                fontFamily: "cairo",
                color: grey,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(top: 0, left: 0, child: CurvedLeftShadow()),
          const Positioned(top: 0, left: 0, child: CurvedLeft()),
          const Positioned(bottom: 0, left: 0, child: CurvedRightShadow()),
          const Positioned(bottom: 0, left: 0, child: CurvedRight()),
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 120.h),
                  buildHeader(context),
                  // curvedform(context),
                  CurvedForm(
                    formdata: buildSignupForm(context),
                  ),
                  //navigate to home
                  //slider button
                  SlideButton(
                    icon: Icons.arrow_forward_ios,
                    baseColor: const Color.fromARGB(255, 143, 189, 227),
                    text: AppLocalizations.of(context)!.slidebtn,
                    color: const Color.fromRGBO(227, 242, 253, 1),
                    onSlideFunction: () {
                      debugPrint("done");
                      if (formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text("Information submitted successfully!"),
                          ),
                        );
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RoutesName.home, // The route name for the home page
                          (Route<dynamic> route) =>
                              false, // Removes all previous routes
                        );
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
