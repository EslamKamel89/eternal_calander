import 'package:eternal_calander/core/extensions/context-extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomToggleSwitch extends StatefulWidget {
  const CustomToggleSwitch({super.key});
  @override
  createState() => _CustomToggleSwitchState();
}

class _CustomToggleSwitchState extends State<CustomToggleSwitch> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isActive = !isActive;
        });
      },
      child: Container(
        width: context.width - 25.w,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: isActive ? Colors.blue : Colors.deepPurpleAccent,
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeIn,
              left: isActive ? 150.0 : 0.0,
              right: isActive ? 0.0 : 150.0,
              child: Container(
                // width: 60.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.black.withOpacity(0.7),
                ),
                alignment: Alignment.center,
                child: Text(
                  isActive ? 'من الهجري للميلادي' : 'من الميلادي للهجري',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Center(
            //   child: Text(
            //     isActive ? 'ON' : 'OFF',
            //     style: const TextStyle(
            //       color: Colors.white,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
