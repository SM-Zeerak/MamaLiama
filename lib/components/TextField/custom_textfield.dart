import 'package:flutter/material.dart';
import 'package:mamasliama/utils/color_utils.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final double? fontsize;
  final double? width;
  final double height; // Set height directly for the TextField
  final bool? isObscure;
  final bool? isPass;
  final String? label;
  final String? fontfamily;
  final String hintText;
  final Function()? onTapIcon;
  final Color borderColor;
  final Color labelColor;
  final double labelSize;
  final bool enable;
  final bool readOnly;
  final Color? hintColor;
  final Function()? onTap;
  final Widget? suffixIcon;
  final BorderRadius? borderRadius;

  const CustomTextField({
    super.key,
    this.controller,
    this.width,
    this.height = 54, // Height is now a required parameter
    this.isPass = false,
    this.isObscure,
    required this.hintText,
    this.onTapIcon,
    this.label,
    this.enable = true,
    this.readOnly = false,
    this.labelSize = 14,
    this.borderColor = Colors.white,
    this.labelColor = Colors.white,
    this.onTap,
    this.fontsize,
    this.fontfamily,
    this.hintColor,
    this.borderRadius,
    this.suffixIcon,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isPasswordVisible = false; // State to manage password visibility

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Shadow color
            offset: Offset(0, 4), // Shadow offset (vertical)
            blurRadius: 6, // Shadow blur radius
            spreadRadius: 1, // Spread radius
          ),
        ],
      ),
      child: TextField(
        style: TextStyle(
          color: Colors.black,
          fontFamily: widget.fontfamily ?? null,
          fontSize: widget.fontsize ?? 14,
        ),
        readOnly: widget.readOnly,
        controller: widget.controller,
        onTap: widget.onTap,
        obscureText: widget.isPass == true ? !_isPasswordVisible : (widget.isObscure ?? false), // Toggle visibility if isPass is true
        decoration: InputDecoration(
          constraints: BoxConstraints(
            maxWidth: widget.width ?? double.infinity,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
            borderSide: BorderSide(color: widget.borderColor),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: widget.label,
          labelStyle: TextStyle(color: widget.labelColor, fontSize: widget.labelSize),
          // Add padding to the right of the suffixIcon
          suffixIcon: widget.isPass == true
              ? IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined, 
                    color: ClrUtls.grey, 
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible; // Toggle password visibility
                    });
                  },
                )
              : widget.suffixIcon,
          contentPadding: EdgeInsets.symmetric(vertical: (widget.height - 24) / 2, horizontal: 16),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: widget.hintColor ?? Colors.grey.shade400,
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
          enabled: widget.enable,
          disabledBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white, width: 2),
          ),
          border: OutlineInputBorder(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(15),
            borderSide: BorderSide(color: widget.borderColor, width: 2),
          ),
          fillColor: Colors.grey.shade100,
          filled: true,
        ),
      ),
    );
  }
}
