part of './index.dart';

class GlobalController extends GetxController {
  Rx<ScrollController> scrollController = ScrollController().obs;
  RxDouble scrollPosition = 0.0.obs;

  @override
  void onClose() {
    scrollController.value.dispose();
    super.onClose();
  }

  onChangeScrollValue() {
    scrollPosition.value = scrollController.value.position.pixels;
    update();
  }
}
