part of 'location_cubit.dart';

sealed class LocationState {}

final class LocationInitial extends LocationState {}

final class LocationSuccessState extends LocationState {
  final String cityName;

  LocationSuccessState(this.cityName);
}
