import 'package:eternal_calander/core/extensions/context-extensions.dart';
import 'package:eternal_calander/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TodayWisdom extends StatelessWidget {
  const TodayWisdom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        txt(
          'حكمة اليوم',
          googleFontCallback: GoogleFonts.reemKufi,
          c: Colors.deepPurpleAccent,
        ),
        SizedBox(height: 5.h),
        Container(
          width: context.width - 30.w,
          // height: 150,
          padding: EdgeInsets.symmetric(vertical: 5.h),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.blue, Colors.deepPurpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Center(
            child: txt(
              'ينام الحق أحيانا ... ولكن لا يموت',
              googleFontCallback: GoogleFonts.reemKufi,
              c: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
