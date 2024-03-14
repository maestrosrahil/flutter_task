import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final IconData prefixIcon;
  final bool isEnable;
  final int maxLength;

  const CustomTextFieldWidget(
      {Key? key,
      required this.hintText,
      required this.controller,
      required this.inputType,
      required this.inputAction,
      required this.prefixIcon,
      this.isEnable = true,
      this.maxLength=100})
      : super(key: key);

  //TextStyle(
  //             color: kHintColor,
  //             fontFamily: 'Nunito',
  //             fontWeight: FontWeight.w600),

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.quicksand(
        color: Theme.of(context).hintColor,
        fontWeight: FontWeight.w600,
      ),
      cursorColor: Theme.of(context).primaryColor,
      keyboardType: inputType,
      textInputAction: inputAction,
      controller: controller,
      inputFormatters: [
        LengthLimitingTextInputFormatter(maxLength),
      ],
      decoration: InputDecoration(
        enabled: isEnable,
        prefixIcon: Icon(
          prefixIcon,
          color: Theme.of(context).hintColor,
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.quicksand(
          color: Theme.of(context).hintColor,
          fontWeight: FontWeight.w600,
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide.none),
      ),
    );
  }
}

class DescriptionTextField extends StatelessWidget {
  const DescriptionTextField(
      {Key? key,
      required this.hintText,
      required this.controller,
      required this.inputType,
      required this.inputAction,
      required this.prefixIcon,
      this.isEnable = true,
      this.isPassword = false})
      : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final TextInputType inputType;
  final TextInputAction inputAction;

  final IconData prefixIcon;
  final bool isEnable;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.nunito(
        color: Theme.of(context).hintColor,
        fontWeight: FontWeight.w500,
      ),
      maxLines: 5,
      obscureText: isPassword,
      cursorColor: Theme.of(context).primaryColor,
      keyboardType: inputType,
      textInputAction: inputAction,
      controller: controller,
      decoration: InputDecoration(
        enabled: isEnable,
        // prefixIcon: Icon(
        //   prefixIcon,
        //   color: Theme.of(context).hintColor,
        // ),
        hintText: hintText,
        hintStyle: GoogleFonts.nunito(
          color: Theme.of(context).hintColor,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
            borderSide: BorderSide.none),
      ),
    );
  }
}

class CustomPasswordFieldWidget extends StatelessWidget {
  const CustomPasswordFieldWidget(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.inputType,
      required this.inputAction,
      required this.prefixIcon,
      this.isEnable = true,
      required this.isPasswordVisible,
      required this.onPasswordView});

  final String hintText;
  final TextEditingController controller;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final IconData prefixIcon;
  final bool isEnable;
  final bool isPasswordVisible;
  final VoidCallback onPasswordView;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPasswordVisible,
      style: GoogleFonts.quicksand(
        color: Theme.of(context).hintColor,
        fontWeight: FontWeight.w600,
      ),
      cursorColor: Theme.of(context).primaryColor,
      keyboardType: inputType,
      textInputAction: inputAction,
      controller: controller,
      decoration: InputDecoration(
        enabled: isEnable,
        prefixIcon: Icon(
          prefixIcon,
          color: Theme.of(context).hintColor,
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.quicksand(
          color: Theme.of(context).hintColor,
          fontWeight: FontWeight.w600,
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide.none),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            color: Theme.of(context).hintColor,
          ),
          onPressed: onPasswordView,
        ),
      ),
    );
  }
}
