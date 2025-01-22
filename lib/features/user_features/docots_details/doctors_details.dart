import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/core/theming/styles.dart';
import 'package:medicalassiss/features/user_features/docots_details/data/doctor_list_data.dart';
import 'package:medicalassiss/features/user_features/docots_details/widgets/doctor_list_view.dart';
import 'package:medicalassiss/features/user_features/doctor_info/doctor_info.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class DoctorsDetails extends StatelessWidget {
  List<DoctorListData> hotelList = DoctorListData.hotelList;
  DoctorsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 187, 232, 239),
                Color(0xFFeef2f3),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        title: Text(AppLocalizations.of(context)!.doctors,
            style: TextStyles.font11darkblueBold.copyWith(
              fontSize: 20.sp,
            )),
        centerTitle: true,
        backgroundColor: const Color(0xFFeef2f3),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFeef2f3),
              Color(0xFFeef2f3),
              Color(0xFFeef2f3),
              Color(0xFFeef2f3),
              Color.fromARGB(255, 187, 232, 239),
              Color.fromARGB(255, 184, 238, 245),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: hotelList.length,
          padding: const EdgeInsets.only(top: 8),
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return DoctorListView(
              callback: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DoctorInfoView(
                    doctorData: hotelList[index],
                  ),
                ));
              },
              index: index,
              hotelData: hotelList[index],
            );
          },
        ),
      ),
    );
  }
}
