// import 'package:flutter/material.dart';

// class MobileTextfield extends StatefulWidget {
//   final Color? borderColor;
//   final double? width;
//   final Color? fontColor;
//   final double? fontSize;
//   final double? flagSize;
//   final String? hintText;
//   MobileTextfield(
//       {super.key,
//       this.borderColor,
//       this.width,
//       this.fontColor,
//       this.fontSize,
//       this.flagSize,
//       this.hintText});

//   @override
//   State<MobileTextfield> createState() => _MobileTextfieldState();
// }

// class _MobileTextfieldState extends State<MobileTextfield> {
//   LayerLink layerLink = LayerLink();

//   late List<CountrySelectorNavigator> navigators;

//   late CountrySelectorNavigator selectorNavigator;

//   bool _shouldFormat = true;

//   bool _showFlagInInput = true;

//   bool _showArrow = false;

//   @override
//   @override
//   void initState() {
//     super.initState();
//     navigators = <CountrySelectorNavigator>[
//       const CountrySelectorNavigator.searchDelegate(),
//       const CountrySelectorNavigator.dialog(),
//       const CountrySelectorNavigator.bottomSheet(),
//       const CountrySelectorNavigator.modalBottomSheet(),
//       const CountrySelectorNavigator.draggableBottomSheet(),
//       CountrySelectorNavigator.dropdown(
//         backgroundColor: const Color(0xFFE7DEF6),
//         borderRadius: BorderRadius.circular(5),
//         layerLink: layerLink,
//         showSearchInput: true,
//       ),
//     ];
//     selectorNavigator = navigators.first;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PhoneInput(
//       defaultCountry: IsoCode.AE,
//       showArrow: _showArrow,
//       shouldFormat: _shouldFormat,
//       countryCodeStyle: TextStyle(
//           fontSize: widget.fontSize ?? 26,
//           color: widget.fontColor ?? Colors.white),
//       validator: PhoneValidator.compose(
//           [PhoneValidator.required(), PhoneValidator.valid()]),
//       flagShape: BoxShape.rectangle,
//       flagSize: widget.flagSize ?? 34,
//       showFlagInInput: _showFlagInInput,
//       style: TextStyle(
//           fontSize: widget.fontSize ?? 26,
//           color: widget.fontColor ?? Colors.white),
//       decoration: InputDecoration(
//         hintText: widget.hintText ?? "",
//         hintStyle: TextStyle(
//             color: Colors.grey.shade400,
//             fontWeight: FontWeight.normal,
//             fontSize: 14),
//         contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//         constraints: BoxConstraints(
//             maxWidth: widget.width ?? ScreenSizeUtil.getWidth(context) * 0.85),
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide(color: widget.borderColor ?? Colors.white)),
//         enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide(color: widget.borderColor ?? Colors.white)),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: widget.borderColor ?? Colors.white),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         labelStyle:
//             TextStyle(color: widget.fontColor ?? Colors.white, fontSize: 14),
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         // border: OutlineInputBorder(
//         //     borderRadius: BorderRadius.circular(0))
//       ),
//       countrySelectorNavigator: selectorNavigator,
//     );
//   }
// }
