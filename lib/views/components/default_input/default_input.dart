part of '../index.dart';

// ignore: must_be_immutable
class DefaultInput extends StatefulWidget {
  DefaultInput(
      {super.key,
      this.textColor = const Color(OurColors.darkBlue),
      // this.placeholderColor = const Color(),
      // this.iconColor = const Color(constants.primary_grey),
      this.title = '',
      this.fixedTitle = false,
      this.value,
      this.placeholder = '',
      this.inputFormatters,
      this.password = false,
      this.titleSpace = 7,
      this.belowSpace = 14,
      this.textAlign = TextAlign.start,
      this.textSize = 16,
      this.inputColor = const Color(OurColors.superLightBlue),
      this.prefixIcon,
      this.suffixIcon,
      this.onChange,
      this.passwordBool = true,
      this.onClick,
      this.borderColor,
      this.borderRadius = 7,
      this.height = 58,
      this.width = 50,
      this.maxLines = 1,
      this.minLines = 1,
      this.enabled = true,
      this.controller,
      this.keyboardType = TextInputType.text});

  final Color textColor;
  final bool fixedTitle;
  final double textSize;
  final dynamic value;
  final dynamic onChange;
  // final Color placeholderColor;
  // final Color iconColor;
  final double height;
  final String title;
  final dynamic inputFormatters;
  final String placeholder;
  final bool password;
  final double titleSpace;
  final double belowSpace;
  final TextAlign textAlign;
  final Color inputColor;
  final dynamic prefixIcon;
  final dynamic suffixIcon;
  bool passwordBool;
  final dynamic onClick;
  final dynamic borderColor;
  double borderRadius;
  final bool enabled;
  final double width;
  final int maxLines;
  final int minLines;
  final dynamic controller;
  final dynamic keyboardType;

  @override
  State<DefaultInput> createState() => _DefaultInputState();
}

class _DefaultInputState extends State<DefaultInput> {
  @override
  Widget build(BuildContext context) {
    String choosenTitle = widget.title;
    if (widget.title == '') {
      choosenTitle = widget.placeholder;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.fixedTitle) Text(choosenTitle),
        SizedBox(height: widget.titleSpace),
        SizedBox(
          height: widget.height,
          width: widget.width,
          child: TextField(
            inputFormatters: widget.inputFormatters,
            onChanged: widget.onChange,
            maxLines: widget.minLines > widget.maxLines
                ? widget.minLines
                : widget.maxLines,
            minLines: widget.minLines,
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            enabled: widget.enabled,
            onTap: () {
              widget.onClick != null ? widget.onClick() : null;
            },
            textAlign: widget.textAlign,
            obscureText: widget.passwordBool && widget.password,
            autocorrect: false,
            enableSuggestions: false,
            style:
                TextStyle(color: widget.textColor, fontSize: widget.textSize),
            decoration: InputDecoration(
              labelText: widget.title,
              labelStyle: TextStyle(color: widget.textColor),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: widget.borderColor ??
                          const Color(OurColors.darkBlue))),
              contentPadding: const EdgeInsets.all(18),
              prefixIcon:
                  widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
              suffixIcon: widget.password
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.passwordBool = !widget.passwordBool;
                        });
                      },
                      child: Icon(
                        widget.passwordBool
                            ? Icons.visibility_outlined
                            : Icons.visibility_off,
                        color: widget.textColor,
                      ))
                  : (widget.suffixIcon != null
                      ? Icon(
                          widget.suffixIcon,
                          color: widget.inputColor,
                        )
                      : null),
              filled: true,
              fillColor: widget.inputColor,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: BorderSide(
                      color:
                          widget.borderColor ?? const Color(OurColors.darkBlue),
                      width: 0.3)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius)),
              hintText: widget.placeholder,
              hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: widget.textSize,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
        SizedBox(height: widget.belowSpace),
      ],
    );
  }
}
