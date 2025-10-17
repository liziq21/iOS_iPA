abstract class Category {}

enum ArticleCategory implements Category {
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


enum PhotoCategory implements Category {
  all(0),
  artists(1),
  photography(2);

  const PhotoCategory(this.id);
  final int id;
  
  @override
  String toString() => '$id';
}