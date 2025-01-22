import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/config/constants/core.dart';
import 'package:medicalassiss/config/constants/correctbutton.dart';
import 'package:medicalassiss/config/constants/password_textfield.dart';
import 'package:medicalassiss/config/constants/socialmedia.dart';
import 'package:medicalassiss/core/routing/routes_name.dart';
import 'package:medicalassiss/core/languagechanger/controller/language_change_controller.dart';
import 'package:medicalassiss/features/auth/components/check_box.dart';
import 'package:medicalassiss/features/auth/components/curved-form.dart';
import 'package:medicalassiss/features/auth/components/curved-left-shadow.dart';
import 'package:medicalassiss/features/auth/components/curved-left.dart';
import 'package:medicalassiss/features/auth/components/curved-right-shadow.dart';
import 'package:medicalassiss/features/auth/components/curved-right.dart';
import 'package:medicalassiss/features/auth/components/divider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String userSelected = "";

  // Function to build the email field
  Widget buildEmailField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: TextFormField(
        controller: emailController,
        style: TextStyle(
          fontSize: 15.0.sp,
          fontFamily: "cairo",
          color: Colors.black,
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
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppLocalizations.of(context)!.enterYourData;
          }
          return null;
        },
      ),
    );
  }

  // Function to build the password field
  Widget buildPasswordField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      child: PasswordBasicButton(
        hintTextField: AppLocalizations.of(context)!.password,
        iconName: Icons.lock,
        textEController: passwordController,
        onChangeFunc: (value) {},
      ),
    );
  }

  // Function to build the language switcher
  Widget buildLanguageSwitcher() {
    return Consumer<LanguageChangeController>(
      builder: (context, provider, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            provider.appLocale == 'en'
                ? ElevatedButton(
                    onPressed: () =>
                        provider.changeLanguage(const Locale('en')),
                    child: const Text("الانجليزية"),
                  )
                : TextButton(
                    onPressed: () =>
                        provider.changeLanguage(const Locale('en')),
                    child: Text(
                      "English",
                      style: TextStyle(
                          fontSize: 15.0.sp,
                          fontFamily: "cairo",
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
            SizedBox(width: 20.w),
            provider.appLocale == 'ar'
                ? ElevatedButton(
                    onPressed: () =>
                        provider.changeLanguage(const Locale('ar')),
                    child: const Text("Arabic"),
                  )
                : TextButton(
                    onPressed: () =>
                        provider.changeLanguage(const Locale('ar')),
                    child: Text(
                      "العربية",
                      style: TextStyle(
                          fontSize: 15.0.sp,
                          fontFamily: "cairo",
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
          ],
        );
      },
    );
  }

  // Function to build the login form
  Widget buildLoginForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          buildEmailField(),
          const CustomDivider(),
          buildPasswordField(),
        ],
      ),
    );
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
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 20.h),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: buildLanguageSwitcher(),
                      ),
                      Text(
                        AppLocalizations.of(context)!.helloworld,
                        style: TextStyle(
                            fontSize: 20.0.sp,
                            fontFamily: "cairo",
                            color: maintitlecolor,
                            fontWeight: FontWeight.w700),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 20.h),
                        child: Text(
                          AppLocalizations.of(context)!.signininfo,
                          style: TextStyle(
                              fontSize: 13.0.sp,
                              fontFamily: "cairo",
                              color: grey,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Stack(
                        children: [
                          CurvedForm(formdata: buildLoginForm()),
                          CorrectButton(
                            onclick: () {
                              if (formKey.currentState!.validate()) {
                                if (userSelected.isNotEmpty) {
                                  Navigator.pushNamed(
                                    context,
                                    RoutesName.userinfo,
                                    arguments: userSelected,
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
                      Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0.r, horizontal: 60.0.r),
                        child: Text(
                          AppLocalizations.of(context)!.forgetPassword,
                          style: TextStyle(
                              fontFamily: "cairo",
                              fontSize: 12.0.sp,
                              color: Colors.grey[400],
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      CheckBox(
                        option1Title: AppLocalizations.of(context)!.doctor,
                        option2Title: AppLocalizations.of(context)!.user,
                        onOptionSelected: (selectedOption) {
                          setState(() {
                            if (selectedOption ==
                                AppLocalizations.of(context)!.doctor) {
                              userSelected = "Doctor";
                            } else if (selectedOption ==
                                AppLocalizations.of(context)!.user) {
                              userSelected = "User";
                            }
                          });
                        },
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                  context, RoutesName.signup),
                              child: Container(
                                height: 50.0.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 20.0.r),
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
                                    AppLocalizations.of(context)!.signUP,
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
                          SizedBox(width: 60.w),
                          const Expanded(child: SocialMediaIcons()),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
