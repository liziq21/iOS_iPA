import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
//import 'package:retrofit/retrofit.dart';

import '../../bili/constonts/uris.dart';
import '../retrofit/retrofit_network.dart';
import '../model/network_search.dart';
import '../model/network_type_search_result.dart';

@module
abstract class NetworkModule {
  @Named("apiBase")
  String get apiBase => Api.base;
  
  @lazySingleton
  Dio get dio => Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {
        HttpHeaders.cookieHeader: '{"SESSDATA"="xxx"}',
      },
    )
  );
}
