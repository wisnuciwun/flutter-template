part of './index.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  postDataMaterialCode(data, context) async {
    if (await internetChecker()) {
      isLoading = true.obs;

      try {
        var res = await requestApi(
            method: 'POST',
            endpoint: '/getmastercode',
            data: data,
            context: context);

        if (res.statusCode == 200 || res.statusCode == 201) {}
        isLoading = false.obs;
        update();
      } catch (e) {
        isLoading = false.obs;
      }
    } else {
      popUp(
          context: context,
          closeButton: true,
          title: 'Oops!',
          icon: Icons.wifi_off,
          text: 'Maaf, anda belum tersambung internet');
    }
  }
}
