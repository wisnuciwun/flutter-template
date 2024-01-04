part of '../index.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 145,
                      child: Image.asset(
                        '$imageAsset/app_logo.jpeg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: OurDimens.screenPadding,
                child: Column(
                  children: [
                    DefaultInput(
                      title: 'Username',
                      placeholder: 'Silahkan ketik NIK (Nomor Induk Karyawan)',
                      // controller: username,
                    ),
                    DefaultInput(
                      password: true,
                      title: 'Password',
                      placeholder: 'Silahkan ketik password',
                      // controller: password,
                      belowSpace: 25,
                    ),
                    DefaultButton(
                      title: 'Masuk',
                      onClick: () {
                        // onPostLogin(context);
                      },
                      width: Get.width,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
