
import 'package:flutter/material.dart';
import 'package:stock_watchlist/core/constants/colors.dart';

class TextFieldCommon extends StatelessWidget {
  const TextFieldCommon({
    super.key,
    this.border,
    this.suffixIcon,
    this.hintText,
    this.controller,
    required this.textAlign,
    this.enabled,
    this.keyboardType,
    this.style,
    this.prefix,
    this.fillColor,
    this.focusNode,
    this.maxLines, this.cursorColor, this.minLines, this.onChanged, this.labelText,
  });
  final InputBorder? border;
  final TextStyle? style;
  final Widget? suffixIcon;
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final TextAlign textAlign;
  final bool? enabled;
  final TextInputType? keyboardType;
  final Widget? prefix;
  final Color? fillColor;
  final FocusNode? focusNode;
  final int? maxLines;
  final Color? cursorColor;
  final void Function(String)? onChanged;
  final int? minLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onTapOutside: (event) {
        // FocusScope.of(context).requestFocus(FocusNode());
        FocusManager.instance.primaryFocus?.unfocus();
      },
      maxLines: maxLines??1,
      minLines: minLines??1,
      focusNode: focusNode,
      cursorColor: cursorColor??kBlack,
      style: style,
      keyboardType: keyboardType,
      controller: controller,
      enabled: enabled,
      textAlign: textAlign,
      decoration: InputDecoration(
        prefix: prefix,
        labelText: labelText,
        fillColor: fillColor ?? kTransparent,
        border: border,
        disabledBorder: border,
        enabledBorder: border,
        focusedBorder: border,
        suffixIcon: suffixIcon,
        hintText: hintText,
        labelStyle:const TextStyle(
          color: kGrey,
        ),
        hintStyle:const TextStyle(
          color: kGrey,
          fontSize: 17,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
