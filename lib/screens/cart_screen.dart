import 'package:flutter/material.dart';
import 'package:foodpanda_ui/screens/cart_modal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: GoogleFonts.raleway(
            textStyle: Theme.of(context).textTheme.headlineMedium,
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.normal,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<CartModal>(
        builder: (context, value, child) {
          return value.cartItems.length == 0
              ? Center(child: Image.asset('assets/images/emptycart.png'))
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: value.cartItems.length,
                        padding: const EdgeInsets.all(12),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(12)),
                              child: ListTile(
                                leading: CircleAvatar(
                                    backgroundImage:
                                        AssetImage(value.cartItems[index][1])),
                                title: Text(value.cartItems[index][0],
                                    style: GoogleFonts.raleway(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
                                      fontSize: 18,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w900,
                                      fontStyle: FontStyle.normal,
                                    )),
                                subtitle: Text(value.cartItems[index][2],
                                    style: GoogleFonts.raleway(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
                                      fontSize: 14,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w900,
                                      fontStyle: FontStyle.normal,
                                    )),
                                trailing: IconButton(
                                  icon: const Icon(Icons.cancel),
                                  onPressed: () => Provider.of<CartModal>(
                                          context,
                                          listen: false)
                                      .removeItemsFromCart(index),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Visibility(
                      visible: value.cartItems.length == 0 ? false : true,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Amount to Pay',
                                        style: GoogleFonts.raleway(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headlineMedium,
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                        )),
                                    Text(value.calculateTotal(),
                                        style: GoogleFonts.raleway(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headlineMedium,
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                        ))
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(12)),
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    children: [
                                      Text('Pay Now',
                                          style: GoogleFonts.raleway(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .headlineMedium,
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontStyle: FontStyle.normal,
                                          )),
                                      const Icon(
                                        Icons.arrow_forward_rounded,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                );
        },
      ),
    );
  }
}
