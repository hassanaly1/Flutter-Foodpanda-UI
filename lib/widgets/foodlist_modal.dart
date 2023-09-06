import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

import 'icon_and_text_widget.dart';

// ignore: must_be_immutable
class FoodListModal extends StatelessWidget {
  final String text;
  final String description;
  final String imageUrl;
  final String price;
  void Function()? onPressed;

  FoodListModal(
      {super.key,
      required this.text,
      required this.imageUrl,
      required this.description,
      required this.price,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      height: MediaQuery.of(context).size.height * 0.95,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 120,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(imageUrl))),
              )),
          const Positioned(
              top: 45,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  Icon(Icons.shopping_cart_outlined, color: Colors.white)
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0, //to get the whole page height
              top: 120 - 20, //to do the upper side curved
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text,
                        style: GoogleFonts.raleway(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                                5,
                                (index) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 15,
                                    )),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            "4.5",
                            style: GoogleFonts.raleway(
                              textStyle:
                                  Theme.of(context).textTheme.headlineMedium,
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            "1287 comments",
                            style: GoogleFonts.raleway(
                              textStyle:
                                  Theme.of(context).textTheme.headlineMedium,
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconAndTextWidget(
                              icon: Icons.circle_sharp,
                              text: "Normal",
                              iconColor: Color(0xFFffd28d)),
                          SizedBox(
                            width: 10,
                          ),
                          IconAndTextWidget(
                              icon: Icons.location_on,
                              text: "1.7 km",
                              iconColor: Color(0xFFffd28d)),
                          SizedBox(
                            width: 10,
                          ),
                          IconAndTextWidget(
                              icon: Icons.access_time_filled_rounded,
                              text: "32 min",
                              iconColor: Color(0xFFffd28d))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                            child: ReadMoreText(
                          description,
                          style: GoogleFonts.raleway(
                            textStyle:
                                Theme.of(context).textTheme.headlineMedium,
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                          trimLines: 2,
                          colorClickableText: Colors.pink,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Show more',
                          trimExpandedText: 'Show less',
                          moreStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )),
                      )
                    ]),
              ))
        ]),
        bottomNavigationBar: Container(
          height: 90,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: const BoxDecoration(
              color: Color(0xFFf7f6f4),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: 60,
              child: ElevatedButton(
                onPressed: onPressed,
                child: Text(
                  "Rs $price | Add to Card",
                  style: GoogleFonts.raleway(
                      textStyle: Theme.of(context).textTheme.headlineMedium,
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
