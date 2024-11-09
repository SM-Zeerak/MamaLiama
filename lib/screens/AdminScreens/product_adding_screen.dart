import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mamasliama/components/Buttons/custom_button.dart';
import 'package:mamasliama/components/TextField/custom_textfield.dart';
import 'package:mamasliama/utils/color_utils.dart';
import 'package:mamasliama/utils/size_utils.dart';

class ProductAddingScreen extends StatefulWidget {
  ProductAddingScreen({super.key});

  @override
  State<ProductAddingScreen> createState() => _ProductAddingScreenState();
}

class _ProductAddingScreenState extends State<ProductAddingScreen> {
  TextEditingController _title = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _category = TextEditingController();
  TextEditingController _detail = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  File? _imageFile; // Variable to store selected image
  final ImagePicker _picker = ImagePicker(); // ImagePicker instance

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

  // Function to upload image to Firebase Storage
  Future<String> _uploadImage(File imageFile) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageRef = _storage.ref().child("product_images/$fileName");

      UploadTask uploadTask = storageRef.putFile(imageFile);
      TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
      String downloadUrl = await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      print("Error uploading image: $e");
      return "";
    }
  }

  Future<void> _addProduct(BuildContext context) async {
  try {
    String title = _title.text.trim();
    String price = _price.text.trim();
    String age = _age.text.trim();
    String category = _category.text.trim();
    String detail = _detail.text.trim();
    DateTime postDate = DateTime.now();
    bool active = true;

    if (title.isEmpty || price.isEmpty || age.isEmpty || category.isEmpty || detail.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill out all fields!")));
      return;
    }

    // Upload image to Firebase Storage if an image is selected
    String imageUrl = "";
    if (_imageFile != null) {
      imageUrl = await _uploadImage(_imageFile!);
    }

    // Get reference to the category document and its items subcollection
    CollectionReference categoryRef = _firestore.collection('Product').doc(category).collection('items');

    // Create a new document for the item
    await categoryRef.add({
      'title': title,
      'price': price,
      'age': age,
      'description': detail,
      'postDate': postDate,
      'imageUrl': imageUrl,
      'active': active,
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Product added successfully!")));

    // Optionally clear the fields after submission
    _title.clear();
    _price.clear();
    _age.clear();
    _category.clear();
    _detail.clear();
    setState(() {
      _imageFile = null; // Clear the selected image
    });
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ClrUtls.primary,
        title: Text("Product Add"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 123,
              width: 90,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
                color: ClrUtls.primary,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(0, 4),
                    blurRadius: 6,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: _imageFile != null
                  ? Image(
                      image: FileImage(
                        _imageFile!,
                      ),
                      fit: BoxFit.fill,
                    )
                  : Icon(Icons.image),
            ),
            SizedBox(
              height: 10,
            ),
            CustomButton(
              text: "Upload Image",
              textColor: ClrUtls.darkBrown,
              fontWeight: FontWeight.w700,
              fontSize: 16,
              width: SizeUtils.getWidth(context) * 0.6,
              height: 22,
              borderRadius: 300,
              color: ClrUtls.secondaryDark,
              onPressed: () {
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
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              hintText: "Item Title",
              hintColor: ClrUtls.grey,
              controller: _title,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              hintText: "Item Price",
              hintColor: ClrUtls.grey,
              controller: _price,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              hintText: "Age",
              hintColor: ClrUtls.grey,
              controller: _age,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              hintText: "Item Categories",
              isDropdown: true,
              hintColor: ClrUtls.grey,
              controller: _category,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              maxlines: 5,
              hintText: "Item Descriptions",
              hintColor: ClrUtls.grey,
              controller: _detail,
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              text: "Add To Shop",
              textColor: ClrUtls.darkBrown,
              fontWeight: FontWeight.w700,
              fontSize: 16,
              width: SizeUtils.getWidth(context) * 0.6,
              height: 51,
              borderRadius: 300,
              color: ClrUtls.secondaryDark,
              onPressed: () => _addProduct(context), // Pass context to _addProduct
            ),
          ],
        ),
      ),
    );
  }
}
