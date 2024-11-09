import 'package:flutter/material.dart';
import 'package:mamasliama/screens/AdminScreens/Product%20Listing/babyClothingAdmin.dart';
import 'package:mamasliama/screens/AdminScreens/Product%20Listing/maternityClothingAdmin.dart';
import 'package:mamasliama/utils/color_utils.dart';
import 'package:mamasliama/utils/size_utils.dart';
import 'package:mamasliama/utils/textStyle_utils.dart';

class ProductListingScreen extends StatefulWidget {
  ProductListingScreen({super.key});

  @override
  State<ProductListingScreen> createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ClrUtls.primary,
        title: Text(
          "Admin Dashboard",
          style:
              TextStylesUtils.custom(fontSize: 19, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(color: ClrUtls.secondary),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                  child: Container(
                    width: SizeUtils.getWidth(context) * 0.45,
                    height: 50,
                    decoration: BoxDecoration(
                        color: _selectedIndex == 0
                            ? ClrUtls.btnFontClr
                            : ClrUtls.secondary,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        "Baby Clothing",
                        style: TextStylesUtils.custom(
                            color: _selectedIndex == 0
                                ? Colors.white
                                : Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                  child: Container(
                    width: SizeUtils.getWidth(context) * 0.45,
                    height: 50,
                    decoration: BoxDecoration(
                        color: _selectedIndex == 1
                            ? ClrUtls.btnFontClr
                            : ClrUtls.secondary,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        "Maternity Clothing",
                        style: TextStylesUtils.custom(
                            color: _selectedIndex == 1
                                ? Colors.white
                                : Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: _selectedIndex == 0
                ? BabyclothingAdmin(
                    category: 'Baby',
                  )
                : MaternityclothingAdmin(),
          )
        ],
      ),
    );
  }
}
