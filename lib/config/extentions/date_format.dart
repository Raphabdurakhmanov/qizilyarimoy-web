extension DateFormatExtension on DateTime {
  String get formatAsDate => _formatAsTodayYesterday();

  String _formatAsTodayYesterday() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final commentDate = DateTime(year, month, day);

    if (commentDate == today) {
      final hour = this.hour.toString().padLeft(2, '0');
      final minute = this.minute.toString().padLeft(2, '0');
      return "Bugun, $hour:$minute";
    } else if (commentDate == yesterday) {
      final hour = this.hour.toString().padLeft(2, '0');
      final minute = this.minute.toString().padLeft(2, '0');
      return "Kecha, $hour:$minute";
    } else {
      const monthNames = [
        "",
        "Yan",
        "Fev",
        "Mar",
        "Apr",
        "May",
        "Iyun",
        "Iyul",
        "Avg",
        "Sen",
        "Okt",
        "Noy",
        "Dek",
      ];
      return "$day ${monthNames[month]}, $year";
    }
  }
}
