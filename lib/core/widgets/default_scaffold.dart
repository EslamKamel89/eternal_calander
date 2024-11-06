import 'package:eternal_calander/core/extensions/context-extensions.dart';
import 'package:eternal_calander/utils/assets/assets.dart';
import 'package:eternal_calander/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultScaffold extends StatelessWidget {
  const DefaultScaffold({
    super.key,
    required this.child,
  });
  final Widget child;
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
                  txt('الظهر بعد', c: Colors.white, e: St.semi25),
                  txt('00 : 25 : 49', c: Colors.white, e: St.semi18),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.red),
                      txt('المنصورة (قسم ثاني)', c: Colors.white, e: St.reg14),
                    ],
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
                child: child,
              ),
            )
          ],
        ),
      ),
    );
  }
}
