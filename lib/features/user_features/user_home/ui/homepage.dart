import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/core/theming/styles.dart';
import 'package:medicalassiss/features/user_features/quiz/quiz_page.dart';
import 'package:medicalassiss/features/user_features/test/quiz_page.dart';
import 'package:medicalassiss/features/user_features/user_home/widgets/mcard.dart';
import 'package:medicalassiss/core/routing/routes_name.dart';
import 'package:medicalassiss/features/user_features/doctor_info/widgets/doctor_card_info.dart';
import 'package:medicalassiss/features/user_features/user_home/widgets/grid_card_view.dart';
import 'package:medicalassiss/features/user_features/user_home/widgets/image_slider.dart';
import 'package:medicalassiss/features/user_features/user_home/widgets/options_btns.dart';
import 'package:medicalassiss/features/user_features/user_home/widgets/searchbar.dart';
import 'package:medicalassiss/features/user_features/user_home/widgets/section_title.dart';
import 'package:medicalassiss/features/user_features/user_home/widgets/user_dashboard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFeef2f3), Color(0xFFd3d3d3)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: FadeIn(
              duration: const Duration(milliseconds: 1000),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      //profile info and current date section
                      const UserDashboard(),
                      MainCard(
                        title: "MediBot",
                        buttonText: AppLocalizations.of(context)!.mediBotButton,
                        description:
                            AppLocalizations.of(context)!.mediBotdescription,
                        func: () {
                          Navigator.pushNamed(context, RoutesName.chatbot);
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),

                  // Search Bar
                  const SearchBarUi(),

                  SizedBox(height: 20.h),
                  // Upcoming Appointments Section
                  SectionTitle(
                    title: AppLocalizations.of(context)!.upcomingappointments,
                  ),
                  Divider(
                    endIndent: MediaQuery.of(context).size.height / 3,
                  ),
                  SizedBox(height: 10.h),
                  DoctorCardInfo(
                    flex: 2,
                    backgroundColor: const Color.fromARGB(255, 220, 217, 217),
                    titleTxt: "Dr. Marium Mohamed",
                    subTxt: "Specialist Heart Surgery",
                    imagePath: "assets/images/doctors/doctor5.jpg",
                    rating: 5,
                  ),

                  // Features Section
                  SectionTitle(
                    title: AppLocalizations.of(context)!.features,
                  ),
                  Divider(
                    endIndent: MediaQuery.of(context).size.height / 3,
                  ),
                  const OptionsCategories(),
                  SizedBox(height: 20.h),

                  // ListTile(
                  //   title: const Text("smart test"),
                  //   leading: const Icon(Icons.arrow_forward_ios),
                  //   onTap: () {
                  //     Navigator.of(context).push(
                  //       MaterialPageRoute(
                  //         builder: (context) => const QuizPage(),
                  //       ),
                  //     );
                  //   },
                  // ),
                  // Image Slider Section
                  SectionTitle(
                    title: AppLocalizations.of(context)!.topdoctors,
                  ),
                  Divider(
                    endIndent: MediaQuery.of(context).size.height / 3,
                  ),
                  SizedBox(height: 10.h),
                  const ImageSlider(),
                  SizedBox(height: 20.h),
                  // Grid View Section
                  SectionTitle(
                    title: AppLocalizations.of(context)!.moreoptions,
                  ),
                  Divider(
                    endIndent: MediaQuery.of(context).size.height / 3,
                  ),

                  ListTile(
                    title: Text(
                      AppLocalizations.of(context)!.smartquiz,
                      style: TextStyles.font11darkblueBold
                          .copyWith(fontSize: 14.sp),
                    ), // Text on the left
                    subtitle: Text(
                      AppLocalizations.of(context)!.quizdescribtion,
                      style: TextStyles.hintStyle.copyWith(
                        fontSize: 11.sp,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                          Icons.arrow_forward_ios), // Icon on the right
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const QuizPage2(),
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 5.h),
                  const GridCardView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
