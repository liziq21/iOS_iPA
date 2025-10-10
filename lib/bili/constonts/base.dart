class Base {
  static const minDate = DateTime(2009, 6, 26);
  //minDate.add(const Duration(days: 1));
  
  static const api = 'https://api.bilibili.com';
  static const sSearch = 'https://s.search.bilibili.com/main/suggest';
}

class Path {
  static const searchAll = '/x/web-interface/search/all/v2';
  static const searchType = '/x/web-interface/search/type';
}

class Url {
  static const searchSuggest = '${Base.sSearch}/main/suggest'
}