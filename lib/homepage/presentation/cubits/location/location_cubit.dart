import 'package:eternal_calander/core/heleprs/print_helper.dart';
import 'package:eternal_calander/core/heleprs/snackbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  String? currentCity;
  Position? currentPosition;
  LocationCubit() : super(LocationInitial());

  Future<void> getCurrentLocation() async {
    const t = 'getCurrentLocation - LocationCubit';
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      pr('Location services are permenatly disabled.', t);
      showSnackbar(
          'Location Error', 'Location services are permenatly disabled.', true);
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      pr('Location services are denied.', t);
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showSnackbar(
            'Location Error', 'Location services are permenatly denied.', true);
        pr('Location services are permenatly denied.', t);
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      pr('Location permissions are permanently denied', t);
      showSnackbar(
          'Location Error', 'Location services are permenatly denied.', true);
      return;
    }

    currentPosition = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    ));
    await setLocaleIdentifier('ar');
    List<Placemark> placemarks = await placemarkFromCoordinates(
      currentPosition!.latitude,
      currentPosition!.longitude,
    );
    if (placemarks.isNotEmpty) {
      currentCity = placemarks.first.administrativeArea; // Get the city name
      emit(LocationSuccessState(currentCity ?? ''));
    }
  }
}
