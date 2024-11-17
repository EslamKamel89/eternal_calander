import 'dart:async';

import 'package:eternal_calander/core/extensions/context-extensions.dart';
import 'package:eternal_calander/core/widgets/custom_fading_widget.dart';
import 'package:eternal_calander/homepage/presentation/cubits/location/location_cubit.dart';
import 'package:eternal_calander/homepage/presentation/cubits/prayer_time/prayer_time_cubit.dart';
import 'package:eternal_calander/utils/assets/assets.dart';
import 'package:eternal_calander/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultScaffold extends StatefulWidget {
  const DefaultScaffold({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  State<DefaultScaffold> createState() => _DefaultScaffoldState();
}

class _DefaultScaffoldState extends State<DefaultScaffold> {
  late final PrayerTimeCubit prayerTimeCubit;
  late Timer timer;
  @override
  void initState() {
    prayerTimeCubit = context.read<PrayerTimeCubit>();
    timer = Timer.periodic(const Duration(minutes: 1), (Timer timer) {
      prayerTimeCubit.getNextPrayer();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(width: context.width, height: context.height, color: Colors.transparent),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 200.h,
                child: Image.asset(
                  AssetsData.moon,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              right: 30.w,
              top: 30.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Icon(Icons.settings, color: Colors.white),
                  SizedBox(height: 5.h),
                  BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
                    buildWhen: (previous, current) => current is UpdateNextPrayerTimeState,
                    builder: (context, state) {
                      if (state is UpdateNextPrayerTimeState && prayerTimeCubit.nextPrayer.length == 3) {
                        return Column(
                          children: [
                            txt('${prayerTimeCubit.nextPrayer[0]} بعد', c: Colors.white, e: St.semi25),
                            txt(' ${prayerTimeCubit.nextPrayer[1]} : ${prayerTimeCubit.nextPrayer[2]} : 00',
                                c: Colors.white, e: St.semi18),
                          ],
                        );
                      }
                      return CustomFadingWidget(
                        child: Column(
                          children: [
                            txt('رجاء الأنتظار', c: Colors.white, e: St.semi25),
                            txt(' 00 : 00 : 00', c: Colors.white, e: St.semi18),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 10.h),
                  BlocBuilder<LocationCubit, LocationState>(
                    builder: (context, state) {
                      if (state is LocationSuccessState && state.cityName != '') {
                        return Row(
                          children: [
                            const Icon(Icons.location_on, color: Colors.red),
                            txt(state.cityName, c: Colors.white, e: St.reg14),
                          ],
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: context.width,
                height: 500.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.w),
                    topRight: Radius.circular(20.w),
                  ),
                ),
                alignment: Alignment.topCenter,
                child: widget.child,
              ),
            )
          ],
        ),
      ),
    );
  }
}
