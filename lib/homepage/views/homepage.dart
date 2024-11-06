import 'package:eternal_calander/core/widgets/default_scaffold.dart';
import 'package:eternal_calander/homepage/views/widgets/all_prays_time_widget.dart';
import 'package:eternal_calander/homepage/views/widgets/custom_button.dart';
import 'package:eternal_calander/homepage/views/widgets/custom_toggle_switch.dart';
import 'package:eternal_calander/homepage/views/widgets/date_selector.dart';
import 'package:eternal_calander/homepage/views/widgets/day_text_coursel.dart';
import 'package:eternal_calander/homepage/views/widgets/today_wisdom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15.h),
            TextCarousel(),
            SizedBox(height: 15.h),
            const AllPraysTimeWidget(),
            SizedBox(height: 15.h),
            const TodayWisdom(),
            SizedBox(height: 15.h),
            const CustomToggleSwitch(),
            SizedBox(height: 25.h),
            const DateSelector(),
            SizedBox(height: 30.h),
            const CustomButton(title: 'تحويل'),
          ],
        ),
      ),
    );
  }
}
