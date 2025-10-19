abstract interface class SearchOrder {
  String toJson();
}

mixin class SearchOrderMixin implements SearchOrder {
  @ovrride
  String toJson() => toString();
}

enum ArticleSearchOrder with SearchOrderMixin {
  totalrank,
  attention,
  click,
  dm,
  pubdate,
  scores,
  stow;
}

enum PhotoOrVideoSearchOrder with SearchOrderMixin {
  totalrank,
  click,
  dm,
  pubdate,
  scores,
  stow;
}

enum LiveRoomSearchOrder with SearchOrderMixin {
  online, liveTime;
  
  @override
  String toString() => this == liveTime ? 'live_time' : super.toString();
}

enum UserSearchOrder with SearchOrderMixin {
  defaultOrder, fons, level;
  
  @override
  String toString() => this == defaultOrder ? '0' : super.toString();
}

enum OrderSort {
  descending, ascending;
  
  @override
  String toString() => '${this.index}';
}

enum UserSearchSort {
  sort.defaultSort(),
  fonsDescending(UserSearchOrder.fons, OrderSort.descending),
  fonsAscending(UserSearchOrder.fons, OrderSort.ascending),
  levelDescending(UserSearchOrder.level, OrderSort.descending),
  levelAscending(UserSearchOrder.level, OrderSort.ascending);
  
  const UserSearchSort(
    this.order, [
    this.orderSort,
  ]);
  
  const UserSearchSort.defaultSort() : order = null, orderSort = null;
  
  final UserSearchOrder? order;
  final OrderSort? orderSort;
}
