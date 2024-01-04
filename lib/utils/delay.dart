class Delay {
  static dynamic delay1s(func) =>
      Future.delayed(const Duration(seconds: 1), () {
        func();
      });
  static dynamic delay05s(func) =>
      Future.delayed(const Duration(milliseconds: 500), () {
        func();
      });
}
