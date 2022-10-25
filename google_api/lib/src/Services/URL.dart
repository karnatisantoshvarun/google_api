import 'package:google_search_api/src/Services/BaseURLType.dart';
import 'package:google_search_api/src/Services/EndPoints.dart';

///Created by Santosh Varun Karnati
///Created date on 21/10/22

///URLRequest is used to create a request call for all The HTTP Requests
///GET,POST,PUT,DELETE
///REQUIRED VALUES: HTTPMethod, Request URL
///OPTIONAL VALUES: Parameters, header, body
class URLRequest {
  HTTPMethod httpMethod;
  String url;
  Map<String, dynamic>? parameters;
  Map<String, dynamic>? header;
  Map<String, dynamic>? body;

  URLRequest(
      {required this.httpMethod,
      this.header,
      this.body,
      this.parameters,
      required this.url});
}

///HTTPMethod is the ENUM Type has all cases of HTTP requests
enum HTTPMethod { get, post, put, delete }

/// URN (uniform resource name)
/// URN abstract class with has all the require parameters used for HTTP calls
/// Required: baseURL, endPoint, httpMethod
/// Optional: Parameters, body, header
abstract class URN {
  BaseURLType baseURLType;
  EndPoints endPoint;
  HTTPMethod httpMethod;
  Map<String, dynamic>? parameters;
  Map<String, dynamic>? body;
  Map<String, dynamic>? header;
  URN(
      {required this.baseURLType,
      required this.endPoint,
      required this.httpMethod,
      this.parameters,
      this.body,
      this.header});
}

extension URNExtension on URN {
  ///createRequest will return URLRequest form the initialized values
  URLRequest createRequest() {
    return URLRequest(
        httpMethod: httpMethod,
        url: "${baseURLType.baseURLString}${endPoint.value}",
        body: body,
        header: header,
        parameters: parameters);
  }
}

abstract class GoogleApiURN extends URN {
  EndPoints endPoint;
  GoogleApiURN({required this.endPoint})
      : super(
            baseURLType: BaseURLType.GoogleApi,
            endPoint: endPoint,
            httpMethod: HTTPMethod.get,
            body: null,
            header: {
              'Content-Type': 'application/json',
              'Accept': 'application/json'
            },
            parameters: null);
}

class SearchPlaces extends GoogleApiURN {
  SearchPlaces() : super(endPoint: EndPoints.placesAPI) {
    super.httpMethod = HTTPMethod.get;
  }
}
