base class Category with CategoryMixin {
  //String toJson() => toString();
}

mixin CategoryMixin {
  String toJson() => toString();
}

enum ArticleCategory with CategoryMixin implements Category {
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
  
  //@override
  //String toJson() => toString();
}


enum PhotoCategory with CategoryMixin implements Category {
  all,
  artists,
  photography;

  @override
  String toString() => '${this.index}';
  
  //@override
  //String toJson() => toString();
}