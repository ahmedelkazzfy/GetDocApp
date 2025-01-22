import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/config/constants/custom_dialog.dart';
import 'package:medicalassiss/config/constants/main_button.dart';
import 'package:medicalassiss/core/routing/routes_name.dart';
import 'package:medicalassiss/core/theming/colors.dart';
import 'package:medicalassiss/core/theming/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  void logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialog(
        isAnotherButton: true,
        backgroundColor: ColorManager.failureColor,
        title: "Logout",
        description: "Are you sure you want to logout",
        buttonText: "Okay",
        icon: Icons.info_outline_rounded,
        button: MainButton(
          text: "Yes",
          icon: Icons.done,
          iconColor: Colors.white,
          buttonColor: ColorManager.failureColor,
          func: () {
            Navigator.pushNamedAndRemoveUntil(
                context, RoutesName.login, ((route) => false));
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  // Color.fromARGB(204, 100, 228, 239),
                  ColorManager.successColor,
                  Color(0xFFE8F0F8),
                  Color(0xFFE8F0F8),
                  // Color.fromARGB(204, 30, 159, 171),
                ], // Gradient colors
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0).r,
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.profle,
                    style: TextStyles.appBarTextStyle,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  // Profile Picture Section
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 60.r,
                          backgroundImage: const AssetImage(
                            "assets/images/home/user_5.png", // Replace with your image path
                          ),
                        ),
                        Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorManager.successColor,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // User Information Section
                  Text(
                    'Ahmed Elkazafy',
                    style: TextStyles.appBarTextStyle,
                  ),

                  Text(
                    'ahmedelkazafy6@gmail.com',
                    style: TextStyles.headline3,
                  ),
                  SizedBox(height: 30.h),

                  // Settings Section (List of features)
                  _buildSettingItem(
                    context,
                    Icons.account_circle,
                    AppLocalizations.of(context)!.editprofile,
                    Colors.blue,
                  ),
                  _buildSettingItem(
                    context,
                    Icons.notifications,
                    AppLocalizations.of(context)!.notifications,
                    Colors.orange,
                  ),
                  _buildSettingItem(
                    context,
                    Icons.security,
                    AppLocalizations.of(context)!.privacysecurity,
                    Colors.purple,
                  ),
                  _buildSettingItem(
                    context,
                    Icons.help,
                    AppLocalizations.of(context)!.helpsupport,
                    Colors.teal,
                  ),
                  const SizedBox(height: 40),

                  // Logout Button

                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    height: 60.h,
                    child: MainButton(
                      icon: Icons.logout,
                      iconColor: Colors.white,
                      text: AppLocalizations.of(context)!.logout,
                      buttonColor: ColorManager.failureColor,
                      func: () {
                        logout(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem(
      BuildContext context, IconData icon, String title, Color iconColor) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 3),
      leading: Icon(
        icon,
        color: iconColor,
        size: 28,
      ),
      title: Text(
        title,
        style: TextStyles.headline1,
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: Colors.black54,
      ),
      onTap: () {
        // Handle tap action here for each item
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Tapped on $title')),
        );
      },
    );
  }
}
