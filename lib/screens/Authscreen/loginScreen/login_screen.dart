import 'package:flutter/material.dart';
import 'package:mamasliama/components/Buttons/custom_button.dart';
import 'package:mamasliama/components/TextField/custom_textfield.dart';
import 'package:mamasliama/screens/Authscreen/signupScreen/signup_screen.dart';
import 'package:mamasliama/screens/HomePage/bottomNav/bottomNavScreen.dart';
import 'package:mamasliama/utils/color_utils.dart';
import 'package:mamasliama/utils/image_utils.dart';
import 'package:mamasliama/utils/size_utils.dart';
import 'package:mamasliama/utils/textStyle_utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ClrUtls.secondaryDark,
              ClrUtls.primary,
              ClrUtls.primary,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(ImageUtils.logo), fit: BoxFit.fill)),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  // width: SizeUtils.getWidth(context) * 0.85,
                  child: Column(
                    children: [
                      CustomTextField(
                        hintText: "Enter your email or username...",
                        hintColor: ClrUtls.grey,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        hintText: "Enter your password...",
                        hintColor: ClrUtls.grey,
                        isPass: true,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CustomButton(
                          text: "Login",
                          textColor: ClrUtls.darkBrown,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          width: SizeUtils.getWidth(context) * 0.85,
                          height: 51,
                          borderRadius: 300,
                          color: ClrUtls.secondaryDark,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavScreen()));
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Forgot Password?",
                            style: TextStylesUtils.custom(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            child: Text(
                              "Reset Now!",
                              style: TextStylesUtils.custom(
                                fontWeight: FontWeight.w400,
                                color: ClrUtls.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 50,
                              width: 50,
                              child: Image.asset(ImageUtils.googleIcon)),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              height: 50,
                              width: 50,
                              child: Image.asset(ImageUtils.appleIcon)),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              height: 50,
                              width: 50,
                              child: Image.asset(ImageUtils.fbIcon))
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Dont't have an account?",
                            style: TextStylesUtils.custom(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                            },
                            child: Text(
                              "Create Now",
                              style: TextStylesUtils.custom(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: ClrUtls.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
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
                                  color: ClrUtls.secondary),
                            ),
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
                                  color: ClrUtls.secondaryDark),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
