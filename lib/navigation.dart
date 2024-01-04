import 'package:get/get.dart';
import 'package:triscoproduction/middlewares/private_routes.dart';
import 'package:triscoproduction/views/pages/index.dart';

abstract class Routes {
  static const login = '/';
  static const splashScreen = '/splash-screen';
}

final appPages = [
  GetPage(
    name: Routes.login,
    page: () => const Login(),
  ),
  GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
      middlewares: [PrivateRoutes()]),
];
