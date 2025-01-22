import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/core/theming/colors.dart';
import 'package:medicalassiss/core/theming/styles.dart';
import 'package:medicalassiss/features/user_features/docots_details/data/doctor_list_data.dart';
import 'package:medicalassiss/features/user_features/doctor_info/widgets/doctor_card_info.dart';
import 'package:medicalassiss/features/user_features/doctor_info/widgets/review_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:medicalassiss/features/user_features/payment/payment_methods.dart';

class DoctorInfoView extends StatefulWidget {
  final DoctorListData doctorData;
  const DoctorInfoView({super.key, required this.doctorData});

  @override
  State<DoctorInfoView> createState() => _DoctorInfoViewState();
}

class _DoctorInfoViewState extends State<DoctorInfoView> {
  DateTime _focusedDate = DateTime.now();
  List<String> _availableHours = [];
  String? _selectedHour; // State to track the selected hour.

  @override
  void initState() {
    super.initState();
    _updateAvailableHours(
        _focusedDate); // Initialize with the current date's hours.
  }

  void _updateAvailableHours(DateTime date) {
    // Simulate fetching available hours for the selected date.
    setState(() {
      _availableHours = List.generate(
        12,
        (index) =>
            "${index + 8}:00 ${index < 4 ? "AM" : "PM"}", // Example: 8:00 AM to 8:00 PM.
      );
    });
  }

  Widget cardInfo() {
    return DoctorCardInfo(
      flex: 2,
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      titleTxt: widget.doctorData.titleTxt,
      subTxt: widget.doctorData.titleTxt,
      imagePath: widget.doctorData.imagePath,
      rating: widget.doctorData.rating,
    );
  }

  Widget about() {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.bio,
          style: TextStyles.headline1,
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Center(
            child: Text(
              "Dr. Alice Carter is a board-certified cardiologist with over a decade of experience specializing in the treatment of heart-related conditions. She is known for her patient-centric approach and her ability to explain complex medical issues in an easy-to-understand manner. She has received numerous awards for excellence in patient care and is actively involved in research on preventative cardiology.",
              style: TextStyles.secondhintStyle,
            ),
          ),
        )
      ],
    );
  }

  Widget calenderSection() {
    return Column(
      children: [
        // EasyDateTimeLinePicker Widget
        EasyTheme(
          data: EasyTheme.of(context).copyWithState(
            selectedDayTheme: DayThemeData(
              backgroundColor: ColorManager.buttons,
            ),
            selectedCurrentDayTheme: DayThemeData(
              backgroundColor: ColorManager.buttons,
            ),
            unselectedDayTheme: DayThemeData(
              // backgroundColor: Colors.blue[50],
              backgroundColor: Colors.grey[100],
            ),
            disabledDayTheme: const DayThemeData(
              backgroundColor: Color.fromARGB(255, 127, 28, 28),
            ),
          ),
          child: EasyDateTimeLinePicker(
            focusedDate: _focusedDate,
            firstDate: DateTime(2024, 1, 1),
            lastDate: DateTime(2030, 1, 1),
            onDateChange: (date) {
              setState(() {
                _focusedDate = date; // Update the selected date.
              });
              _updateAvailableHours(date); // Fetch hours for the new date.
            },
          ),
        ),
        divider(),
        // Hours Section
        _availableHours.isEmpty
            ? const Center(
                child: Text("No available hours for this date."),
              )
            : SizedBox(
                height: 260.h,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0).r,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 16.h,
                    ),
                    itemCount: _availableHours.length,
                    itemBuilder: (context, index) {
                      final hour = _availableHours[index];
                      final isSelected = hour == _selectedHour;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedHour = hour; // Update the selected hour.
                          });

                          // Show a message
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   SnackBar(content: Text("Selected hour: $hour")),
                          // );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? ColorManager.buttons
                                : Colors.grey[100],
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 2.r,
                                offset: const Offset(1, 2),
                              ),
                            ],
                            border: Border.all(
                              color: const Color.fromARGB(255, 222, 222, 222),
                              width: 1,
                            ),
                          ),
                          child: isSelected
                              ? Text(
                                  hour,
                                  style: TextStyle(
                                    color: Colors.grey[100],
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Text(
                                  hour,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      );
                    },
                  ),
                ),
              ),
      ],
    );
  }

  Widget divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40).r,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorManager.customBorder,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            AppLocalizations.of(context)!.availablehours,
            style: TextStyles.headline1,
          ),
        ],
      ),
    );
  }

  Widget reviews() {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.reviews,
          style: TextStyles.headline1,
        ),
        // Title of the review section

        SizedBox(height: 30.h),

        // Horizontal scrollable list of review cards
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ReviewCard(
                  name: 'John Doe', rating: 5, comment: 'Great product!'),
              ReviewCard(
                  name: 'Jane Smith',
                  rating: 4,
                  comment: 'Very useful, but could improve.'),
              ReviewCard(
                  name: 'Alex Brown',
                  rating: 3,
                  comment: 'It’s okay, does the job.'),
              ReviewCard(
                  name: 'Emily White',
                  rating: 4,
                  comment: 'Good quality for the price.'),
            ],
          ),
        ),
      ],
    );
  }

  Widget bookingAndChatButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: GestureDetector(
              child: Container(
                height: 50.h,
                decoration: BoxDecoration(
                  color: Colors.white, // Button background
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: ColorManager.buttons,
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chat_outlined,
                      color: ColorManager.buttons,
                    ),
                    const SizedBox(width: 8),
                    Text(AppLocalizations.of(context)!.chat,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w900,
                          color: ColorManager.buttons,
                        )),
                  ],
                ),
              ),
              onTap: () {},
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            flex: 6,
            child: GestureDetector(
              child: Container(
                height: 50.h,
                decoration: BoxDecoration(
                  color: ColorManager.buttons, // Button background
                  borderRadius: BorderRadius.circular(30), // Rounded corners
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 8),
                    Text(AppLocalizations.of(context)!.bookApoint,
                        style: TextStyles.mainheadline),
                  ],
                ),
              ),
              onTap: () {
                // Navigator.pushNamed(context, RoutesName.doctorsConfirm);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PaymentMethodsScreen(
                    doctorData: widget.doctorData,
                  ),
                ));
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => PaymentPage(
                //     doctorData: widget.doctorData,
                //   ),
                // ));
              },
            ),
          ),
        ],
      ),
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
                Color.fromARGB(255, 187, 232, 239),
                Color(0xFFeef2f3),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share),
            ),
          )
        ],
        title: Text(
          AppLocalizations.of(context)!.docInfo,
          style: TextStyles.appBarTextStyle,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
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
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                cardInfo(),
                about(),
                calenderSection(),
                reviews(),
                bookingAndChatButtons(),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
