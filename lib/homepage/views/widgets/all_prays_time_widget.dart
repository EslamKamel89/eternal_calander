import 'package:eternal_calander/utils/assets/assets.dart';
import 'package:eternal_calander/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllPraysTimeWidget extends StatelessWidget {
  const AllPraysTimeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Material(
        borderRadius: BorderRadius.circular(15.w),
        elevation: 2,
        shadowColor: Colors.grey.withOpacity(0.3),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.w),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 5.w),
              const PrayTimeWidget(pray: 'العشاء', imagePath: AssetsData.one, prayTime: '18:24'),
              const PrayTimeWidget(pray: 'المغرب', imagePath: AssetsData.two, prayTime: '17:06'),
              const PrayTimeWidget(pray: 'العصر', imagePath: AssetsData.three, prayTime: '14:52'),
              const PrayTimeWidget(pray: 'الظهر', imagePath: AssetsData.four, prayTime: '11:40'),
              const PrayTimeWidget(pray: 'الفجر', imagePath: AssetsData.five, prayTime: '04:52'),
              SizedBox(width: 5.w),
            ],
          ),
        ),
      ),
    );
  }
}

class PrayTimeWidget extends StatelessWidget {
  const PrayTimeWidget({
    super.key,
    required this.pray,
    required this.imagePath,
    required this.prayTime,
  });
  final String pray;
  final String prayTime;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      // color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          txt(pray),
          Container(
            width: 30.w,
            height: 30.w,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(),
            child: Image.asset(imagePath, fit: BoxFit.fill),
          ),
          txt(prayTime, e: St.reg14),
        ],
      ),
    );
  }
}
