import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String text;
  final String imageUrl;
  final VoidCallback onTap;

  const CardWidget(
      {super.key,
      required this.text,
      required this.imageUrl,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        // decoration: const BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage('assets/images/food_delivery.jpeg'))),
        width: 170,
        height: 120,
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
    );
  }
}
