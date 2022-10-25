///Created by Santosh Varun Karnati
///Created date on 21/10/22

///BaseURLType is a enum we will initialize all the BaseURL cases required
enum BaseURLType { GoogleApi }

///BaseURLTypeExtension is an extension on BaseURLType
///baseURLString is the getter value where we will initialize the baseURLString and return as a String
extension BaseURLTypeExtension on BaseURLType {
  String get baseURLString {
    switch (this) {
      case BaseURLType.GoogleApi:
        return 'https://maps.googleapis.com/maps/api/';
    }
  }
}
