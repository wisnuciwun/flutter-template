part of '../index.dart';

class DefaultLayout extends StatelessWidget {
  final dynamic body;
  final Widget? floatingButton;
  final bool didMount;
  const DefaultLayout(
      {this.body = '', this.floatingButton, this.didMount = false, super.key});

  @override
  Widget build(BuildContext context) {
    String routeName = '';

    switch (Get.routing.current.toLowerCase()) {
      case '/profile':
        routeName = 'Profil';
        break;
      case '/createbankaccount':
        routeName = 'Simpan Rekening';
        break;
      case '/medical':
        routeName = 'Medical Staff';
        break;
      case '/createinvoice':
        routeName = 'Buat Invoice';
        break;
      case '/medicalinvoicedetail':
        routeName = 'Detail Invoice';
        break;
      case '/changepassword':
        routeName = 'Ubah Password';
        break;
      default:
        routeName = Get.routing.current;
    }

    return Scaffold(
        appBar: AppBar(
            leading: Builder(builder: (context) {
              return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(
                    Icons.reorder,
                    color: Colors.white,
                  ));
            }),
            backgroundColor: const Color(OurColors.darkBlue),
            title: Align(
              alignment: Alignment.centerRight,
              child: Text(
                routeName,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            )),
        floatingActionButton: floatingButton,
        drawer: Drawer(
          width: 210,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    ListTile(
                        dense: true,
                        visualDensity: const VisualDensity(vertical: -2),
                        title: TextIcon(
                          text: 'Profile',
                          icon: Icons.person,
                          spaceBetweenIcon: 15,
                          iconColor: Get.routing.current == '/Profile'
                              ? const Color(OurColors.lightOrange)
                              : const Color(OurColors.darkBlue),
                          textStyle: TextStyle(
                              fontSize: 20,
                              color: Get.routing.current == '/Profile'
                                  ? const Color(OurColors.lightOrange)
                                  : const Color(OurColors.darkBlue)),
                        ),
                        onTap: () {
                          Get.back();
                          Future.delayed(const Duration(milliseconds: 300), () {
                            // Get.to(() => const Profile());
                          });
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      dense: true,
                      visualDensity: const VisualDensity(vertical: -2),
                      title: TextIcon(
                        text: 'Medical Staff',
                        icon: Icons.emergency,
                        spaceBetweenIcon: 15,
                        iconColor: Get.routing.current == '/Medical'
                            ? const Color(OurColors.lightOrange)
                            : const Color(OurColors.darkBlue),
                        textStyle: TextStyle(
                            fontSize: 20,
                            color: Get.routing.current == '/Medical'
                                ? const Color(OurColors.lightOrange)
                                : const Color(OurColors.darkBlue)),
                      ),
                      onTap: () async {},
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.fromLTRB(14, 0, 14, 4),
                    child: Divider(),
                  ),
                  ListTile(
                      dense: true,
                      visualDensity: const VisualDensity(vertical: -2),
                      title: const TextIcon(
                        text: 'Ubah Password',
                        icon: Icons.lock_open,
                        iconSize: 18,
                        spaceBetweenIcon: 11,
                        iconColor: Color(OurColors.darkBlue),
                        textStyle: TextStyle(
                            fontSize: 14, color: Color(OurColors.darkBlue)),
                      ),
                      onTap: () {
                        Get.back();
                        Future.delayed(const Duration(milliseconds: 300), () {
                          // Get.to(() => ChangePassword());
                        });
                      }),
                  const SizedBox(
                    height: 4,
                  ),
                  ListTile(
                    dense: true,
                    visualDensity: const VisualDensity(vertical: -2),
                    title: const TextIcon(
                      text: 'Logout',
                      icon: Icons.logout,
                      iconSize: 18,
                      spaceBetweenIcon: 11,
                      iconColor: Color(OurColors.darkRed),
                      textStyle: TextStyle(
                          fontSize: 14, color: Color(OurColors.darkRed)),
                    ),
                    onTap: () async {
                      // await LocalData().deleteAll();
                      // Get.to(() => Login(), transition: Transition.fade);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ),
        body: didMount
            ? body
            : SingleChildScrollView(
                padding: OurDimens.screenPadding,
                child: body,
              ));
  }
}
