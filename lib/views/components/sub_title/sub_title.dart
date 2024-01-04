part of '../index.dart';

class SubTitle extends StatelessWidget {
  final String title;
  final dynamic icon;
  final double spaceBelow;

  const SubTitle(
      {this.title = '', this.icon = '', this.spaceBelow = 0, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon != ''
            ? Icon(
                icon,
                size: 20,
                color: const Color(OurColors.darkBlue),
              )
            : const Text(''),
        const SizedBox(
          width: 7,
        ),
        Text(
          title,
          style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: Color(OurColors.darkBlue)),
        ),
        SizedBox(
          height: spaceBelow,
        )
      ],
    );
  }
}
