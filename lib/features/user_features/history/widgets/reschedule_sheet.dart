import 'package:flutter/material.dart';
import 'package:medicalassiss/core/theming/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RescheduleSheet extends StatelessWidget {
  const RescheduleSheet({super.key});

  Widget _timeChip(String time) {
    return Chip(
      label: Text(time),
      backgroundColor: Colors.blue[100],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppLocalizations.of(context)!.rescheduleappointment,
            style: TextStyles.appBarTextStyle,
          ),
          const SizedBox(height: 16),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _timeChip('9.00 AM'),
              _timeChip('10.00 AM'),
              // _timeChip('1.00 PM'),
              // _timeChip('2.00 PM'),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              AppLocalizations.of(context)!.reschedule,
            ),
          )
        ],
      ),
    );
  }
}
