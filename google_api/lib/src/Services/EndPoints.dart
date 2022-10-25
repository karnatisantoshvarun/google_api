///Created by Santosh Varun Karnati
///Created date on 21/10/22

///EndPoints is a enum we will initialize all the EndPoints cases in ENUM
enum EndPoints { placesAPI }

///EndPointsExtension is an extension on EndPoints
///value is the getter where we will initialize the EndPoints and return as a String
extension EndPointsExtension on EndPoints {
  String get value {
    switch (this) {
      case EndPoints.placesAPI:
        return 'place/nearbysearch/json';
    }
  }
}
