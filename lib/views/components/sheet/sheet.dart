part of '../index.dart';

sheetsOpen({required context, children, double padding = 20}) {
  showModalBottomSheet<dynamic>(
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20))),
    context: context,
    builder: (BuildContext context) {
      return Container(
          padding: EdgeInsets.all(padding),
          child: ListView(shrinkWrap: true, children: <Widget>[
            Center(
              child: SizedBox(
                width: 60.0,
                height: 7.0,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0))),
                ),
              ),
            ),
            Container(
              child: children,
            ),
            const SizedBox(
              height: 10,
            )
          ]));
    },
  );
}
