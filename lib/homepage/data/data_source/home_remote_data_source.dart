import 'package:eternal_calander/core/api_service/api_consumer.dart';
import 'package:eternal_calander/core/api_service/end_points.dart';
import 'package:eternal_calander/core/heleprs/format_date.dart';
import 'package:eternal_calander/core/heleprs/print_helper.dart';
import 'package:eternal_calander/homepage/domain/models/prayer_times_day.dart';
import 'package:geolocator/geolocator.dart';

class HomeRemoteDataSource {
  final ApiConsumer api;

  HomeRemoteDataSource({required this.api});
  Future<PrayerTimesModel> getPrayerTimes({required Position position, required DateTime dateTime}) async {
    final t = pr('getPrayerTimes - HomeRemoteDataSource');
    final data = await api.get(
      EndPoint.prayerTimes(formatDateForApi(dateTime)),
      queryParameter: {
        'latitude': position.latitude,
        'longitude': position.longitude,
      },
    );
    pr(data, '$t - raw data');
    PrayerTimesModel prayerTimes = PrayerTimesModel.fromJson(data['data']['timings']);
    pr(prayerTimes, '$t - parsed data');
    return prayerTimes;
  }
}
