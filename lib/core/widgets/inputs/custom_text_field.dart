import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:imzo/core/utils/utils.dart";
import 'package:imzo/core/extension/build_context_extension.dart';

typedef Validator = String? Function(String?);
typedef OnChanged = void Function(String);
typedef OnFieldSubmitted = void Function(String);

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
        this.controller,
        this.validator,
        this.onChanged,
        this.textInputType = TextInputType.text,
        this.currentFocus,
        this.textCapitalization = TextCapitalization.none,
        this.cursorColor,
        this.enabled = true,
        this.obscure = false,
        this.inputFormatters,
        this.textInputAction = TextInputAction.done,
        this.nextFocus,
        required this.hintText,
        this.errorText,
        this.suffix,
        this.suffixIcon,
        this.prefix,
        this.prefixIcon,
        this.prefixTextStyle,
        this.suffixTextStyle,
        this.prefixText,
        this.suffixText,
        this.labelTextStyle,
        this.labelText,
        this.labelInTextField = false,
        this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        this.cursorHeight,
        this.onFieldSubmitted,
        this.maxLines = 1,
        this.autofillHints,
        this.readOnly,
        this.onTap,
        this.fillColor,
        this.textAlign,
        this.errorBorder = false,
        this.enabledBorder,
        this.focusedBorder
      });

  final TextEditingController? controller;
  final Validator? validator;
  final OnChanged? onChanged;
  final TextInputType textInputType;
  final FocusNode? currentFocus;
  final FocusNode? nextFocus;
  final TextCapitalization textCapitalization;
  final Color? cursorColor;
  final bool enabled;
  final bool obscure;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction textInputAction;
  final String hintText;
  final String? errorText;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Widget? prefix;
  final Widget? prefixIcon;
  final TextStyle? prefixTextStyle;
  final TextStyle? suffixTextStyle;
  final TextStyle? labelTextStyle;
  final String? labelText;
  final String? prefixText;
  final String? suffixText;
  final bool labelInTextField;
  final EdgeInsetsGeometry? contentPadding;
  final double? cursorHeight;
  final OnFieldSubmitted? onFieldSubmitted;
  final int? maxLines;
  final Iterable<String>? autofillHints;
  final bool? readOnly;
  final VoidCallback? onTap;
  final Color? fillColor;
  final TextAlign? textAlign;
  final bool errorBorder;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;


  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisSize: MainAxisSize.min,
    children: [
      if (labelText != null && !labelInTextField)
        Text(
          labelText!,
          style: labelTextStyle ?? context.textStyle.regularCaption2,
        ),
      if (labelText != null && !labelInTextField) AppUtils.kGap8,
      TextFormField(
        textAlign: textAlign ?? TextAlign.start,
        key: key,
        readOnly: readOnly ?? false,
        style: context.textTheme.bodySmall,
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        keyboardType: textInputType,
        focusNode: currentFocus,
        textCapitalization: textCapitalization,
        cursorColor: cursorColor ?? context.colorScheme.primary,
        enableInteractiveSelection: true,
        obscureText: obscure,
        enabled: enabled,
        textInputAction: textInputAction,
        maxLines: maxLines,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onTap: onTap,
        onEditingComplete: () {
          if (nextFocus != null) {
            nextFocus?.requestFocus();
          } else {
            currentFocus?.unfocus();
          }
        },
        onFieldSubmitted: (_) {
          _fieldFocusChange(context, currentFocus, nextFocus);
        },
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          focusColor: Colors.deepPurpleAccent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          fillColor: fillColor ?? const Color(0xffF9F9F9),
          // Background color
          filled: true,
          labelText: labelInTextField ? labelText : null,
          labelStyle: labelTextStyle ??
              context.textStyle.regularCaption2
                  .copyWith(fontWeight: FontWeight.w400),
          iconColor: context.colorScheme.primary,
          hintText: hintText,
          hintStyle: TextStyle(
            color: const Color(0xff0B0C0E).withOpacity(0.3),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          errorText: errorText,
          contentPadding: contentPadding,
          suffix: suffix,
          suffixIcon: suffixIcon,
          suffixIconColor: const Color(0xFF71717A),
          prefixIconColor: const Color(0xFF71717A),
          prefix: prefix,
          prefixIcon: prefixIcon,
          prefixText: prefixText,
          prefixStyle: prefixTextStyle,
          suffixText: suffixText,
          suffixStyle: suffixTextStyle,
          errorStyle: TextStyle(
              fontWeight: FontWeight.w400,
              color: context.colorScheme.error),
          errorBorder:
          OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: errorBorder ? Colors.red : Colors.black
              ))
          ,

          focusedErrorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),

            borderSide: BorderSide(
                color: errorBorder ? Colors.red : Colors.black
            ),

          ),
          focusedBorder:focusedBorder,
          enabledBorder: enabledBorder,

        ),

        cursorHeight: cursorHeight,
        autofillHints: autofillHints,
      ),
    ],
  );

  void _fieldFocusChange(
      BuildContext context,
      FocusNode? currentFocus,
      FocusNode? nextFocus,
      ) {
    if (currentFocus != null && nextFocus != null) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }
  }
}

extension EmailValidator on String {
  bool isValidEmail() => RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(this);
}
