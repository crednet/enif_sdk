import 'dart:math';

import 'package:enif/extensions/extensions.dart';

extension Format on DateTime {
  /// format date as [day]$[delimeter]$[month]$[delimeter]$[year]
  String format([String delimeter = '/', bool invert = false]) {
    var date = toLocal();
    int year = date.year;
    int month = date.month;
    int day = date.day;
    String m = month > 9 ? '$month' : '0$month';
    String d = day > 9 ? '$day' : '0$day';
    if (invert) {
      return '$year$delimeter$m$delimeter$d';
    }
    return '$d$delimeter$m$delimeter$year';
  }

  String get readableFormat {
    var date = toLocal();
    int year = date.year;
    String month = monthNames[max(min(date.month - 1, 13), 0)];
    int day = date.day;
    return '$month $day $year';
  }

  String get readableFormatMin {
    var date = toLocal();
    // int year = date.year;
    String month = monthNamesMin[max(min(date.month - 1, 13), 0)];
    int day = date.day;
    return '$month $day';
  }

  String get readableFormatNoYear {
    var date = toLocal();
    String month = monthNames[max(min(date.month - 1, 13), 0)];
    int day = date.day;
    return '$month $day';
  }

  /// show Month in full text, show day and time, if date is today,
  /// tomorrow or yesterday, it returns the string respectively
  String get readableFormatRefined {
    var now = DateTime.now();
    var midNightToday = DateTime(now.year, now.month, now.day);
    var midNightYesterday = midNightToday.subtract(const Duration(days: 1));
    var midNightTomorrow = midNightToday.add(const Duration(days: 1));
    var afterTomorrow = midNightToday.add(const Duration(days: 2));
    var date = this;
    if (date.year != now.year) return date.readableFormat;
    if (date.isAfter(afterTomorrow)) return date.readableFormat;
    if (date.isAfter(midNightTomorrow)) return 'Tomorrow';
    if ((date.isBefore(midNightTomorrow) && (date.isAfter(midNightToday)))) {
      return 'Today';
    }
    if ((date.isAfter(midNightYesterday) && (date.isBefore(midNightToday)))) {
      return 'Yesterday';
    }
    return date.readableFormat;
  }

  // bool isToday(DateTime date) {
  //   var _d = DateTime(date?.year, date?.month, date?.day);
  // }

  /// show Month in full text, show day and time, if date is today,
  /// tomorrow or yesterday, it returns the string respectively
  String get readableFormatRefinedMin {
    var now = DateTime.now();
    var date = this;
    if (date.year != now.year) return date.readableFormat;
    if (date.difference(now).inDays > 1) return date.readableFormatMin;
    if (date.difference(now).inDays == 1) return 'Tomorrow';
    if (date.difference(now).inDays == 0 && date.day == now.day) {
      return date.time;
    }
    if (date.difference(now).inDays == 0 && date.day > now.day) {
      return 'Tomorrow';
    }
    if (date.difference(now).inDays == 0 && date.day < now.day) {
      return 'Yesterday';
    }
    if (date.difference(now).inDays == -1) return 'Yesterday';
    return date.readableFormatMin;
  }

  /// show Month in full text, show day and time, if date is today,
  /// tomorrow or yesterday, it returns the string respectively
  String get readableFormatRefinedNoYear {
    var now = DateTime.now();
    var date = this;
    if (date.year != now.year) return date.readableFormatNoYear;
    if (date.difference(now).inDays > 1) return date.readableFormatNoYear;
    if (date.difference(now).inDays == 1) return 'Tomorrow';
    if (date.difference(now).inDays == 0 && date.day == now.day) {
      return 'Today';
    }
    if (date.difference(now).inDays == 0 && date.day > now.day) {
      return 'Tomorrow';
    }
    if (date.difference(now).inDays == 0 && date.day < now.day) {
      return 'Yesterday';
    }
    if (date.difference(now).inDays == -1) return 'Yesterday';
    return date.readableFormat;
  }

  String get formatWithTime {
    var date = toLocal();
    int year = date.year;
    String month = monthNames[max(min(this.month - 1, 13), 0)];
    int day = date.day;
    int hour = date.hour;
    int minute = this.minute;
    return '$month $day, $year at ${_formatTime(hour, minute)}';
  }

  /// get Weekday name,
  String get weekdayName {
    switch (weekday) {
      case DateTime.sunday:
        return 'sunday';
      case DateTime.monday:
        return 'monday';
      case DateTime.tuesday:
        return 'tuesday';
      case DateTime.wednesday:
        return 'wednesday';
      case DateTime.thursday:
        return 'thursday';
      case DateTime.friday:
        return 'friday';
      case DateTime.saturday:
        return 'saturday';

      default:
        return '';
    }
  }

  /// get Weekday name min format like sun, mon, tue, wed, thu, fri, sat
  String get weekdayNameMin {
    switch (weekday) {
      case DateTime.sunday:
        return 'sun';
      case DateTime.monday:
        return 'mon';
      case DateTime.tuesday:
        return 'tue';
      case DateTime.wednesday:
        return 'wed';
      case DateTime.thursday:
        return 'thur';
      case DateTime.friday:
        return 'fri';
      case DateTime.saturday:
        return 'sat';

      default:
        return '';
    }
  }

  String get formatWithDayAndTime {
    final date = toLocal();
    final now = DateTime.now();
    int year = date.year;
    String month = monthNamesMin[max(min(this.month - 1, 13), 0)];
    int day = date.day;
    int hour = date.hour;
    int minute = this.minute;
    return '${date.weekdayNameMin.toTitleCase()}, $month $day, ${now.year == year ? '' : '$year,'} ${_formatTime(hour, minute)}';
  }

  String get formatWithDay {
    final date = toLocal();
    final now = DateTime.now();
    int year = date.year;
    String month = monthNamesMin[max(min(this.month - 1, 13), 0)];
    int day = date.day;
    // int hour = date.hour;
    // int minute = this.minute;
    return '${date.weekdayNameMin.toTitleCase()}, $month $day, ${now.year == year ? '' : '$year'}';
  }

  String _formatTime(int hour, int min) {
    String m = '$min';
    if (min < 10) m = '0$min';
    if (hour < 10) {
      return '0$hour:$min AM';
    } else if (hour < 13) {
      if (hour == 12 && min == 0) return '$hour:00 NOON';
      if (hour == 12) return '$hour:$min PM';
      return '$hour:$min AM';
    } else {
      return '${hour - 12}:$m PM';
    }
  }

  String get time {
    var date = this;
    int hour = date.hour;
    int minute = this.minute;
    return _formatTime(hour, minute);
  }
}

// String getMonthNamesMin(DateTime date)

const List<String> monthNames = <String>[
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

const List<String> monthNamesMin = <String>[
  'Jan',
  'Feb',
  'March',
  'April',
  'May',
  'June',
  'July',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];
