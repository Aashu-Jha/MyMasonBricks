extension DateTimeExtension on DateTime {
  String get age {
    final date = this;
    final now = DateTime.now();
    final age = now.year - date.year;
    return age.toString();
  }

  String get formatYYYYMMDD {
    return '${year.toString().padLeft(4, '0')}-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
  }
}
