import 'package:flutter/material.dart';
import 'package:foodpanda_ui/screens/cart_modal.dart';
import 'package:foodpanda_ui/screens/cart_screen.dart';
import 'package:foodpanda_ui/widgets/food_item.dart';
import 'package:foodpanda_ui/widgets/foodlist_modal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FoodList extends StatefulWidget {
  const FoodList({super.key});

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Food List',
          style: GoogleFonts.raleway(
            textStyle: Theme.of(context).textTheme.headlineMedium,
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.normal,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(),
                    )),
                child: const Icon(Icons.shopping_bag_outlined)),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<CartModal>(
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: value.itemsList.length,
                  itemBuilder: (context, index) {
                    return FoodItem(
                      text: value.itemsList[index][0],
                      imageUrl: value.itemsList[index][1],
                      price: value.itemsList[index][2],
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                          builder: (context) {
                            return FoodListModal(
                                text: value.itemsList[index][0],
                                price: value.itemsList[index][2],
                                imageUrl: value.itemsList[index][1],
                                description: value.itemsList[index][3],
                                onPressed: () {
                                  Provider.of<CartModal>(context, listen: false)
                                      .addItemToCart(index);
                                });
                          },
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // buildSheet() => Container();
}

            // FoodItem(
            //   text: 'McDonalds',
            //   imageUrl: 'assets/images/burgers.jpg',
            //   onTap: () {
            //     showModalBottomSheet(
            //       context: context,
            //       shape: const RoundedRectangleBorder(
            //           borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(20),
            //         topRight: Radius.circular(20),
            //       )),
            //       builder: (context) {
            //         return const FoodListModal(
            //             text: 'McDonalds',
            //             price: '699',
            //             imageUrl: 'assets/images/burgers.jpg',
            //             description: '');
            //       },
            //     );
            //   },
            //   price: '699',
            // ),