part of '../index.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final double fontSize;
  final String route;
  final Color backgroundColor;
  final Color textColor;
  final dynamic onClick;
  final double height;
  final double width;
  final dynamic borderColor;
  final String argumentName;
  final String argumentValue;
  final dynamic argumentObject;
  final dynamic icon;
  final double borderRadius;

  const DefaultButton(
      {super.key,
      this.icon,
      this.height = 44,
      this.width = 200,
      this.title = '',
      this.route = '',
      this.backgroundColor = const Color(OurColors.superLightOrange),
      this.textColor = Colors.white,
      this.onClick,
      this.fontSize = 16,
      this.borderColor,
      this.argumentName = '',
      this.borderRadius = 40,
      this.argumentObject,
      this.argumentValue = ''});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: () {
          if (onClick != null) {
            onClick();
          } else {
            if (route != '') {
              Navigator.pushNamed(context, route, arguments: argumentObject);
            }
          }
        },
        style: TextButton.styleFrom(
            side: BorderSide(width: 0, color: borderColor ?? textColor),
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (icon != null)
              Icon(
                icon,
                color: textColor,
              ),
            const SizedBox(
              width: 10,
            ),
            Center(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: textColor,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// part of '../index.dart';

// class DefaultButton extends StatelessWidget {
//   final String title;
//   final double fontSize;
//   final String route;
//   final Color backgroundColor;
//   final Color textColor;
//   final dynamic onClick;
//   final double height;
//   final double width;
//   final dynamic borderColor;
//   final String argumentName;
//   final String argumentValue;
//   final dynamic argumentObject;
//   final dynamic icon;
//   final double borderRadius;

//   const DefaultButton(
//       {super.key,
//       this.icon,
//       this.height = 44,
//       this.width = 200,
//       this.title = '',
//       this.route = '',
//       this.backgroundColor = const Color(OurColors.superLightOrange),
//       this.textColor = Colors.white,
//       this.onClick,
//       this.fontSize = 16,
//       this.borderColor,
//       this.argumentName = '',
//       this.borderRadius = 8,
//       this.argumentObject,
//       this.argumentValue = ''});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width,
//       height: height,
//       child: ElevatedButton(
//         onPressed: () {
//           if (onClick != null) {
//             onClick();
//           } else {
//             if (route != '') {
//               Navigator.pushNamed(context, route, arguments: argumentObject);
//             }
//           }
//         },
//         style: ButtonStyle(
//             backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
//             overlayColor: MaterialStateProperty.resolveWith((states) {
//               return states.contains(MaterialState.pressed)
//                   ? const Color(OurColors.lightOrange)
//                   : null;
//             }),
//             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                 RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(borderRadius)))),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             if (icon != null)
//               Icon(
//                 icon,
//                 color: textColor,
//               ),
//             const SizedBox(
//               width: 10,
//             ),
//             Center(
//               child: Text(
//                 title,
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(
//                     color: textColor,
//                     fontSize: fontSize,
//                     fontWeight: FontWeight.w400),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
