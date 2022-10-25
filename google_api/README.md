This package implement Google Search API with only dart dependency(without flutter).
Before working with the plugin, be sure to read Before you begin and create an API key in Google Developer Console.

## Features
Search google places using google service

## Getting started
Create an API key in Google Developer Console.
## with dart
$ dart pub add google_search_api
## with flutter
$ flutter pub add google_search_api

## Usage
```dart
import 'package:google_search_api/google_search_api.dart';

try {
      GoogleSearchParametersModle googleSearchParametersModle = GoogleSearchParametersModle('cruise', '-33.8670522,151.1957362', 'GOOGLE_API_KEY', 1500, 'restaurant' );
      dynamic places = await getNearbyPlaces(googleSearchParametersModle);
      if (kDebugMode) {
        print(places.results);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
```

