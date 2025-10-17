class DateRange {
  final DateTime start;
  final DateTime end;
  const DateRange({
    DateTime? start,
    DateTime? end,
  }) : 
    start = start ?? DateTime(2009, 6, 26),
    end = end ?? DateTime.now();
}