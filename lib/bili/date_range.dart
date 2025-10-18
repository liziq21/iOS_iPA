class DateRange {
  DateTime start;
  DateTime end;
  
  /// 基础构造函数
  DateRange({
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
  }
  
  /// 命名构造函数：从某个日期到现在
  factory DateRange.since(DateTime start) {
    return DateRange(start: start, end: DateTime.now());
  }
  
  /// 命名构造函数：从 Bilibili 诞生到现在
  factory DateRange.fromBilibiliStart() {
    return DateRange(
      start: DateTime(2009, 6, 26),
      end: DateTime.now(),
    );
  }
  
  /// 命名构造函数：从现在开始的指定天数
  factory DateRange.nextDays(int days) {
    final now = DateTime.now();
    return DateRange(
      start: now,
      end: now.add(Duration(days: days)),
    );
  }
  
  /// 命名构造函数：过去的指定天数到现在
  factory DateRange.lastDays(int days) {
    final now = DateTime.now();
    return DateRange(
      start: now.subtract(Duration(days: days)),
      end: now,
    );
  }
  
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
