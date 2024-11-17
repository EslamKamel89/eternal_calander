enum Prayer {
  fajr,
  dhuhr,
  asr,
  maghrib,
  isha;

  @override
  String toString() {
    switch (this) {
      case Prayer.fajr:
        return 'الفجر';
      case Prayer.dhuhr:
        return 'الظهر ';
      case Prayer.asr:
        return 'العصر';
      case Prayer.maghrib:
        return 'المغرب';
      case Prayer.isha:
        return 'العشاء ';
    }
  }

  static Prayer fromStr(String prayer) {
    switch (prayer) {
      case 'Fajr':
        return Prayer.fajr;
      case 'Dhuhr':
        return Prayer.dhuhr;
      case 'Asr':
        return Prayer.asr;
      case 'Maghrib':
        return Prayer.maghrib;
      case 'Isha':
        return Prayer.isha;
      default:
        return Prayer.fajr;
    }
  }
}

class PrayerTimesModel {
  String? fajr;
  String? sunrise;
  String? dhuhr;
  String? asr;
  String? sunset;
  String? maghrib;
  String? isha;
  String? imsak;
  String? midnight;
  String? firstthird;
  String? lastthird;

  PrayerTimesModel({
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.sunset,
    this.maghrib,
    this.isha,
    this.imsak,
    this.midnight,
    this.firstthird,
    this.lastthird,
  });

  @override
  String toString() {
    return 'PrayerTimesDay(fajr: $fajr, sunrise: $sunrise, dhuhr: $dhuhr, asr: $asr, sunset: $sunset, maghrib: $maghrib, isha: $isha, imsak: $imsak, midnight: $midnight, firstthird: $firstthird, lastthird: $lastthird)';
  }

  factory PrayerTimesModel.fromJson(Map<String, dynamic> json) {
    return PrayerTimesModel(
      fajr: json['Fajr'] as String?,
      sunrise: json['Sunrise'] as String?,
      dhuhr: json['Dhuhr'] as String?,
      asr: json['Asr'] as String?,
      sunset: json['Sunset'] as String?,
      maghrib: json['Maghrib'] as String?,
      isha: json['Isha'] as String?,
      imsak: json['Imsak'] as String?,
      midnight: json['Midnight'] as String?,
      firstthird: json['Firstthird'] as String?,
      lastthird: json['Lastthird'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'Fajr': fajr,
        'Sunrise': sunrise,
        'Dhuhr': dhuhr,
        'Asr': asr,
        'Sunset': sunset,
        'Maghrib': maghrib,
        'Isha': isha,
        'Imsak': imsak,
        'Midnight': midnight,
        'Firstthird': firstthird,
        'Lastthird': lastthird,
      };
  Map<Prayer, String> toMap() => {
        Prayer.fromStr('Fajr'): fajr.toString(),
        Prayer.fromStr('Dhuhr'): dhuhr.toString(),
        Prayer.fromStr('Asr'): asr.toString(),
        Prayer.fromStr('Maghrib'): maghrib.toString(),
        Prayer.fromStr('Isha'): isha.toString(),
      };
}
