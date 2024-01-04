import 'package:get/get.dart';

class AuthService extends GetxService {
  final RxBool isLoggedIn = false.obs;

  Future<AuthService> init() async => this;

  void setIsLoggedIn(bool newValue) {
    isLoggedIn.value = newValue;
  }
}
