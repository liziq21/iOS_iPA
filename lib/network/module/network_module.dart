import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
//import 'package:retrofit/retrofit.dart';

import 'package:f_biuli/bili/constonts/uris.dart';
import 'package:f_biuli/network/retrofit/retrofit_network.dart';

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
