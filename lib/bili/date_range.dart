class DateRange {
  DateTime start = DateTime(2009, 6, 26);
  DateTime end = DateTime.now();
  
/*  DateRange({
    DateTime? start,
    DateTime? end,
  }) : 
    start = start ?? DateTime(2009, 6, 26),
    end = end ?? DateTime.now() {
    // 验证：确保 start 不晚于 end
    if (this.start.isAfter(this.end)) {
      throw ArgumentError(
        'Start date (${this.start}) must be before or equal to end date (${this.end})'
      );
    }
  }*/
  
  /// 日期范围的持续时间
  Duration get duration => end.difference(start);
  
  /// 持续的天数
  int get days => duration.inDays;
  
  /// 是否包含指定日期
  bool contains(DateTime date) {
    return (date.isAfter(start) || date.isAtSameMomentAs(start)) &&
           (date.isBefore(end) || date.isAtSameMomentAs(end));
  }
  
  /// 是否与另一个日期范围重叠
  bool overlaps(DateRange other) {
    return start.isBefore(other.end) && end.isAfter(other.start);
  }
  
  DateRange copyWith({
    DateTime? start,
    DateTime? end,
  }) {
    return DateRange(
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }
  
  @override
  String toString() {
    return 'DateRange(start: $start, end: $end, days: $days)';
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DateRange &&
           other.start == start &&
           other.end == end;
  }
  
  @override
  int get hashCode => Object.hash(start, end);
}
