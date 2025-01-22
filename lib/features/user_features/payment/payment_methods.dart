import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/core/theming/colors.dart';
import 'package:medicalassiss/core/theming/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:medicalassiss/features/user_features/docots_details/data/doctor_list_data.dart';
import 'package:medicalassiss/features/user_features/payment/visa_payment.dart';

class PaymentMethodsScreen extends StatelessWidget {
  final DoctorListData doctorData;
  const PaymentMethodsScreen({super.key, required this.doctorData});

  // Mock payment methods data
  final List<Map<String, String>> paymentMethods = const [
    {'type': 'Visa', 'number': '**** **** **** 4978'},
    {'type': 'Mastercard', 'number': '**** **** **** 2478'},
    {'type': 'Instapay', 'number': 'Ahmed Elkazafy'},
    {'type': 'Electronic Wallet', 'number': 'eWallet ID: 987654321'},
  ];

  // Method to determine icon based on payment type
  IconData _getIconForPaymentType(String type) {
    switch (type) {
      case 'Visa':
      case 'Mastercard':
        return Icons.credit_card;
      case 'Instapay':
        return Icons.account_balance_wallet;
      case 'Electronic Wallet':
        return Icons.phone_android;
      default:
        return Icons.payment;
    }
  }

  // Widget to build a single payment method card
  Widget _buildPaymentCard(Map<String, String> method, BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 251, 244, 244),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60).r),
      margin: EdgeInsets.symmetric(vertical: 5.h),
      elevation: 4,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: ListTile(
          leading: Icon(
            _getIconForPaymentType(method['type']!),
            color: ColorManager.buttons,
            size: 40,
          ),
          title: Text(
            method['type']!,
            style: TextStyles.appBarTextStyle.copyWith(fontSize: 16),
          ),
          subtitle: Text(
            method['number']!,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: ColorManager.buttons,
          ),
          onTap: () {
            // This is where we handle the onTap logic and print the payment type
            switch (method['type']) {
              case 'Visa':
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PaymentPage(
                    doctorData: doctorData,
                  ),
                ));
                break;
              case 'Mastercard':
                debugPrint('Mastercard tapped');
                break;
              case 'Instapay':
                debugPrint('Instapay tapped');
                break;
              case 'Electronic Wallet':
                debugPrint('Electronic Wallet tapped');
                break;
              default:
                debugPrint('Unknown payment method tapped');
                break;
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 232, 232),
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
        backgroundColor: Colors.transparent,
        title: Text(
          AppLocalizations.of(context)!.paymetmethod,
          style: TextStyles.appBarTextStyle,
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFeef2f3),
              Color(0xFFeef2f3),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: paymentMethods.length,
          itemBuilder: (context, index) {
            return _buildPaymentCard(paymentMethods[index], context);
          },
        ),
      ),
    );
  }
}
