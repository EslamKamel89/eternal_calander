import 'package:eternal_calander/core/widgets/default_scaffold.dart';
import 'package:eternal_calander/homepage/presentation/cubits/location/location_cubit.dart';
import 'package:eternal_calander/homepage/presentation/cubits/prayer_time/prayer_time_cubit.dart';
import 'package:eternal_calander/homepage/presentation/views/widgets/all_prays_time_widget.dart';
import 'package:eternal_calander/homepage/presentation/views/widgets/custom_button.dart';
import 'package:eternal_calander/homepage/presentation/views/widgets/custom_toggle_switch.dart';
import 'package:eternal_calander/homepage/presentation/views/widgets/date_selector.dart';
import 'package:eternal_calander/homepage/presentation/views/widgets/day_text_coursel.dart';
import 'package:eternal_calander/homepage/presentation/views/widgets/today_wisdom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LocationCubit, LocationState>(
          listener: (context, state) {
            if (state is LocationSuccessState) {
              context.read<PrayerTimeCubit>().getPrayerTimes();
            }
          },
          child: Container(),
        )
      ],
      child: DefaultScaffold(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15.h),
              const TextCarousel(),
              SizedBox(height: 15.h),
              const AllPraysTimeWidget(),
              SizedBox(height: 15.h),
              const TodayWisdom(),
              SizedBox(height: 15.h),
              const CustomToggleSwitch(),
              SizedBox(height: 25.h),
              const DateSelector(),
              SizedBox(height: 30.h),
              const CustomButton(title: 'تحويل'),
            ],
          ),
        ),
      ),
    );
  }
}

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  LocationScreenState createState() => LocationScreenState();
}

class LocationScreenState extends State<LocationScreen> {
  String? _currentCity;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever
      return Future.error('Location permissions are permanently denied');
    }

    // Get current position
    Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    ));

    // Get place details using the Geocoding package
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    if (placemarks.isNotEmpty) {
      setState(() {
        _currentCity = placemarks.first.locality; // Get the city name
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Current Location')),
      body: Center(
        child: _currentCity == null ? const CircularProgressIndicator() : Text('Current City: $_currentCity'),
      ),
    );
  }
}
