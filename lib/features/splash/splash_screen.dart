import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/core/routing/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> opacity;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        //5000
        duration: const Duration(milliseconds: 8000),
        vsync: this);
    opacity = Tween<double>(begin: 1.0, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward().then((_) {
      navigationPage();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // method for Sign In
  void navigationPage() async {
    Navigator.pushNamedAndRemoveUntil(
        context, RoutesName.onboarding, ((route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(42, 201, 240, 1),
      ),
      child: SafeArea(
        child: Center(
          child: DefaultTextStyle(
              style: TextStyle(
                fontSize: 35.sp,
                color: Colors.white,
                shadows: const [
                  Shadow(
                    blurRadius: 7.0,
                    color: Colors.white,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: const Text("DocConnect")),
        ),
      ),
    );
  }
}
