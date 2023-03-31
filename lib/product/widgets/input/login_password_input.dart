import 'package:flutter/material.dart';

class LoginPasswordInputField extends TextFormField {
  LoginPasswordInputField(
      {Key? key,
      String? title,
      bool isSecure = true,
      Widget? suffixIcon,
      String? Function(String?)? validator,
      bool? filled,
      Color? filledColor,
      TextEditingController? controller,
      void Function(String?)? onSaved})
      : super(
          key: key,
          controller: controller,
          validator: validator,
          onSaved: onSaved,
          onChanged: (text) {},
          obscureText: isSecure,
          style: const TextStyle(color: Colors.black),
          cursorColor: Colors.blue,
          decoration: InputDecoration(
              suffixIcon: suffixIcon,
              labelText: title ?? "Şifrenizi Giriniz",
              fillColor: const Color(0xffB4B4B4).withOpacity(0.2),
              filled: true,
              errorStyle: const TextStyle(color: Colors.red),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xffB4B4B4)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xffB4B4B4)),
              )),
        );
}
