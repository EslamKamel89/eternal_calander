import 'package:carousel_slider/carousel_slider.dart';
import 'package:eternal_calander/core/extensions/context-extensions.dart';
import 'package:eternal_calander/core/heleprs/format_date.dart';
import 'package:eternal_calander/homepage/presentation/cubits/prayer_time/prayer_time_cubit.dart';
import 'package:eternal_calander/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextCarousel extends StatefulWidget {
  const TextCarousel({super.key});

  @override
  State<TextCarousel> createState() => _TextCarouselState();
}

class _TextCarouselState extends State<TextCarousel> {
  late PrayerTimeCubit prayerTimeCubit;
  @override
  void initState() {
    prayerTimeCubit = context.read<PrayerTimeCubit>()..generateDateList();
    super.initState();
  }

  // ];
  final CarouselSliderController _carouselController = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
      builder: (context, state) {
        return Container(
          width: context.width,
          alignment: Alignment.center,
          child: CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              initialPage: prayerTimeCubit.todayIndex,
              height: 50.h,

              enlargeCenterPage: true,
              autoPlay: false,
              // aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 1,
              reverse: true,
              onPageChanged: (index, CarouselPageChangedReason reason) {
                prayerTimeCubit.setSelectedDate(prayerTimeCubit.dateList[index]);
                prayerTimeCubit.getPrayerTimes();
              },
            ),
            items: prayerTimeCubit.dateList.map((dateTime) {
              return Builder(
                builder: (BuildContext context) {
                  return SizedBox(
                    // width: 300.w,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            _carouselController.nextPage();
                          },
                          icon: Icon(Icons.arrow_back_ios, size: 30.w),
                        ),
                        SizedBox(width: 5.w),
                        Container(
                          // width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Center(
                            child: txt(formateDateToArabic(dateTime), textAlign: TextAlign.center, e: St.reg14),
                          ),
                        ),
                        SizedBox(width: 5.w),
                        IconButton(
                            onPressed: () {
                              _carouselController.previousPage();
                            },
                            icon: Icon(Icons.arrow_forward_ios, size: 30.w)),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
