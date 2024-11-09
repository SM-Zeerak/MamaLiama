import 'package:flutter/material.dart';
import 'package:mamasliama/screens/profileScreen/profileSetupScreen/profileSetupScreen.dart';
import 'package:mamasliama/utils/color_utils.dart';
import 'package:mamasliama/utils/image_utils.dart';
import 'package:mamasliama/utils/textStyle_utils.dart';

class ProfileSuccess extends StatelessWidget {
  const ProfileSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Profilesetupscreen()));
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 140,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageUtils.profileSuccess),
                    fit: BoxFit.cover),
              ),
            ),
            Text(
              "Profile has been",
              style: TextStylesUtils.custom(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: ClrUtls.btnFontClr),
            ),
            Text(
              "successfully created!",
              style: TextStylesUtils.custom(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: ClrUtls.btnFontClr),
            )
          ],
        ),
      ),
    );
  }
}
