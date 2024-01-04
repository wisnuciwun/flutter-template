import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triscoproduction/service/auth_service.dart';
import 'package:triscoproduction/navigation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => AuthService().init());
  runApp(const TriscoAppMain());
}

class TriscoAppMain extends StatelessWidget {
  const TriscoAppMain({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Trisco Mobile',
      initialRoute:
          AuthService().isLoggedIn.value ? Routes.splashScreen : Routes.login,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      getPages: appPages,
    );
  }
}
