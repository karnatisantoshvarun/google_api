///Created by Santosh Varun Karnati
///Created date on 21/10/22

/// ServiceError is the enum of error that should be handled in the service layer

enum ServiceError {
  responseNotFound,
  networkOffline,
  unknownStatusCode,
  badRequestBody,
}

extension ServiceErrorErrorExtension on ServiceError {
  String get description {
    switch (this) {
      case ServiceError.badRequestBody:
        return 'Bad request Body';
      case ServiceError.networkOffline:
        return 'Internet Connectivity Issue';
      case ServiceError.responseNotFound:
        return 'No Response found';
      case ServiceError.unknownStatusCode:
        return 'Unknown States Code';
    }
  }
}
