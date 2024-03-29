import 'package:bet_for_big/constant/constants.dart';
import 'package:bet_for_big/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';




class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String label;
  final TextAlign? textAlign;
  final Widget? suffixIcon;
  final Widget? icon;
  final Color? fieldColor;
  final bool? obscureText;
  final int? maxLines;
  final ValueChanged<String>? onchange;
  final Function(String)? onsubmit;
  final TextInputType inputType;
  final FocusNode? focusNode;
  final bool enabled;

  final FormFieldValidator<String>? validator;
  CustomTextFieldWidget(
      {super.key,
      required this.controller,
      this.onchange,
      required this.hintText,
      this.validator,
      this.icon,
      this.obscureText = false,
      this.suffixIcon,
       this.onsubmit,
      required this.inputType,
      this.maxLines,
      required this.label,
      this.focusNode,
      required this.enabled,
      this.fieldColor, this.textAlign});

  final themecontroller = Get.put(ThemeHelper());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        label == ''
            ? SizedBox()
            : Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  label,
                  style: TextStyle(
                      color: themecontroller.textcolor,
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp),
                ),
              ),
        SizedBox(
          height: 5.sp,
        ),
        TextFormField(
          textAlign: textAlign??TextAlign.start,
          onFieldSubmitted: onsubmit,
          enabled: enabled,
          focusNode: focusNode,
          controller: controller,
          keyboardType: inputType,
          obscureText: obscureText!,
          maxLines: maxLines ?? 1,
          style: TextStyle(
            color: themecontroller.textcolor,
            fontSize: 14,
          ),
          inputFormatters: [
            FilteringTextInputFormatter.deny(
                RegExp(r'\s\s+')), // Deny consecutive spaces
            LeadingSpaceTrimmerInputFormatter(), // Custom input formatter to trim leading spaces
          ],
          validator: validator,
          decoration: InputDecoration(
            fillColor: fieldColor ?? themecontroller.textfiledecolor,
            filled: true,
            suffixIcon: suffixIcon,
            prefixIcon: icon,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                
                  color: themecontroller.bordercolor.withOpacity(0.4)),
              borderRadius: BorderRadius.circular(Constants.appTxtFld_borderRadius),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                  color: themecontroller.bordercolor.withOpacity(0.4)),
              borderRadius: BorderRadius.circular(Constants.appTxtFld_borderRadius),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                  color: themecontroller.bordercolor.withOpacity(0.4)),
              borderRadius: BorderRadius.circular(Constants.appTxtFld_borderRadius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                  color: themecontroller.bordercolor.withOpacity(0.4)),
              borderRadius: BorderRadius.circular(Constants.appTxtFld_borderRadius),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                  color: themecontroller.bordercolor.withOpacity(0.4)),
              borderRadius: BorderRadius.circular(Constants.appTxtFld_borderRadius),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                  color: themecontroller.bordercolor.withOpacity(0.4)),
              borderRadius: BorderRadius.circular(Constants.appTxtFld_borderRadius),
            ),
            counterStyle: TextStyle(
              color: themecontroller.textcolor,
            ),
            
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 14.sp,
              color: themecontroller.textcolor.withOpacity(0.5),
            ),
          ),
        ),
      ],
    );
  }
}

class LeadingSpaceTrimmerInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Trim leading spaces from the text value
    if (newValue.text.startsWith(' ')) {
      final trimmedText = newValue.text.trimLeft();
      return newValue.copyWith(
        text: trimmedText,
        composing: TextRange.collapsed(trimmedText.length),
      );
    }
    return newValue;
  }
}
