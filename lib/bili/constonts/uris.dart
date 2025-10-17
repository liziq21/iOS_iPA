class SearchUris {
  //static const minDate = DateTime(2009, 6, 26);
  //minDate.add(const Duration(days: 1));
  
  static const host = 's.search.bilibili.com';
  static const base = 'https://$host';
  
  static const suggest = '$base${SearchApiPath.suggest}';
}

class SearchUriPaths {
  static const suggest = '/main/suggest';
}

class ApiUris {
  static const host = 'api.bilibili.com';
  static const base = 'https://$host';
  
  static const search     = '$base${ApiPath.search}';
  static const searchType = '$base${ApiPath.searchType}';
}

class ApiUriPaths {
  static const search     = '/x/web-interface/search/all/v2';
  static const searchType = '/x/web-interface/search/type';
}