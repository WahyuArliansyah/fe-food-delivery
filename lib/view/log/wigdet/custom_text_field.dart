import 'package:apk_mobile/view/log/styles_log.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    required this.textInputType,
    required this.textInputAction,
    required this.hint,
    this.isObscure = false,
    this.hasSuffix = false,
    this.onPressed,
    this.prefixIcon,
    this.validator,
    super.key,
  });

  // mengatur teks yang dimasukkan user
  final TextEditingController controller;

  //menentukan jenis inputan yang akan dimasukkan user (teks, angka, email)
  final TextInputType textInputType;

  // menentukan tombol aksi dikeyboard (selesai, lanjut, search)
  final TextInputAction textInputAction;

  // memberikan teks dalam bentuk placeholder untuk memberikan petunjuk kepada user
  final String hint;

// mengatur teks yang diinput dipassword disembunyikan atau muncul
// jika isObscure bernilai true = text disembunyikan
// jika isObscure bernilai false = text muncul
  final bool isObscure;

// menentukan icon yang berada diujung kanan TextField password
  final bool hasSuffix;

// memberikan callback saat icon ditekan
  final VoidCallback? onPressed;

  // memberikan icon disebelah kiri
  final IconData? prefixIcon;

  // validasi ketika user tidak mengisi textfield
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: CustomText.body,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      obscureText: isObscure,
      validator: validator,
      decoration: InputDecoration(
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: hasSuffix
              ? IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    isObscure ? Icons.visibility : Icons.visibility_off,
                  ),
                )
              : null,
          // saat TextField tidak dalam keadaan fokus
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1.0,
              color: AppColors.darkGrey,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),

          // saat TextField keadaan fokus
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1.0,
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),

          // saat dalam keadaan textfield error dan tidak fokus
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1.0,
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),

          // saat dalam keadaan textfield error dan fokus
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1.0,
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          hintText: hint,
          hintStyle: CustomText.body),
    );
  }
}
