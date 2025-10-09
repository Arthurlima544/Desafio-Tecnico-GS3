String formatSpecialDate(DateTime dateToFormat) {
  final DateTime now = DateTime.now();
  final DateTime today = DateTime(now.year, now.month, now.day);
  final DateTime yesterday = today.subtract(const Duration(days: 1));

  final DateTime inputDate = DateTime(
    dateToFormat.year,
    dateToFormat.month,
    dateToFormat.day,
  );

  const List<String> monthAbbrs = <String>[
    'Jan',
    'Fev',
    'Mar',
    'Abr',
    'Mai',
    'Jun',
    'Jul',
    'Ago',
    'Set',
    'Out',
    'Nov',
    'Dez',
  ];

  final String day = inputDate.day.toString().padLeft(2, '0');
  final String month = monthAbbrs[inputDate.month - 1];

  final String dayMonthStr = '$day $month';

  if (inputDate.isAtSameMomentAs(today)) {
    return 'Hoje, $dayMonthStr';
  } else if (inputDate.isAtSameMomentAs(yesterday)) {
    return 'Ontem, $dayMonthStr';
  } else {
    return dayMonthStr;
  }
}

String formatDateTimeToDayMonthHourMinute(DateTime dateTime) {
  String padZero(int number) => number.toString().padLeft(2, '0');

  final String day = padZero(dateTime.day);
  final String month = padZero(dateTime.month);
  final String hour = padZero(dateTime.hour);
  final String minute = padZero(dateTime.minute);

  return '$day/$month às $hour:$minute';
}

bool isInCurrentInvoice(DateTime transactionDate, int bestDay) {
  final DateTime now = DateTime.now();
  final int currentYear = now.year;
  final int currentMonth = now.month;

  DateTime invoiceStartDate;
  DateTime invoiceEndDate;

  if (now.day >= bestDay) {
    invoiceStartDate = DateTime(currentYear, currentMonth, bestDay);
    invoiceEndDate = DateTime(
      currentMonth == 12 ? currentYear + 1 : currentYear,
      currentMonth == 12 ? 1 : currentMonth + 1,
      bestDay,
    ).subtract(const Duration(days: 1));
  } else {
    invoiceStartDate = DateTime(
      currentMonth == 1 ? currentYear - 1 : currentYear,
      currentMonth == 1 ? 12 : currentMonth - 1,
      bestDay,
    );
    invoiceEndDate = DateTime(
      currentYear,
      currentMonth,
      bestDay,
    ).subtract(const Duration(days: 1));
  }

  final DateTime transactionDateOnly = DateTime(
    transactionDate.year,
    transactionDate.month,
    transactionDate.day,
  );

  return transactionDateOnly.isAtSameMomentAs(invoiceStartDate) ||
      transactionDateOnly.isAtSameMomentAs(invoiceEndDate) ||
      (transactionDateOnly.isAfter(invoiceStartDate) &&
          transactionDateOnly.isBefore(invoiceEndDate));
}
