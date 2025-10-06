

enum ArticleSearchOrder {
  totalrank,
  attention,
  click,
  dm,
  pubdate,
  scores,
  stow;
}

enum PhotoOrVideoSearchOrder {
  totalrank,
  click,
  dm,
  pubdate,
  scores,
  stow;
}

enum LiveRoomSearchOrder {
  online, liveTime;
  
  @override
  String toString() => this == liveTime ? 'live_time' : super.toString();
}

enum UserSearchOrder {
  default, fons, level;
  
  @override
  String toString() => this == default ? '0' : super.toString();
}

enum OrderSort {
  descending, ascending;
  
  @override
  String toString() => '${this.index}';
}

enum UserSearchSort {
  sort.default(),
  fonsDescending(.fons, .descending),
  fonsAscending(.fons, .ascending),
  levelDescending(.level, .descending),
  levelAscending(.level, .ascending);
  
  const UserSearchSort(
    UserSearchOrder order,
    [this.orderSort],
  ) : order = order;
  
  const UserSearchSort.default();
  
  final UserSearchOrder? order;
  final OrderSort? orderSort;
}
