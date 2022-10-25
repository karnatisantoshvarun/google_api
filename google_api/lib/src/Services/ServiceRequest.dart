///Created by Santosh Varun Karnati
///Created date on 21/10/22

import 'package:dio/dio.dart';
import 'package:google_search_api/src/Models/GoogleNearBySearchResponse.dart';
import 'package:google_search_api/src/Network/NetworkListener.dart';
import 'package:google_search_api/src/Services/URL.dart';

import 'ServiceError.dart';

///ProcessJson is a class which will handle json to object conversions
class ProcessJson {
  ///fromJson is a generic function to convert the given json into requested object
  /// If T is a List, K is the subtype of the list.
  static T fromJson<T, K>(dynamic json) {
    if (json is Iterable) {
      return _fromJsonList<K>(json as List<dynamic>) as T;
    } else if (T == GoogleNearBySearchResponse) {
      return GoogleNearBySearchResponse.fromJson(json) as T;
    } else if (T == bool || T == String || T == int || T == double) {
      // primitives
      return json;
    } else {
      throw Exception("Unknown class");
    }
  }

  static List<K> _fromJsonList<K>(List<dynamic> jsonList) {
    return jsonList.map<K>((dynamic json) => fromJson<K, void>(json)).toList();
  }
}

///ServiceRequest is a singleton class handles the http calls using DIO service.
///executeRequest is a generic function which will handle the api call and send back the response and if error it will throws Future.Error()
/// If T is a List, K is the subtype of the list.
class ServiceRequest {
  static final ServiceRequest _instance = ServiceRequest();

  static ServiceRequest get instance => _instance;

  final Dio _dio = Dio();
  Future<T> executeRequest<T, K>(URLRequest urlRequest) async {
    if (await hasNetwork()) {
      switch (urlRequest.httpMethod) {
        case HTTPMethod.get:
          return getRequest<T, K>(urlRequest);
        default:
          throw Future.error(ServiceError.unknownStatusCode.description);
      }
    } else {
      throw Future.error(ServiceError.networkOffline.description);
    }
  }

  Future<T> getRequest<T, K>(URLRequest urlRequest) async {
    try {
      Response response = await _dio.get(urlRequest.url,
          queryParameters: urlRequest.parameters);
      return ProcessJson.fromJson<T, K>(response.data);
    } on DioError catch (e) {
      /// The request was made and the server responded with a status code
      /// that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        throw Future.error(
            'STATUS: ${e.response?.statusCode} DATA: ${e.response?.data} HEADERS: ${e.response?.headers} HEADERS: ${e.response?.headers}');
      } else {
        /// Error due to setting up or sending the request
        throw Future.error(
            '${ServiceError.unknownStatusCode.description} ${e.error}');
      }
    }
  }
}
