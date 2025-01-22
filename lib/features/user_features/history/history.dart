import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:medicalassiss/core/theming/colors.dart';
import 'package:medicalassiss/core/theming/styles.dart';
import 'package:medicalassiss/features/user_features/history/widgets/reschedule_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  HistoryPageState createState() => HistoryPageState();
}

class HistoryPageState extends State<HistoryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: const Color.fromARGB(255, 35, 200, 156),'
        backgroundColor: const Color.fromARGB(255, 47, 210, 247),
        elevation: 1,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.history,
          style: TextStyles.appBarTextStyle,
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelStyle: TextStyles.headline1,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.white,
          labelStyle: TextStyles.headline1,
          tabs: [
            Tab(
              text: AppLocalizations.of(context)!.upcoming,
            ),
            Tab(
              text: AppLocalizations.of(context)!.complete,
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _upcomingAppointments(),
          _completedAppointments(),
        ],
      ),
    );
  }

  Widget _upcomingAppointments() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _doctorCard(
          name: 'Dr. Giovanni Bianchi',
          specialty: 'General Surgery',
          dateTime: DateTime(2025, 1, 20, 16, 0),
          location:
              'Bella Vista Surgery Clinic, Via Garibaldi 10, Milan, Italy',
          imagePath: 'assets/images/doctors/doctor5.jpg',
          isNotificationOn: true,
        ),
        const SizedBox(height: 16),
        _doctorCard(
          name: 'Dr. Luca Rossi',
          specialty: 'Cardiology Specialist',
          dateTime: DateTime(2025, 1, 22, 13, 0),
          location: 'Rossi Cardiology Clinic, Via Garibaldi 15, Milan, Italy',
          imagePath: 'assets/images/doctors/doctor1.jpg',
          isNotificationOn: false,
        ),
      ],
    );
  }

  Widget _completedAppointments() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _doctorCard(
          name: 'Dr. Giovanni Bianchi',
          specialty: 'General Surgery',
          dateTime: DateTime(2024, 2, 29, 16, 0),
          location:
              'Bella Vista Surgery Clinic, Via Garibaldi 10, Milan, Italy',
          imagePath: 'assets/images/doctors/doctor5.jpg',
          isNotificationOn: true,
          isCompleted: true,
        ),
      ],
    );
  }

  Widget _doctorCard({
    required String name,
    required String specialty,
    required DateTime dateTime,
    required String location,
    required String imagePath,
    bool isNotificationOn = false,
    bool isCompleted = false,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(20.0).r,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        specialty,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.access_time,
                              size: 20, color: Colors.grey),
                          const SizedBox(width: 5),
                          Text(
                            DateFormat('EEEE, dd MMM hh:mm a').format(dateTime),
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              size: 20, color: Colors.grey),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              location,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      _CountdownTimer(targetDateTime: dateTime),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                CircleAvatar(
                  backgroundImage: AssetImage(imagePath),
                  radius: 30,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    isNotificationOn ? 'Notifications On' : 'Notifications Off',
                    style: const TextStyle(color: Colors.blue),
                  ),
                ),
                ElevatedButton(
                  onPressed: () =>
                      _showBottomSheet(isCompleted ? 'review' : 'reschedule'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 47, 210, 247),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text(
                    isCompleted
                        ? AppLocalizations.of(context)!.addreview
                        : AppLocalizations.of(context)!.reschedule,
                    style: TextStyles.headline1.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(String type) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        if (type == 'reschedule') {
          return const RescheduleSheet();
        } else {
          return _reviewSheet();
        }
      },
    );
  }

  Widget _reviewSheet() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.addreview,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Row(
            children: List.generate(5,
                (index) => const Icon(Icons.star_border, color: Colors.amber)),
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Write your review',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Submit Review'),
          )
        ],
      ),
    );
  }
}

class _CountdownTimer extends StatefulWidget {
  final DateTime targetDateTime;

  const _CountdownTimer({required this.targetDateTime});

  @override
  State<_CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<_CountdownTimer> {
  late Timer _timer;
  Duration _remainingTime = Duration.zero;

  @override
  void initState() {
    super.initState();
    _updateRemainingTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateRemainingTime();
    });
  }

  void _updateRemainingTime() {
    final now = DateTime.now();
    setState(() {
      _remainingTime = widget.targetDateTime.difference(now);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isExpired = _remainingTime.isNegative;
    final color = isExpired ? Colors.red : Colors.green;

    return Text(
      _formatDuration(_remainingTime),
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }

  String _formatDuration(Duration duration) {
    if (duration.isNegative) {
      return 'Expired';
    }
    final days = duration.inDays;
    final hours = duration.inHours % 24;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;
    return '$days days, $hours h, $minutes m, $seconds s';
  }
}
