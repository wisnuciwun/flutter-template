part of '../index.dart';

class TextIcon extends StatelessWidget {
  final String text;
  final IconData? icon;
  final double iconSize;
  final TextStyle textStyle;
  final double spaceBetweenIcon;
  final Color iconColor;

  const TextIcon(
      {this.textStyle = const TextStyle(color: Colors.black),
      this.icon,
      this.spaceBetweenIcon = 5,
      this.iconSize = 25,
      this.text = '',
      this.iconColor = Colors.black,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon != null
            ? Icon(
                icon,
                color: iconColor,
                size: iconSize,
              )
            : const SizedBox(
                width: 0,
              ),
        SizedBox(
          width: spaceBetweenIcon,
        ),
        Text(
          text,
          style: textStyle,
        ),
      ],
    );
  }
}
