import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mamasliama/components/Buttons/custom_button.dart';
import 'package:mamasliama/utils/color_utils.dart';
import 'package:mamasliama/utils/size_utils.dart';

class Babyclothingsection extends StatelessWidget {
  final String category; // Category passed from previous screen

  Babyclothingsection({required this.category});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance
          .collection('Product')
          .doc(category)
          .collection('items')
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text("No products available"));
        } else {
          final items = snapshot.data!.docs;

          return Container(
            height: SizeUtils.getHeight(context) * 0.78,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
                right: 20,
                left: 20,
              ),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.73,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  var item = items[index];
                  return CardItem(
                    title: item['title'],
                    price: item['price'],
                    age: item['age'],
                    image: item['imageUrl'],
                    documentId: item.id,
                    category: category,
                    postDate: item['postDate'],
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}

class CardItem extends StatefulWidget {
  final String title;
  final String price;
  final String age;
  final String image; // Image URL from Firestore
  final Timestamp postDate;
  final String documentId;
  final String category;

  const CardItem({
    Key? key,
    required this.title,
    required this.price,
    required this.age,
    required this.image,
    required this.documentId,
    required this.postDate,
    required this.category, // Current active state from Firestore
  }) : super(key: key);

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  // Method to get relative time using the timeago package
  String getShortRelativeTime(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate(); // Convert Timestamp to DateTime
    Duration difference =
        DateTime.now().difference(dateTime); // Calculate difference

    if (difference.inDays >= 30) {
      // If difference is more than a month, show months
      int months = (difference.inDays / 30).floor();
      return '$months month${months > 1 ? 's' : ''}';
    } else if (difference.inDays >= 7) {
      // If difference is more than a week, show weeks
      int weeks = (difference.inDays / 7).floor();
      return '$weeks week${weeks > 1 ? 's' : ''}';
    } else if (difference.inDays >= 1) {
      // If difference is more than a day, show days
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''}';
    } else if (difference.inHours >= 1) {
      // If difference is more than an hour, show hours
      return '${difference.inHours} hr${difference.inHours > 1 ? 's' : ''}';
    } else if (difference.inMinutes >= 1) {
      // If difference is more than a minute, show minutes
      return '${difference.inMinutes} min${difference.inMinutes > 1 ? 's' : ''}';
    } else {
      return 'Just now';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xfffdfaee),
      elevation: 5,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.white,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the product image using NetworkImage (from URL)
            Container(
              height: 113,
              width: 98,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.image), // Load image from URL
                  fit: BoxFit.fill, // You can adjust the fit if necessary
                ),
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100,
                  child: Text(
                    widget.title,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "\$",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(widget.price,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500))
                  ],
                )
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      size: 14,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      getShortRelativeTime(
                          widget.postDate), // Display relative time
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.child_friendly_sharp,
                      size: 14,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      widget.age,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text("Month", style: TextStyle(fontSize: 12))
                  ],
                )
              ],
            ),
            SizedBox(height: 5),
            CustomButton(
              text: "Add TO Cart", 
              fontSize: 12,
              color: ClrUtls.secondaryDark2,
              height: 30,
              width: 90,
              onPressed: () {})
          ],
        ),
      ),
    );
  }
}
