import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triscoproduction/navigation.dart';
import 'package:triscoproduction/service/auth_service.dart';

class PrivateRoutes extends GetMiddleware {
  final authService = Get.find<AuthService>();

  @override
  RouteSettings? redirect(String? route) {
    return authService.isLoggedIn.value
        ? null
        : const RouteSettings(name: Routes.login);
  }
}
