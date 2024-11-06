import 'package:flutter/material.dart';
import 'package:mamasliama/components/Buttons/custom_button.dart';
import 'package:mamasliama/screens/Authscreen/loginScreen/login_screen.dart';
import 'package:mamasliama/utils/color_utils.dart';
import 'package:mamasliama/utils/image_utils.dart';
import 'package:mamasliama/utils/size_utils.dart';
import 'package:mamasliama/utils/textStyle_utils.dart';

class Getstartedscreen extends StatelessWidget {
  const Getstartedscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: SizeUtils.getWidth(context) * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Easy Rentals\n',
                        style: TextStylesUtils.custom(
                            fontSize: 32,
                            color: ClrUtls.btnFontClr,
                            fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                        text: 'For ',
                        style: TextStylesUtils.custom(
                            fontSize: 32,
                            color: ClrUtls.btnFontClr,
                            fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                        text: 'Momies ',
                        style: TextStylesUtils.custom(
                            fontSize: 32,
                            color: ClrUtls.secondaryDark2,
                            fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                        text: 'To\n',
                        style: TextStylesUtils.custom(
                            fontSize: 32,
                            color: ClrUtls.btnFontClr,
                            fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                        text: 'Be ',
                        style: TextStylesUtils.custom(
                            fontSize: 32,
                            color: ClrUtls.btnFontClr,
                            fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                        text: '& ',
                        style: TextStylesUtils.custom(
                            fontSize: 32,
                            color: ClrUtls.btnFontClr,
                            fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                        text: 'Their\n',
                        style: TextStylesUtils.custom(
                            fontSize: 32,
                            color: ClrUtls.btnFontClr,
                            fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                        text: 'Tiny Llamas',
                        style: TextStylesUtils.custom(
                            fontSize: 32,
                            color: ClrUtls.secondaryDark2,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 350,
                child: Stack(children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Container(
                        width: 245,
                        height: 245,
                        decoration: BoxDecoration(
                            color: ClrUtls.secondaryDark,
                            borderRadius: BorderRadius.circular(250)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Container(
                        width: 115,
                        height: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(ImageUtils.image1),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 45, right: 20),
                      child: Container(
                        width: 290,
                        height: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(ImageUtils.mainImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(ImageUtils.image2),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  )
                ]),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SizedBox(
                  width: 280,
                  child: Text(
                    'orem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                    style: TextStylesUtils.custom(
                        fontSize: 12, color: ClrUtls.grey),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Container(
                  width: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: ClrUtls.btnFontClr),
                      ),
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: ClrUtls.secondary),
                      ),
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: ClrUtls.secondaryDark),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: CustomButton(
                  text: "Get Started",
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  fontSize: 16,
                  textColor: Colors.white,
                  fontWeight: FontWeight.w700,
                  color: ClrUtls.darkBrown,
                  borderRadius: 30,
                  width: 220,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
