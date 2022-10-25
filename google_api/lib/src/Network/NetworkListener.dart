///Created by Santosh Varun Karnati
///Created date on 21/10/22

import 'dart:io';

///hasNetwork is a function return bool based on InternetAddress.lookup
Future<bool> hasNetwork() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } on SocketException catch (_) {
    return false;
  }
}
