import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/core/theming/styles.dart';
import 'package:medicalassiss/features/user_features/docots_details/data/doctor_list_data.dart';
import 'package:medicalassiss/features/user_features/docots_details/widgets/card_details.dart';

class DoctorListView extends StatelessWidget {
  const DoctorListView({super.key, this.index, this.hotelData, this.callback});
  final int? index;
  final VoidCallback? callback;
  final DoctorListData? hotelData;

  @override
  Widget build(BuildContext context) {
    bool isRtl = Directionality.of(context) == TextDirection.rtl;
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16).r,
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: callback,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(60.0)).r,
            boxShadow: <BoxShadow>[
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.grey.withOpacity(0.3),
                offset: const Offset(1, 1),
                blurRadius: 20.r,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            child: Column(
              children: <Widget>[
                // image
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft:
                              isRtl ? Radius.zero : const Radius.circular(50.0),
                          bottomLeft:
                              isRtl ? const Radius.circular(50.0) : Radius.zero,
                          topRight:
                              isRtl ? const Radius.circular(50.0) : Radius.zero,
                          bottomRight: isRtl
                              ? Radius.zero
                              : const Radius.circular(50.0)),
                      child: Image.asset(
                        hotelData!.imagePath,
                        fit: BoxFit.cover,
                        height: 130.h,
                        width: 100.w,
                      ),
                    ),

                    // SizedBox(width: 50.w),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0).r,
                        child: Text(
                          "Dr. Alice Carter is a board-certified cardiologist with over a decade of experience specializing in approach and her.",
                          style: TextStyles.secondhintStyle,
                        ),
                      ),
                    ),
                  ],
                ),
                //card details
                CardDetails(
                  title: hotelData!.titleTxt,
                  subTitle: hotelData!.subTxt,
                  reviews: hotelData!.reviews,
                  rating: hotelData!.rating,
                  location: "New Assuit",
                  distance: "245",
                  perNight: hotelData!.perNight,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
