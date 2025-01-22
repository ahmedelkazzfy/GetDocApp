import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/config/constants/slide_button.dart';
import 'package:medicalassiss/core/theming/colors.dart';
import 'package:medicalassiss/core/theming/styles.dart';
import 'package:medicalassiss/features/user_features/docots_details/data/doctor_list_data.dart';
import 'package:medicalassiss/features/user_features/doctor_confirm/ui/success_confirm.dart';
import 'package:medicalassiss/features/user_features/doctor_confirm/widgets/detail_appointment.dart';
import 'package:medicalassiss/features/user_features/doctor_info/widgets/doctor_card_info.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class ConfirmDoctor extends StatelessWidget {
  DoctorListData doctorData;
  ConfirmDoctor({super.key, required this.doctorData});

  Widget cardInfo() {
    return DoctorCardInfo(
      flex: 2,
      backgroundColor: const Color.fromARGB(255, 244, 248, 249),
      titleTxt: doctorData.titleTxt,
      subTxt: doctorData.titleTxt,
      imagePath: doctorData.imagePath,
      rating: doctorData.rating,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFeef2f3),
                Color.fromARGB(255, 184, 238, 245),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        title: Text(
          AppLocalizations.of(context)!.doctorConfirm,
          style: TextStyles.appBarTextStyle,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 184, 238, 245),
              Color.fromARGB(255, 187, 232, 239),
              Color(0xFFeef2f3),
              Color(0xFFeef2f3),
              Color(0xFFeef2f3),
              Color(0xFFeef2f3),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              cardInfo(),
              DetailAppointment(
                text1: AppLocalizations.of(context)!.datetime,
                subtext1: "Friday 15:00 Am",
                text2: AppLocalizations.of(context)!.location,
                subtext2: "Egypt ,15 wara mas3 alkarasi",
              ),
              Center(
                child: Text(
                  AppLocalizations.of(context)!.swipetoconfirm,
                  style: TextStyles.hintStyle.copyWith(
                    fontSize: 13.sp,
                    color: Colors.grey[400],
                  ),
                ),
              ),
              SlideButton(
                icon: Icons.arrow_forward_ios,
                baseColor: ColorManager.buttons,
                text: AppLocalizations.of(context)!.checkin,
                color: const Color.fromRGBO(227, 242, 253, 1),
                onSlideFunction: () {
                  debugPrint("done");

                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SuccessConfirm(),
                  ));
                },
              ),
            ],
          ),
        )),
      ),
    );
  }
}
