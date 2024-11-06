import 'package:carousel_slider/carousel_slider.dart';
import 'package:eternal_calander/core/extensions/context-extensions.dart';
import 'package:eternal_calander/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextCarousel extends StatelessWidget {
  final List<String> textList = [
    'الجمعة 7 جماد الأول 1446\nالجمعة 8 نوفمبر 1446',
    'الجمعة 7 جماد الأول 1446\nالجمعة 8 نوفمبر 1446',
    'الجمعة 7 جماد الأول 1446\nالجمعة 8 نوفمبر 1446',
    'الجمعة 7 جماد الأول 1446\nالجمعة 8 نوفمبر 1446',
  ];

  TextCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      alignment: Alignment.center,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 50.h,
          enlargeCenterPage: true,
          autoPlay: false,
          // aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 1,
        ),
        items: textList.map((text) {
          return Builder(
            builder: (BuildContext context) {
              return SizedBox(
                // width: 300.w,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_back_ios, size: 30.w),
                    SizedBox(width: 5.w),
                    Container(
                      // width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Center(
                        child: txt(text, textAlign: TextAlign.center, e: St.reg14),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Icon(Icons.arrow_forward_ios, size: 30.w),
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
