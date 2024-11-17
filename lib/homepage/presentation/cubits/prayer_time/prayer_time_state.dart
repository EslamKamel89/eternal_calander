part of 'prayer_time_cubit.dart';

sealed class PrayerTimeState {}

final class PrayerTimeInitial extends PrayerTimeState {}

final class PrayerTimeDateListGeneratedState extends PrayerTimeState {
  final List<DateTime> dateList;

  PrayerTimeDateListGeneratedState(this.dateList);
}

final class UpdatePrayerTimeState extends PrayerTimeState {
  final PrayerTimesModel prayerTimesModel;

  UpdatePrayerTimeState(this.prayerTimesModel);
}

final class UpdateNextPrayerTimeState extends PrayerTimeState {}
