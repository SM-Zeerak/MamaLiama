import 'package:flutter/material.dart';
import 'package:mamasliama/screens/AdminScreens/Product%20Listing/product_listing_screen.dart';
import 'package:mamasliama/screens/AdminScreens/product_adding_screen.dart';
import 'package:mamasliama/screens/HomePage/Tabs/settingScreen/components/setting_cards.dart';
import 'package:mamasliama/utils/image_utils.dart';
import 'package:mamasliama/utils/size_utils.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 60),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  SettingCards(
                    icon: ImageUtils.settingIcon,
                    text: 'Account Information',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SettingCards(
                    icon: ImageUtils.settingIcon,
                    text: 'Address Detail',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SettingCards(
                    icon: ImageUtils.settingIcon,
                    text: 'History Purchase',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SettingCards(
                    icon: ImageUtils.settingIcon,
                    text: 'Notifications Settings',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SettingCards(
                    icon: ImageUtils.settingIcon,
                    text: 'Privacy & Policy',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SettingCards(
                    icon: ImageUtils.settingIcon,
                    text: 'Help & Support',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SettingCards(
                    icon: ImageUtils.settingIcon,
                    text: 'About',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SettingCards(
                      icon: ImageUtils.settingIcon,
                      text: 'Add Items',
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductAddingScreen()));
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  SettingCards(
                    icon: ImageUtils.settingIcon,
                    text: 'Product Listing',
                    ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductListingScreen()));
                      }
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SettingCards(
                    icon: ImageUtils.settingIcon,
                    text: 'Logout',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
