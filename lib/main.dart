import 'package:eternal_calander/core/globals.dart';
import 'package:eternal_calander/core/service_locator/service_locator.dart';
import 'package:eternal_calander/homepage/presentation/cubits/location/location_cubit.dart';
import 'package:eternal_calander/homepage/presentation/cubits/prayer_time/prayer_time_cubit.dart';
import 'package:eternal_calander/homepage/presentation/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl_standalone.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServiceLocator();
  await findSystemLocale();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => LocationCubit()..getCurrentLocation()),
          BlocProvider(create: (_) => PrayerTimeCubit(homeRepo: serviceLocator())),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          home: const HomepageScreen(),
        ),
      ),
    );
  }
}
