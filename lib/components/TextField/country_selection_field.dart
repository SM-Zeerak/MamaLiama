import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:mamasliama/utils/textStyle_utils.dart'; // Assuming this contains colors you want

class CountrySelectionField extends StatefulWidget {
  final double height;
  final String hintText;
  final String? label;
  final double? labelSize;
  final String? fontFamily;
  final Color? labelColor;
  final Color borderColor;
  final Color? hintColor;
  final BorderRadius? borderRadius;
  final double? fontsize;
  final TextEditingController? controller; // Add the controller here

  const CountrySelectionField({
    Key? key,
    this.height = 54, // Height can be set just like CustomTextField
    required this.hintText,
    this.label,
    this.labelSize = 14,
    this.fontFamily,
    this.labelColor = Colors.black,
    this.borderColor = Colors.white,
    this.hintColor = Colors.grey,
    this.borderRadius,
    this.fontsize,
    this.controller, // Pass the controller through constructor
  }) : super(key: key);

  @override
  _CountrySelectionFieldState createState() => _CountrySelectionFieldState();
}

class _CountrySelectionFieldState extends State<CountrySelectionField> {
  Country? selectedCountry;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      widget.controller!.text = widget.hintText; // Initialize controller text
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: widget.borderRadius ?? BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(0, 4),
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          // Show the country picker when tapped
          showCountryPicker(
            context: context,
            showPhoneCode: false, // Show only country name, no phone code
            onSelect: (Country country) {
              setState(() {
                selectedCountry = country;
                if (widget.controller != null) {
                  widget.controller!.text = selectedCountry!.name; // Save the selected country name to the controller
                }
              });
            },
          );
        },
        child: InputDecorator(
          decoration: InputDecoration(
            constraints: BoxConstraints(maxWidth: double.infinity),
            focusedBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
              borderSide: BorderSide(color: widget.borderColor),
            ),
            contentPadding: EdgeInsets.symmetric(
                vertical: (widget.height - 24) / 2, horizontal: 16),
            enabled: true,
            border: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(15),
              borderSide: BorderSide(color: widget.borderColor, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(15),
              borderSide: BorderSide(color: widget.borderColor, width: 2),
            ),
            filled: true,
            fillColor: Colors.grey.shade100,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedCountry != null
                    ? selectedCountry!.name // Only country name displayed
                    : widget.hintText, // Placeholder text if no country selected
                style: TextStylesUtils.custom(
                  color: selectedCountry == null
                      ? widget.hintColor ?? Colors.grey.shade400
                      : Colors.black,
                  fontSize: widget.fontsize ?? 14,
                ),
              ),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }
}
