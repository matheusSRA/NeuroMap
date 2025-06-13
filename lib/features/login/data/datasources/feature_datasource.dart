import '../../../../core/http/http_client_dio.dart';
import '../../../../core/localstorage/security_local_storage.dart';

abstract class FeatureDatasource {
  
}

class FeatureDatasourceImpl implements FeatureDatasource {
  final HttpClientDio httpClient;
  final SecurityLocalStorage localStorage;

  FeatureDatasourceImpl({required this.httpClient, required this.localStorage});

 
}
