import 'package:dartz/dartz.dart';
import 'package:eternal_calander/core/Errors/failure.dart';
import 'package:eternal_calander/homepage/domain/models/prayer_times_day.dart';
import 'package:geolocator/geolocator.dart';

abstract class HomeRepo {
  Future<Either<Failure, PrayerTimesModel>> getPrayerTimes({required Position position, required DateTime dateTime});
}
