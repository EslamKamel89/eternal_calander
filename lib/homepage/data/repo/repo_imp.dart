import 'package:dartz/dartz.dart';
import 'package:eternal_calander/core/Errors/failure.dart';
import 'package:eternal_calander/core/heleprs/print_helper.dart';
import 'package:eternal_calander/homepage/data/data_source/home_remote_data_source.dart';
import 'package:eternal_calander/homepage/domain/models/prayer_times_day.dart';
import 'package:eternal_calander/homepage/domain/repo/repo.dart';
import 'package:geolocator/geolocator.dart';

class HomeRepoImp implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImp({required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, PrayerTimesModel>> getPrayerTimes(
      {required Position position, required DateTime dateTime}) async {
    final t = pr('getPrayerTimes - HomeRepoImp');
    try {
      PrayerTimesModel prayerTimes = await homeRemoteDataSource.getPrayerTimes(position: position, dateTime: dateTime);
      pr(prayerTimes, t);
      return Right(prayerTimes);
    } catch (e) {
      pr('Exception occured: $e');
      return Left(ServerFailure.unkownError());
    }
  }
}
