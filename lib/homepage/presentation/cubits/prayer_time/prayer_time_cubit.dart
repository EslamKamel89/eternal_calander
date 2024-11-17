import 'package:eternal_calander/core/globals.dart';
import 'package:eternal_calander/homepage/domain/models/prayer_times_day.dart';
import 'package:eternal_calander/homepage/domain/repo/repo.dart';
import 'package:eternal_calander/homepage/presentation/cubits/location/location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

part 'prayer_time_state.dart';

class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  HomeRepo homeRepo;
  PrayerTimeCubit({required this.homeRepo}) : super(PrayerTimeInitial());
  final DateTime _startDate = DateTime(2000, 1, 1);
  final DateTime _currentDate = DateTime.now();
  DateTime _selectedDate = DateTime.now();
  int todayIndex = 0;
  List<DateTime> dateList = [];
  PrayerTimesModel? prayerTimesModel;
  PrayerTimesModel? todayPrayerTimesModel;
  List nextPrayer = [];

  Future generateDateList() async {
    DateTime tempDate = _startDate.copyWith();
    dateList = List.generate(40000, (index) {
      tempDate = tempDate.add(const Duration(days: 1));
      if (_currentDate.year == tempDate.year &&
          _currentDate.month == tempDate.month &&
          _currentDate.day == tempDate.day) {
        todayIndex = index;
      }
      return tempDate;
    });
    emit(PrayerTimeDateListGeneratedState(dateList));
  }

  void setSelectedDate(DateTime dateTime) {
    _selectedDate = dateTime;
  }

  DateTime getSelectedDate() {
    return _selectedDate;
  }

  Future getPrayerTimes() async {
    BuildContext? context = navigatorKey.currentContext;
    if (context == null) return;
    LocationCubit locationCubit = context.read<LocationCubit>();
    Position? position = locationCubit.currentPosition;
    if (position == null) return;

    final response = await homeRepo.getPrayerTimes(position: position, dateTime: _selectedDate);
    response.fold(
      (_) {},
      (PrayerTimesModel prayer) {
        if (_selectedDate.year == _currentDate.year &&
            _selectedDate.month == _currentDate.month &&
            _selectedDate.day == _currentDate.day) {
          todayPrayerTimesModel = prayer;
          getNextPrayer();
        }
        prayerTimesModel = prayer;
        emit(UpdatePrayerTimeState(prayer));
      },
    );
  }

/*
{الفجر: 04:52, الظهر : 11:40, العصر: 14:38, المغرب: 16:58, العشاء : 18:18}
 */
  getNextPrayer() {
    Map<Prayer, String> prayerTime = todayPrayerTimesModel?.toMap() ?? {};
    DateTime currentTime = DateTime.now();
    int currentHour = currentTime.hour;
    int currentMinutes = currentTime.minute;
    try {
      if (_extractHours(prayerTime[Prayer.fajr] ?? '') > currentHour &&
          _extractMinutes(prayerTime[Prayer.fajr] ?? '') > currentMinutes) {
        nextPrayer = [
          Prayer.fajr.toString(),
          _extractHours(prayerTime[Prayer.fajr] ?? '') - currentHour,
          _extractMinutes(prayerTime[Prayer.fajr] ?? '') - currentMinutes,
        ];
        emit(UpdateNextPrayerTimeState());
        return;
      }
      if (_extractHours(prayerTime[Prayer.dhuhr] ?? '') > currentHour &&
          _extractMinutes(prayerTime[Prayer.dhuhr] ?? '') > currentMinutes) {
        nextPrayer = [
          Prayer.dhuhr.toString(),
          _extractHours(prayerTime[Prayer.dhuhr] ?? '') - currentHour,
          _extractMinutes(prayerTime[Prayer.dhuhr] ?? '') - currentMinutes,
        ];
        emit(UpdateNextPrayerTimeState());
        return;
      }
      if (_extractHours(prayerTime[Prayer.asr] ?? '') > currentHour &&
          _extractMinutes(prayerTime[Prayer.asr] ?? '') > currentMinutes) {
        nextPrayer = [
          Prayer.asr.toString(),
          _extractHours(prayerTime[Prayer.asr] ?? '') - currentHour,
          _extractMinutes(prayerTime[Prayer.asr] ?? '') - currentMinutes,
        ];
        emit(UpdateNextPrayerTimeState());
        return;
      }
      if (_extractHours(prayerTime[Prayer.maghrib] ?? '') > currentHour &&
          _extractMinutes(prayerTime[Prayer.maghrib] ?? '') > currentMinutes) {
        nextPrayer = [
          Prayer.maghrib.toString(),
          _extractHours(prayerTime[Prayer.maghrib] ?? '') - currentHour,
          _extractMinutes(prayerTime[Prayer.maghrib] ?? '') - currentMinutes,
        ];
        emit(UpdateNextPrayerTimeState());
        return;
      }
      if (_extractHours(prayerTime[Prayer.isha] ?? '') > currentHour &&
          _extractMinutes(prayerTime[Prayer.isha] ?? '') > currentMinutes) {
        nextPrayer = [
          Prayer.isha.toString(),
          _extractHours(prayerTime[Prayer.isha] ?? '') - currentHour,
          _extractMinutes(prayerTime[Prayer.isha] ?? '') - currentMinutes,
        ];
        emit(UpdateNextPrayerTimeState());
        return;
      }
      emit(UpdateNextPrayerTimeState());
      nextPrayer = [];
    } on Exception catch (e) {
      emit(UpdateNextPrayerTimeState());
      nextPrayer = [];
    }
  }

  int _extractHours(String time) {
    try {
      int.parse(time.split(':').first);
      return int.parse(time.split(':').first);
    } on Exception catch (e) {
      return 0;
    }
  }

  int _extractMinutes(String time) {
    try {
      int.parse(time.split(':').last);
      return int.parse(time.split(':').last);
    } on Exception catch (e) {
      return 0;
    }
  }
}
