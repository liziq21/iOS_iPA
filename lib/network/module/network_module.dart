import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../bili/constonts/base.dart';
import '../retrofit/retrofit_network.dart';
import '../model/network_search.dart';
import '../model/network_type_search_result.dart';

@module
abstract class NetworkModule {
  
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
  
  @lazySingleton
  retrofitNetworkApi client(Dio dio) =>
    RetrofitNetworkApi(dio, baseUrl: Base.api);
}
