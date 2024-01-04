part of '../index.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const loadingTime = 1500;
    Future.delayed(const Duration(milliseconds: loadingTime), () {
      Get.to(() => const Login(), transition: Transition.downToUp);
    });
    return Scaffold(
        body: Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 200,
                child: Image.asset(
                  '$imageAsset/app_logo.jpeg',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ],
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              version,
              style: TextStyle(
                  color: Color(OurColors.lightOrange),
                  fontWeight: FontWeight.w100),
            ),
          ),
        )
      ],
    ));
  }
}
