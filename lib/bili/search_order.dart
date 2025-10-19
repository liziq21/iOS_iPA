abstract interface class SearchOrder extends Enum {}

enum ArticleSearchOrder implements SearchOrder {
  totalrank,
  attention,
  click,
  dm,
  pubdate,
  scores,
  stow;
}

enum PhotoOrVideoSearchOrder implements SearchOrder {
  totalrank,
  click,
  dm,
  pubdate,
  scores,
  stow;
}

enum LiveRoomSearchOrder implements SearchOrder {
  online, liveTime;
  
  @override
  String toString() => this == liveTime ? 'live_time' : super.toString();
}

enum UserSearchOrder implements SearchOrder{
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
