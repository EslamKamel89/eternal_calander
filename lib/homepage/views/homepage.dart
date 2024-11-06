import 'package:eternal_calander/core/extensions/context-extensions.dart';
import 'package:eternal_calander/core/widgets/default_scaffold.dart';
import 'package:eternal_calander/homepage/views/widgets/all_prays_time_widget.dart';
import 'package:eternal_calander/homepage/views/widgets/custom_toggle_switch.dart';
import 'package:eternal_calander/homepage/views/widgets/day_text_coursel.dart';
import 'package:eternal_calander/homepage/views/widgets/today_wisdom.dart';
import 'package:eternal_calander/utils/styles/styles.dart';
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
            Row(
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
            ),
            SizedBox(height: 30.h),
            const CustomButton(title: 'تحويل'),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width - 50,
      child: ElevatedButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shadowColor: Colors.blueAccent,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class CustomDropDownSelector extends StatelessWidget {
  const CustomDropDownSelector({super.key, required this.items, required this.title});
  final List<String> items;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
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

class DropdownSelector extends StatefulWidget {
  const DropdownSelector({super.key, required this.items});
  final List<String> items;
  @override
  createState() => _DropdownSelectorState();
}

class _DropdownSelectorState extends State<DropdownSelector> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      // hint: const Text('Select an option'),
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue!;
        });
      },
      items: widget.items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
