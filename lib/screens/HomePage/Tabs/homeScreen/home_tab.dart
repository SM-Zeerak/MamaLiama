import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mamasliama/screens/HomePage/Tabs/homeScreen/subScreen/babyClothing/babyClothingSection.dart';
import 'package:mamasliama/screens/HomePage/Tabs/homeScreen/subScreen/maternityClothing/maternityClothingSection.dart';
import 'package:mamasliama/utils/color_utils.dart';
import 'package:mamasliama/utils/image_utils.dart';
import 'package:mamasliama/utils/size_utils.dart';
import 'package:mamasliama/utils/textStyle_utils.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ClrUtls.primary,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(children: [
              CircleAvatar(
                backgroundImage: AssetImage(ImageUtils.profile),
              ),
              Positioned(
                right: 0,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              )
            ]),
            Text(
              "Home Dashboard",
              style: TextStylesUtils.custom(
                  fontSize: 19, fontWeight: FontWeight.w700),
            ),
            Container(
              height: 37,
              width: 37,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: ClrUtls.btnFontClr),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: SvgPicture.asset(ImageUtils.sort),
              ),
            )
          ],
        ),
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
                            color:
                                _selectedIndex == 0 ? Colors.white : Colors.black,
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
                            color:
                                _selectedIndex == 1 ? Colors.white : Colors.black,
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
            child: _selectedIndex == 0 ? Babyclothingsection(category: 'Child',) : Maternityclothingsection(),
          )
        ],
      ),
    );
  }
}
