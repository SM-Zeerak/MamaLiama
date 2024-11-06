import 'package:flutter/material.dart';
import 'package:mamasliama/components/Buttons/custom_button.dart';
import 'package:mamasliama/components/TextField/custom_textfield.dart';
import 'package:mamasliama/utils/color_utils.dart';
import 'package:mamasliama/utils/image_utils.dart';
import 'package:mamasliama/utils/size_utils.dart';
import 'package:mamasliama/utils/textStyle_utils.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ClrUtls.secondaryDark,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, size: 18,),
          ),
        ),
        title: Text("Signup", style: TextStylesUtils.custom(
          fontSize: 18
        ),),
        centerTitle: true,
      ),
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
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(ImageUtils.logo),
                          fit: BoxFit.contain)),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: [
                      CustomTextField(
                        hintText: "Enter your email address...",
                        hintColor: ClrUtls.grey,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        hintText: "Re-Enter your email address...",
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
                        height: 20,
                      ),
                      CustomTextField(
                        hintText: "Re-Enter your password...",
                        hintColor: ClrUtls.grey,
                        isPass: true,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                          text: "Signup",
                          textColor: ClrUtls.darkBrown,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          width: SizeUtils.getWidth(context) * 0.6,
                          height: 51,
                          borderRadius: 300,
                          color: ClrUtls.secondaryDark,
                          onPressed: () {}),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 54,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: 30,
                                  width: 50,
                                  child: Image.asset(ImageUtils.googleIcon)),
                              Text(
                                "Continue with Google",
                                style: TextStylesUtils.custom(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 54,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: 30,
                                  width: 50,
                                  child: Image.asset(ImageUtils.fbIcon)),
                              Text(
                                "Continue with Facebook",
                                style: TextStylesUtils.custom(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 54,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: 30,
                                  width: 50,
                                  child: Image.asset(ImageUtils.appleIcon)),
                              Text(
                                "Continue with IOS",
                                style: TextStylesUtils.custom(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStylesUtils.custom(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            child: Text(
                              "Login here!",
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
                    ],
                  ),
                ),
                SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
