import 'package:intl/intl.dart';

extension DateString on String {
  /// Parse string to [DateTime]
  DateTime? toDateTime(String pattern) {
    try {
      return DateFormat(pattern).parse(this);
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  String? toNewFormat(String fromPattern, String toPattern) {
    try {
      return DateFormat(toPattern).format(DateFormat(fromPattern).parse(this));
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}

extension DateInt on int {
  Duration toMilliseconds() => Duration(milliseconds: this);

  Duration toSeconds() => Duration(seconds: this);

  Duration toMinutes() => Duration(minutes: this);

  Duration toHours() => Duration(hours: this);

  Duration toDays() => Duration(days: this);
}

extension DateExtensions on DateTime {
  bool get isYesterday {
    final nowDate = DateTime.now();
    return year == nowDate.year &&
        month == nowDate.month &&
        day == nowDate.day - 1;
  }

  /// The list of days in a given month
  List<DateTime> get daysInMonth {
    var first = firstDayOfMonth;
    var daysBefore = first.weekday;
    var firstToDisplay = first.subtract(Duration(days: daysBefore));
    var last = lastDayOfMonth;

    var daysAfter = 7 - last.weekday;

    // If the last day is sunday (7) the entire week must be rendered
    if (daysAfter == 0) {
      daysAfter = 7;
    }

    var lastToDisplay = last.add(Duration(days: daysAfter));
    return daysInRange(firstToDisplay, lastToDisplay).toList();
  }

  DateTime get lastDayOfMonth {
    var beginningNextMonth = (this.month < 12)
        ? DateTime(this.year, this.month + 1, 1)
        : DateTime(this.year + 1, 1, 1);
    return beginningNextMonth.subtract(Duration(days: 1));
  }

  /// Returns a [DateTime] for each day the given range.
  ///
  /// [start] inclusive
  /// [end] exclusive
  static Iterable<DateTime> daysInRange(DateTime start, DateTime end) sync* {
    var i = start;
    var offset = start.timeZoneOffset;
    while (i.isBefore(end)) {
      yield i;
      i = i.add(Duration(days: 1));
      var timeZoneDiff = i.timeZoneOffset - offset;
      if (timeZoneDiff.inSeconds != 0) {
        offset = i.timeZoneOffset;
        i = i.subtract(Duration(seconds: timeZoneDiff.inSeconds));
      }
    }
  }

  static bool isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  static bool isSameTime(DateTime a, DateTime b) =>
      a.hour == b.hour && a.minute == b.minute;

  DateTime get firstDayOfMonth => DateTime(this.year, this.month);

  ///  Start time of Date times
  DateTime startOfDay() => DateTime(year, month, day);

  DateTime startOfMonth() => DateTime(year, month);

  DateTime startOfYear() => DateTime(year);

  /// next day
  DateTime tomorrow() => DateTime(year, month, day + 1);

  /// last day
  DateTime yesterday() => DateTime(year, month, day - 1);

  /// return the smaller date between
  DateTime min(DateTime that) =>
      (millisecondsSinceEpoch < that.millisecondsSinceEpoch) ? this : that;

  DateTime max(DateTime that) =>
      (millisecondsSinceEpoch > that.millisecondsSinceEpoch) ? this : that;

  bool get isLeapYear =>
      (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));
}
