import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/core/routing/routes_name.dart';
import 'package:medicalassiss/features/user_features/user_home/widgets/option_icon.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OptionsCategories extends StatelessWidget {
  const OptionsCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: OptionIcon(
                title: AppLocalizations.of(context)!.history,
                imagePath: "assets/images/home/clock-svgrepo.svg",
                onclick: () {
                  debugPrint("Ahmed");
                  Navigator.pushNamed(context, RoutesName.history);
                },
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Expanded(
              flex: 2,
              child: OptionIcon(
                title: AppLocalizations.of(context)!.nearestdoctor,
                imagePath: "assets/images/doctors/doctor_icon.svg",
                onclick: () {
                  debugPrint("Ahmed");
                  Navigator.pushNamed(context, RoutesName.doctorsDetails);
                },
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Expanded(
              flex: 2,
              child: OptionIcon(
                title: AppLocalizations.of(context)!.hospitals,
                imagePath: "assets/images/doctors/hospital-svgrep.svg",
                onclick: () {},
              ),
            ),
          ],
        ));
  }
}
