import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CommonWidgets {
  static Widget myTextField(
      {required String labelText,
      required String hintText,
      required bool iconVisible,
      int? maxLength,
      bool readOnly = false,
      String? counterText = '',
      Widget? icon,
      List<TextInputFormatter>? inputFormatters,
      TextInputType? inputType,
      ValueChanged<String>? onChanged,
      String? Function(String?)? validator,
      TextCapitalization textCapitalization = TextCapitalization.none,
      TextEditingController? controller,
      bool autofocus = false,
      GestureTapCallback? onTap,
      EdgeInsetsGeometry? contentPadding,
      bool obscureText = false}) {
    return iconVisible
        ? TextFormField(
            onTap: onTap,
            autofocus: autofocus,
            maxLength: maxLength,
            keyboardType: inputType,
            obscureText: obscureText,
            controller: controller,
            validator: validator,
            textCapitalization: textCapitalization,
            inputFormatters: inputFormatters,
            onChanged: onChanged ??
                (value) {
                  value = value.trim();
                  if (value.isEmpty || value.replaceAll(" ", "").isEmpty) {
                    controller?.text = "";
                  }
                },
            readOnly: readOnly,
            cursorColor: Theme.of(Get.context!).colorScheme.primary,
            style: Theme.of(Get.context!)
                .textTheme
                .subtitle2
                ?.copyWith(fontSize: 16.px),
            decoration: InputDecoration(
                counterText: counterText,
                labelText: labelText,
                labelStyle: Theme.of(Get.context!)
                    .textTheme
                    .subtitle1
                    ?.copyWith(
                        color: Theme.of(Get.context!)
                            .colorScheme
                            .onSurface
                            .withOpacity(.4)),
                hintText: hintText,
                constraints: const BoxConstraints(),
                contentPadding:
                    contentPadding ?? EdgeInsets.only(left: 10.px, top: 7.px),
                hintStyle: Theme.of(Get.context!).textTheme.subtitle2?.copyWith(
                    fontSize: 16.px,
                    color: Theme.of(Get.context!)
                        .colorScheme
                        .onSurface
                        .withOpacity(.4)),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: icon,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                )),
          )
        : TextFormField(
            onTap: onTap,
            maxLength: maxLength,
            keyboardType: inputType,
            obscureText: obscureText,
            controller: controller,
            autofocus: autofocus,
            onChanged: onChanged ??
                (value) {
                  value = value.trim();
                  if (value.isEmpty || value.replaceAll(" ", "").isEmpty) {
                    controller?.text = "";
                  }
                },
            inputFormatters: inputFormatters,
            textCapitalization: textCapitalization,
            readOnly: readOnly,
            validator: validator,
            cursorColor: Theme.of(Get.context!).colorScheme.primary,
            style: Theme.of(Get.context!)
                .textTheme
                .subtitle2
                ?.copyWith(fontSize: 16.px),
            decoration: InputDecoration(
                counterText: counterText,
                labelText: labelText,
                constraints: const BoxConstraints(),
                labelStyle: Theme.of(Get.context!)
                    .textTheme
                    .subtitle1
                    ?.copyWith(
                        color: Theme.of(Get.context!)
                            .colorScheme
                            .onSurface
                            .withOpacity(.4)),
                hintText: hintText,
                contentPadding: contentPadding,
                hintStyle: Theme.of(Get.context!).textTheme.subtitle2?.copyWith(
                    fontSize: 16.px,
                    color: Theme.of(Get.context!)
                        .colorScheme
                        .onSurface
                        .withOpacity(.4)),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                )),
          );
  }

  static Widget myElevatedButton(
      {String? text,
      required VoidCallback onPressed,
      double? width,
      double? height,
      Color? backgroundColor,
      EdgeInsetsGeometry? margin,
      double? borderRadius,
      Widget? child,
      bool progressBarValue = false}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 25.px),
        ),
        minimumSize: Size(width ?? double.infinity, height ?? 46.px),
        shadowColor: Colors.transparent,
        backgroundColor: backgroundColor,
        padding: EdgeInsets.all(3.5.px),
      ),
      child: progressBarValue
          ? SizedBox(
              height: 22.px,
              width: 22.px,
              child: CircularProgressIndicator(
                strokeWidth: 4.px,
              ),
            )
          : child ?? Text(
                text ?? '',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.px),
              ),
    );
  }

  static commonCircularProgressBarView() {
    return Center(
      child: SizedBox(
        height: 25.px,
        width: 25.px,
        child: CircularProgressIndicator(
          color: Colors.blue,
          strokeWidth: 3.px,
          backgroundColor: Colors.grey,
        ),
      ),
    );
  }

}
