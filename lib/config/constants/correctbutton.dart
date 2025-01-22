import 'package:flutter/material.dart';

class CorrectButton extends StatelessWidget {
  final GestureTapCallback? onclick;

  const CorrectButton({super.key, required this.onclick});

  @override
  Widget build(BuildContext context) {
    // Check the text direction of the current locale
    bool isRtl = Directionality.of(context) == TextDirection.rtl;

    return Positioned(
      top: 55,
      // Adjust position based on direction
      right: isRtl ? null : 10,
      left: isRtl ? 10 : null,
      child: GestureDetector(
        onTap: onclick,
        child: Container(
          padding: const EdgeInsets.all(15.0),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(94, 201, 202, 1.0),
                Color.fromRGBO(119, 235, 159, 1.0),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
              ),
            ],
          ),
          child: Icon(
            // Change icon direction based on text direction
            isRtl ? Icons.arrow_back : Icons.arrow_forward,
            size: 40.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
