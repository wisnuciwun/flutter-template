part of '../index.dart';

popUp(
    {required context,
    String title = '',
    bool closeButton = false,
    bool enableOutsideClick = true,
    IconData? icon = Icons.task_alt,
    Color iconColor = const Color(OurColors.superLightOrange),
    String text = '',
    dynamic buttons}) {
  return showDialog(
      context: context,
      barrierDismissible: enableOutsideClick,
      builder: (context) {
        List<Widget> buttonsWidget = [];
        Widget close = const SizedBox(height: 0);

        if (buttons != null) {
          buttonsWidget.add(buttons);
        }

        if (closeButton) {
          close = DefaultButton(
            title: 'Tutup',
            width: Get.width,
            onClick: () => Get.back(closeOverlays: true),
          );
        }

        return Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  icon,
                  size: 60,
                  color: iconColor,
                ),
                const SizedBox(height: 20),
                DefaultTextStyle(
                    style: const TextStyle(
                        fontSize: 20,
                        color: Color(OurColors.darkBlue),
                        fontWeight: FontWeight.w600),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                    )),
                const SizedBox(height: 20),
                DefaultTextStyle(
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 12, color: Color(OurColors.darkBlue)),
                  child: Text(text),
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: buttonsWidget,
                ),
                close,
              ],
            ),
          ),
        );
      });
}
