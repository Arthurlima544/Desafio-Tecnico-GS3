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
