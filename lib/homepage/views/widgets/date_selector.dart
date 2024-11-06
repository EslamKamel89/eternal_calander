import 'package:eternal_calander/homepage/views/widgets/custom_dropdown_selector.dart';
import 'package:flutter/material.dart';

class DateSelector extends StatelessWidget {
  const DateSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomDropDownSelector(
          items: List.generate(20, (index) => (index + 2000).toString()),
          title: 'السنة',
        ),
        CustomDropDownSelector(
          items: List.generate(12, (index) => (index + 1).toString()),
          title: 'الشهر',
        ),
        CustomDropDownSelector(
          items: List.generate(30, (index) => (index + 1).toString()),
          title: 'اليوم',
        ),
      ],
    );
  }
}
