import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodItem extends StatelessWidget {
  final String text;
  final String imageUrl;
  final VoidCallback onTap;
  final String price;

  const FoodItem(
      {super.key,
      required this.text,
      required this.imageUrl,
      required this.price,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 370,
            height: 180,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: const EdgeInsets.all(10),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: GoogleFonts.raleway(
                    textStyle: Theme.of(context).textTheme.headlineMedium,
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                RatingBar.builder(
                  itemSize: 20,
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    //  print(rating);
                  },
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Price: Rs: $price',
              style: GoogleFonts.raleway(
                textStyle: Theme.of(context).textTheme.headlineMedium,
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
              ),
            ),
          )
        ],
      ),
    );
  }
}
