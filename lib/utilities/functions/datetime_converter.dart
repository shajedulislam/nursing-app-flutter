import 'package:intl/intl.dart';

String dateTimePatternFormatter(DateTime dateTime, String pattern) {
  return DateFormat(pattern).format(dateTime);
}

String? stringToDatetimeLocal({required String dateTime, String? pattern}) {
  try {
    return DateFormat(pattern ?? 'hh:mm a - dd MMM, yyyy').format(
      DateTime.parse(dateTime).toLocal(),
    );
  } catch (_) {
    return null;
  }
}

String dateToDayName(DateTime dateTime) {
  return DateFormat('EEE').format(dateTime);
}
