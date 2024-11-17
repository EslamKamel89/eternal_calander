import 'package:eternal_calander/core/widgets/custom_fading_widget.dart';
import 'package:eternal_calander/homepage/presentation/cubits/prayer_time/prayer_time_cubit.dart';
import 'package:eternal_calander/utils/assets/assets.dart';
import 'package:eternal_calander/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllPraysTimeWidget extends StatefulWidget {
  const AllPraysTimeWidget({
    super.key,
  });

  @override
  State<AllPraysTimeWidget> createState() => _AllPraysTimeWidgetState();
}

class _AllPraysTimeWidgetState extends State<AllPraysTimeWidget> {
  late final PrayerTimeCubit prayerTimeCubit;
  @override
  void initState() {
    prayerTimeCubit = context.read<PrayerTimeCubit>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
      buildWhen: (prev, current) => current is UpdatePrayerTimeState,
      builder: (context, state) {
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
                  PrayTimeWidget(
                    pray: 'العشاء',
                    imagePath: AssetsData.one,
                    prayTime: prayerTimeCubit.prayerTimesModel?.isha,
                  ),
                  PrayTimeWidget(
                    pray: 'المغرب',
                    imagePath: AssetsData.two,
                    prayTime: prayerTimeCubit.prayerTimesModel?.maghrib,
                  ),
                  PrayTimeWidget(
                    pray: 'العصر',
                    imagePath: AssetsData.three,
                    prayTime: prayerTimeCubit.prayerTimesModel?.asr,
                  ),
                  PrayTimeWidget(
                    pray: 'الظهر',
                    imagePath: AssetsData.four,
                    prayTime: prayerTimeCubit.prayerTimesModel?.dhuhr,
                  ),
                  PrayTimeWidget(
                    pray: 'الفجر',
                    imagePath: AssetsData.five,
                    prayTime: prayerTimeCubit.prayerTimesModel?.fajr,
                  ),
                  SizedBox(width: 5.w),
                ],
              ),
            ),
          ),
        );
      },
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
  final String? prayTime;
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
          prayTime == null
              ? CustomFadingWidget(
                  child: _buildImage(),
                )
              : _buildImage(),
          prayTime == null ? CustomFadingWidget(child: txt('00:00', e: St.reg14)) : txt(prayTime!, e: St.reg14),
        ],
      ),
    );
  }

  Container _buildImage() {
    return Container(
      width: 30.w,
      height: 30.w,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(),
      child: Image.asset(imagePath, fit: BoxFit.fill),
    );
  }
}
