import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/config/constants/core.dart';
import 'package:medicalassiss/config/constants/correctbutton.dart';
import 'package:medicalassiss/config/constants/password_textfield.dart';
import 'package:medicalassiss/config/constants/socialmedia.dart';
import 'package:medicalassiss/core/routing/routes_name.dart';
import 'package:medicalassiss/features/auth/components/check_box.dart';
import 'package:medicalassiss/features/auth/components/curved-form.dart';
import 'package:medicalassiss/features/auth/components/curved-left-shadow.dart';
import 'package:medicalassiss/features/auth/components/curved-left.dart';
import 'package:medicalassiss/features/auth/components/curved-right-shadow.dart';
import 'package:medicalassiss/features/auth/components/curved-right.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:medicalassiss/features/auth/components/divider.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isDoctorSelected = false;
  bool isUserSelected = false;
  String userSelected = "";

  Widget buildSignupForm(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0.sp),
            child: TextFormField(
              controller: emailController,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0.sp,
                fontFamily: "cairo",
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email, color: Colors.grey),
                hintText: AppLocalizations.of(context)!.email,
                hintStyle: TextStyle(fontSize: 13.0.sp, color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 12.0.h,
                  horizontal: 16.0.w,
                ),
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.enterYourData;
                }
                return null;
              },
            ),
          ),
          const CustomDivider(),
          Padding(
            padding: EdgeInsets.all(10.0.sp),
            child: PasswordBasicButton(
              hintTextField: AppLocalizations.of(context)!.password,
              iconName: Icons.lock,
              textEController: passwordController,
              onChangeFunc: (_) {},
            ),
          ),
          const CustomDivider(),
          Padding(
            padding: EdgeInsets.all(10.0.sp),
            child: PasswordBasicButton(
              hintTextField: AppLocalizations.of(context)!.confirmPassword,
              iconName: Icons.lock,
              textEController: confirmPasswordController,
              onChangeFunc: (_) {},
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
          AppLocalizations.of(context)!.signUP,
          style: TextStyle(
            fontSize: 25.0.sp,
            fontFamily: "cairo",
            fontWeight: FontWeight.w700,
            color: maintitlecolor,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.h),
          child: Text(
            AppLocalizations.of(context)!.signininfo,
            style: TextStyle(
              fontSize: 13.0.sp,
              fontFamily: "cairo",
              fontWeight: FontWeight.w500,
              color: grey,
            ),
          ),
        ),
      ],
    );
  }

  void handleOptionSelected(String selectedOption) {
    setState(() {
      setState(() {
        if (selectedOption == "Doctor") {
          userSelected = "Doctor";
        } else if (selectedOption == "User") {
          userSelected = "User";
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isRtl = Directionality.of(context) == TextDirection.rtl;
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(top: 0, left: 0, child: CurvedLeftShadow()),
          const Positioned(top: 0, left: 0, child: CurvedLeft()),
          const Positioned(bottom: 0, left: 0, child: CurvedRightShadow()),
          const Positioned(bottom: 0, left: 0, child: CurvedRight()),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 120.h),
                  buildHeader(context),
                  Stack(
                    children: [
                      CurvedForm(
                        formdata: buildSignupForm(context),
                      ),
                      CorrectButton(
                        onclick: () {
                          if (formKey.currentState!.validate()) {
                            if (userSelected.isNotEmpty) {
                              Navigator.pushNamed(
                                context,
                                RoutesName.userinfo, // The route name
                                arguments:
                                    userSelected, // The string argument you want to pass
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Please select either Doctor or User'),
                                ),
                              );
                            }
                          }
                        },
                      ),
                    ],
                  ),
                  CheckBox(
                    option1Title: "Doctor",
                    option2Title: "User",
                    onOptionSelected: handleOptionSelected,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: 50.0.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26, blurRadius: 20.0.r),
                              ],
                              borderRadius: BorderRadius.only(
                                topLeft: isRtl
                                    ? Radius.circular(90.0.r)
                                    : Radius.zero,
                                bottomLeft: isRtl
                                    ? Radius.circular(90.0.r)
                                    : Radius.zero,
                                topRight: isRtl
                                    ? Radius.zero
                                    : Radius.circular(90.0.r),
                                bottomRight: isRtl
                                    ? Radius.zero
                                    : Radius.circular(90.0.r),
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                AppLocalizations.of(context)!.signIn,
                                style: TextStyle(
                                    fontSize: 16.0.sp,
                                    fontFamily: "cairo",
                                    color: maincolor,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 60.w), // Add spacing between the elements
                      const Expanded(
                        child: SocialMediaIcons(),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.w),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
