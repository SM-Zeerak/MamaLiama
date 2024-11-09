import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mamasliama/screens/HomePage/Tabs/homeScreen/home_tab.dart';
import 'package:mamasliama/screens/HomePage/Tabs/settingScreen/setting_tab.dart';
import 'package:mamasliama/utils/color_utils.dart';
import 'package:mamasliama/utils/image_utils.dart';
import 'package:mamasliama/utils/size_utils.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  // List of screens to navigate to
  List<Widget> _screens = [
    Screen1(),
    Screen2(),
    HomeTab(),
    Screen4(),
    SettingTab(),
  ];

  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Stack(children: [
        _screens[_selectedIndex],
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 100,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 60, // Set the height of the bottom navigation bar
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color: ClrUtls.secondaryDark),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = 0;
                                });
                              },
                              child: Container(
                                  width: 34,
                                  height: 34,
                                  child: _selectedIndex == 0
                                      ? SizedBox()
                                      : SvgPicture.asset(
                                          ImageUtils.restoreIcon,
                                          width: 24,
                                          height: 24,
                                          fit: BoxFit.fill,
                                        )),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = 1;
                                });
                              },
                              child: Container(
                                  width: 34,
                                  height: 34,
                                  child: _selectedIndex == 1
                                      ? SizedBox()
                                      : SvgPicture.asset(
                                          ImageUtils.distanceIcon,
                                          width: 24,
                                          height: 24,
                                          fit: BoxFit.contain,
                                        )),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = 2;
                                });
                              },
                              child: Container(
                                  width: 34,
                                  height: 34,
                                  child: _selectedIndex == 2
                                      ? SizedBox()
                                      : SvgPicture.asset(
                                          ImageUtils.homeIcon,
                                          width: 24,
                                          height: 24,
                                          fit: BoxFit.contain,
                                          color: ClrUtls.btnFontClr,
                                        )),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = 3;
                                });
                              },
                              child: Container(
                                  width: 34,
                                  height: 34,
                                  child: _selectedIndex == 3
                                      ? SizedBox()
                                      : SvgPicture.asset(
                                          ImageUtils.mailIcon,
                                          width: 24,
                                          height: 24,
                                          fit: BoxFit.fill,
                                        )),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = 4;
                                });
                              },
                              child: Container(
                                  width: 34,
                                  height: 34,
                                  child: _selectedIndex == 4
                                      ? SizedBox()
                                      : SvgPicture.asset(
                                          ImageUtils.settingIcon,
                                          width: 24,
                                          height: 24,
                                          fit: BoxFit.fill,
                                        )),
                            ),
                          ])),
                ),
          
                // Positioned blue circle above the selected tab
                Positioned(
                  left: _selectedIndex == 0
                      ? SizeUtils.getWidth(context) * 0.01
                      : _selectedIndex == 1
                          ? SizeUtils.getWidth(context) * 0.21
                          : _selectedIndex == 2
                              ? SizeUtils.getWidth(context) * 0.41
                              : _selectedIndex == 3
                                  ? SizeUtils.getWidth(context) * 0.61
                                  : SizeUtils.getWidth(context) * 0.81,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 75, // Size of the circle
                      height: 75,
                      decoration: BoxDecoration(
                        color: ClrUtls.btnFontClr,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: ClrUtls.primary,
                            offset: Offset(0, 4),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: _selectedIndex == 0
                              ? SvgPicture.asset(
                                  ImageUtils.restoreIcon,
                                  color: Colors.white,
                                )
                              : _selectedIndex == 1
                                  ? SvgPicture.asset(
                                      ImageUtils.distanceIcon,
                                      color: Colors.white,
                                    )
                                  : _selectedIndex == 2
                                      ? SvgPicture.asset(
                                          ImageUtils.homeIcon,
                                          color: Colors.white,
                                        )
                                      : _selectedIndex == 3
                                          ? SvgPicture.asset(
                                              ImageUtils.mailIcon,
                                              color: Colors.white,
                                            )
                                          : SvgPicture.asset(
                                              ImageUtils.settingIcon,
                                              color: Colors.white,
                                            )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ])),
      // bottomNavigationBar: Container(
      //   height: 100,
      //   child: Stack(
      //     clipBehavior: Clip.none,
      //     children: [
      //       Align(
      //         alignment: Alignment.bottomCenter,
      //         child: Container(
      //             height: 60, // Set the height of the bottom navigation bar
      //             decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.only(
      //                   topLeft: Radius.circular(20),
      //                   topRight: Radius.circular(20),
      //                 ),
      //                 color: ClrUtls.secondaryDark),
      //             child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
      //                 children: [
      //                   InkWell(
      //                     onTap: () {
      //                       setState(() {
      //                         _selectedIndex = 0;
      //                       });
      //                     },
      //                     child: Container(
      //                         width: 34,
      //                         height: 34,
      //                         child: _selectedIndex == 0
      //                             ? SizedBox()
      //                             : SvgPicture.asset(
      //                                 ImageUtils.restoreIcon,
      //                                 width: 24,
      //                                 height: 24,
      //                                 fit: BoxFit.fill,
      //                               )),
      //                   ),
      //                   InkWell(
      //                     onTap: () {
      //                       setState(() {
      //                         _selectedIndex = 1;
      //                       });
      //                     },
      //                     child: Container(
      //                         width: 34,
      //                         height: 34,
      //                         child: _selectedIndex == 1
      //                             ? SizedBox()
      //                             : SvgPicture.asset(
      //                                 ImageUtils.distanceIcon,
      //                                 width: 24,
      //                                 height: 24,
      //                                 fit: BoxFit.contain,
      //                               )),
      //                   ),
      //                   InkWell(
      //                     onTap: () {
      //                       setState(() {
      //                         _selectedIndex = 2;
      //                       });
      //                     },
      //                     child: Container(
      //                         width: 34,
      //                         height: 34,
      //                         child: _selectedIndex == 2
      //                             ? SizedBox()
      //                             : SvgPicture.asset(
      //                                 ImageUtils.homeIcon,
      //                                 width: 24,
      //                                 height: 24,
      //                                 fit: BoxFit.contain,
      //                                 color: ClrUtls.btnFontClr,
      //                               )),
      //                   ),
      //                   InkWell(
      //                     onTap: () {
      //                       setState(() {
      //                         _selectedIndex = 3;
      //                       });
      //                     },
      //                     child: Container(
      //                         width: 34,
      //                         height: 34,
      //                         child: _selectedIndex == 3
      //                             ? SizedBox()
      //                             : SvgPicture.asset(
      //                                 ImageUtils.mailIcon,
      //                                 width: 24,
      //                                 height: 24,
      //                                 fit: BoxFit.fill,
      //                               )),
      //                   ),
      //                   InkWell(
      //                     onTap: () {
      //                       setState(() {
      //                         _selectedIndex = 4;
      //                       });
      //                     },
      //                     child: Container(
      //                         width: 34,
      //                         height: 34,
      //                         child: _selectedIndex == 4
      //                             ? SizedBox()
      //                             : SvgPicture.asset(
      //                                 ImageUtils.settingIcon,
      //                                 width: 24,
      //                                 height: 24,
      //                                 fit: BoxFit.fill,
      //                               )),
      //                   ),
      //                 ])),
      //       ),

      //       // Positioned blue circle above the selected tab
      //       Positioned(
      //         left: _selectedIndex == 0
      //             ? SizeUtils.getWidth(context) * 0.01
      //             : _selectedIndex == 1
      //                 ? SizeUtils.getWidth(context) * 0.21
      //                 : _selectedIndex == 2
      //                     ? SizeUtils.getWidth(context) * 0.41
      //                     : _selectedIndex == 3
      //                         ? SizeUtils.getWidth(context) * 0.61
      //                         : SizeUtils.getWidth(context) * 0.81,
      //         child: Align(
      //           alignment: Alignment.topCenter,
      //           child: Container(
      //             width: 75, // Size of the circle
      //             height: 75,
      //             decoration: BoxDecoration(
      //               color: ClrUtls.btnFontClr,
      //               shape: BoxShape.circle,
      //               boxShadow: [
      //                 BoxShadow(
      //                   color: ClrUtls.primary,
      //                   offset: Offset(0, 4),
      //                   blurRadius: 10,
      //                   spreadRadius: 1,
      //                 ),
      //               ],
      //             ),
      //             child: Padding(
      //                 padding: const EdgeInsets.all(12.0),
      //                 child: _selectedIndex == 0
      //                     ? SvgPicture.asset(
      //                         ImageUtils.restoreIcon,
      //                         color: Colors.white,
      //                       )
      //                     : _selectedIndex == 1
      //                         ? SvgPicture.asset(
      //                             ImageUtils.distanceIcon,
      //                             color: Colors.white,
      //                           )
      //                         : _selectedIndex == 2
      //                             ? SvgPicture.asset(
      //                                 ImageUtils.homeIcon,
      //                                 color: Colors.white,
      //                               )
      //                             : _selectedIndex == 3
      //                                 ? SvgPicture.asset(
      //                                     ImageUtils.mailIcon,
      //                                     color: Colors.white,
      //                                   )
      //                                 : SvgPicture.asset(
      //                                     ImageUtils.settingIcon,
      //                                     color: Colors.white,
      //                                   )),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

// Dummy Screens to represent different tabs
class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Home Screen'));
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Search Screen'));
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Notifications Screen'));
  }
}

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Messages Screen'));
  }
}

class Screen5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Settings Screen'));
  }
}
