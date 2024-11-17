import 'package:eternal_calander/homepage/presentation/views/widgets/dropdown_selector.dart';
import 'package:eternal_calander/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDownSelector extends StatelessWidget {
  const CustomDropDownSelector(
      {super.key, required this.items, required this.title});
  final List<String> items;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 25.w),
        child: Column(
          children: [
            txt(title),
            DropdownSelector(items: items),
          ],
        ),
      ),
    );
  }
}
