// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart'; // Import image_picker package
// import 'dart:io'; // Import dart:io to work with file system
// import 'package:mamasliama/components/Buttons/custom_button.dart';
// import 'package:mamasliama/components/TextField/country_selection_field.dart';
// import 'package:mamasliama/components/TextField/custom_textfield.dart';
// import 'package:mamasliama/screens/HomePage/bottomNav/bottomNavScreen.dart';
// import 'package:mamasliama/utils/color_utils.dart';
// import 'package:mamasliama/utils/image_utils.dart';
// import 'package:mamasliama/utils/size_utils.dart';
// import 'package:mamasliama/utils/textStyle_utils.dart';

// class Profilesetupscreen extends StatefulWidget {
//   Profilesetupscreen({super.key});

//   @override
//   _ProfilesetupscreenState createState() => _ProfilesetupscreenState();
// }

// class _ProfilesetupscreenState extends State<Profilesetupscreen> {
//   TextEditingController _selectCountry = TextEditingController();
//   File? _imageFile; // Variable to store selected image

//   final ImagePicker _picker = ImagePicker(); // ImagePicker instance

//   Future<void> _pickImage(ImageSource source) async {
//     try {
//       final XFile? pickedFile = await _picker.pickImage(source: source);

//       if (pickedFile != null) {
//         setState(() {
//           _imageFile =
//               File(pickedFile.path); // Update the UI with the selected image
//         });
//       }
//     } catch (e) {
//       print("Error picking image: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             width: SizeUtils.getWidth(context) * 0.85,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Profile Setup",
//                   style: TextStylesUtils.custom(
//                       fontSize: 24,
//                       fontWeight: FontWeight.w700,
//                       color: ClrUtls.darkBrown),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Stack(children: [
//                   // Show selected image or default profile image
//                   CircleAvatar(
//                     backgroundImage: _imageFile != null
//                         ? FileImage(_imageFile!) // Display selected image
//                         : AssetImage(ImageUtils.profile)
//                             as ImageProvider, // Default image
//                     radius: 80,
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     right: 0,
//                     child: GestureDetector(
//                       onTap: () {
//                         // Show dialog to choose between camera or gallery
//                         showModalBottomSheet(
//                           context: context,
//                           builder: (context) => Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 ListTile(
//                                   leading: Icon(Icons.camera),
//                                   title: Text("Take a photo"),
//                                   onTap: () {
//                                     Navigator.of(context).pop();
//                                     _pickImage(ImageSource
//                                         .camera); // Pick image from camera
//                                   },
//                                 ),
//                                 ListTile(
//                                   leading: Icon(Icons.photo_library),
//                                   title: Text("Choose from gallery"),
//                                   onTap: () {
//                                     Navigator.of(context).pop();
//                                     _pickImage(ImageSource
//                                         .gallery); // Pick image from gallery
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: ClrUtls.blue,
//                           borderRadius: BorderRadius.circular(50),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Icon(
//                             Icons.image_outlined,
//                             color: Colors.white,
//                             size: 24,
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                 ]),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text("Upload Picture",
//                     style: TextStylesUtils.custom(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w400,
//                     )),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 CustomTextField(
//                   hintText: "Full Name...",
//                   hintColor: ClrUtls.grey,
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 CustomTextField(
//                   hintText: "Phone Number...",
//                   hintColor: ClrUtls.grey,
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 CountrySelectionField(
//                   hintText: 'Select Country',
//                   hintColor: ClrUtls.grey,
//                   controller: _selectCountry,
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 CustomTextField(
//                   maxlines: 5,
//                   hintText: "Write about yourself...",
//                   hintColor: ClrUtls.grey,
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 CustomButton(
//                     text: "Save",
//                     textColor: ClrUtls.btnFontClr,
//                     fontWeight: FontWeight.w700,
//                     fontSize: 16,
//                     width: SizeUtils.getWidth(context) * 0.85,
//                     height: 51,
//                     borderRadius: 300,
//                     color: ClrUtls.secondaryDark,
//                     onPressed: () {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => BottomNavScreen()),
//                       );
//                     }),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'dart:io'; // For handling File
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For picking images
import 'package:mamasliama/components/Buttons/custom_button.dart';
import 'package:mamasliama/components/TextField/country_selection_field.dart';
import 'package:mamasliama/components/TextField/custom_textfield.dart';
import 'package:mamasliama/screens/HomePage/bottomNav/bottomNavScreen.dart'; // Adjust the import path
import 'package:mamasliama/utils/color_utils.dart';
import 'package:mamasliama/utils/image_utils.dart';
import 'package:mamasliama/utils/size_utils.dart';
import 'package:mamasliama/utils/textStyle_utils.dart';

class Profilesetupscreen extends StatefulWidget {
  Profilesetupscreen({super.key});

  @override
  _ProfilesetupscreenState createState() => _ProfilesetupscreenState();
}

class _ProfilesetupscreenState extends State<Profilesetupscreen> {
  TextEditingController _selectCountry = TextEditingController();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _aboutController = TextEditingController();

  File? _imageFile; // Variable to store selected image
  final ImagePicker _picker = ImagePicker(); // ImagePicker instance

  // Firebase Auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Firebase Firestore and Storage instances
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);

      if (pickedFile != null) {
        setState(() {
          _imageFile =
              File(pickedFile.path); // Update the UI with the selected image
        });
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  Future<void> _saveProfile() async {
    // Get current user
    User? user = _auth.currentUser;
    if (user == null) {
      return;
    }

    String userId = user.uid;

    // Upload profile image to Firebase Storage
    String imageUrl = '';
    if (_imageFile != null) {
      try {
        // Generate a unique file name
        String fileName = '${userId}_profile_pic.jpg';
        Reference storageRef = _storage.ref().child('profile_pictures/$fileName');
        UploadTask uploadTask = storageRef.putFile(_imageFile!);

        TaskSnapshot snapshot = await uploadTask;
        imageUrl = await snapshot.ref.getDownloadURL();
      } catch (e) {
        print("Error uploading image: $e");
      }
    }

    // Save user profile data to Firestore
    try {
      await _firestore.collection('users').doc(userId).set({
        'fullName': _fullNameController.text.trim(),
        'phoneNumber': _phoneNumberController.text.trim(),
        'country': _selectCountry.text.trim(),
        'about': _aboutController.text.trim(),
        'profilePictureUrl': imageUrl, // Save the image URL if available
        'createdAt': FieldValue.serverTimestamp(),
      });

      // Navigate to the next screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavScreen()),
      );
    } catch (e) {
      print("Error saving user profile: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: SizeUtils.getWidth(context) * 0.85,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Profile Setup",
                  style: TextStylesUtils.custom(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: ClrUtls.darkBrown),
                ),
                SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    // Show selected image or default profile image
                    CircleAvatar(
                      backgroundImage: _imageFile != null
                          ? FileImage(_imageFile!) // Display selected image
                          : AssetImage(ImageUtils.profile)
                              as ImageProvider, // Default image
                      radius: 80,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          // Show dialog to choose between camera or gallery
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.camera),
                                    title: Text("Take a photo"),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      _pickImage(ImageSource.camera); // Pick image from camera
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.photo_library),
                                    title: Text("Choose from gallery"),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      _pickImage(ImageSource.gallery); // Pick image from gallery
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: ClrUtls.blue,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.image_outlined,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Upload Picture",
                    style: TextStylesUtils.custom(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    )),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: _fullNameController,
                  hintText: "Full Name...",
                  hintColor: ClrUtls.grey,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: _phoneNumberController,
                  hintText: "Phone Number...",
                  hintColor: ClrUtls.grey,
                ),
                SizedBox(
                  height: 20,
                ),
                CountrySelectionField(
                  hintText: 'Select Country',
                  hintColor: ClrUtls.grey,
                  controller: _selectCountry,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: _aboutController,
                  maxlines: 5,
                  hintText: "Write about yourself...",
                  hintColor: ClrUtls.grey,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                    text: "Save",
                    textColor: ClrUtls.btnFontClr,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    width: SizeUtils.getWidth(context) * 0.85,
                    height: 51,
                    borderRadius: 300,
                    color: ClrUtls.secondaryDark,
                    onPressed: _saveProfile), // Save profile
              ],
            ),
          ),
        ),
      ),
    );
  }
}
