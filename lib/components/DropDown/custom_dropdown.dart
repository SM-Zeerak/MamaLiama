import 'package:flutter/material.dart';
import 'package:mamasliama/utils/color_utils.dart';
import 'package:mamasliama/utils/textStyle_utils.dart';

class CustomDropDown extends StatefulWidget {
  final TextEditingController? controller;
  final double? fontsize;
  final double? width;
  final double height; 
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
  final BorderRadius? borderRadius;
  final String? selectedCategory; // The selected category for dropdown

  const CustomDropDown({
    super.key,
    this.controller,
    this.width,
    this.height = 54,
    required this.hintText,
    this.onTapIcon,
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
    this.selectedCategory, 
  });

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? _currentCategory;

  @override
  void initState() {
    super.initState();
    _currentCategory = widget.selectedCategory;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0, 4),
              blurRadius: 6,
              spreadRadius: 1,
            ),
          ],
        ),
        child: DropdownButton<String>(
          value: _currentCategory,
          isExpanded: true,
          onChanged: (String? newValue) {
            setState(() {
              _currentCategory = newValue;
            });
          },
          items: ['Child', 'Men'] // Static list of dropdown options
              .map<DropdownMenuItem<String>>((String category) {
            return DropdownMenuItem<String>(
              value: category,
              child: Text(
                category,
                style:
                    TextStylesUtils.custom(color: Colors.black, fontSize: 14),
              ),
            );
          }).toList(),
          style:
              TextStyle(color: Colors.black, fontSize: widget.fontsize ?? 14),
          underline: Container(), // Remove default underline of dropdown
          icon: Icon(
            Icons.arrow_drop_down,
            color: ClrUtls.grey,
          ),
          hint: Text(
            widget.hintText,
            style: TextStyle(
              color: widget.hintColor ?? Colors.grey.shade400,
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ) // Otherwise, show regular text field
        );
  }
}
