abstract class Category {
  String toJson() => toString();
}

enum ArticleCategory extends Category {
  all(0),
  animation(2),
  games(1),
  movies(28),
  life(3),
  interests(29),
  lightNovels(16),
  technology(17);

  const ArticleCategory(this.id);
  final int id;
  
  @override
  String toString() => '$id';
}


enum PhotoCategory extends Category {
  all,
  artists,
  photography;

  @override
  String toString() => '${this.index}';
}