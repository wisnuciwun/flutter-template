import 'dart:io';

internetChecker() async {
  bool result;

  try {
    var z = await InternetAddress.lookup('google.com');

    if (z.isNotEmpty && z[0].rawAddress.isNotEmpty) {
      result = true;
    } else {
      result = false;
    }
  } catch (e) {
    result = false;
  }

  return result;
}
