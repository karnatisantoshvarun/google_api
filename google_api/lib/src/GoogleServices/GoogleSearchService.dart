import 'package:google_search_api/src/Models/GoogleNearBySearchResponse.dart';
import 'package:google_search_api/src/Models/GoogleSearchParametersModle.dart';
import 'package:google_search_api/src/Services/ServiceRequest.dart';
import 'package:google_search_api/src/Services/URL.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

Future<GoogleNearBySearchResponse> getNearbyPlaces(
    GoogleSearchParametersModle googleSearchParametersModle) {
  try {
    SearchPlaces searchPlaces = SearchPlaces();
    searchPlaces.parameters = googleSearchParametersModle.toJson();
    return ServiceRequest.instance
        .executeRequest<GoogleNearBySearchResponse, void>(
            searchPlaces.createRequest());
  } catch (e) {
    throw Future.error(e);
  }
}
