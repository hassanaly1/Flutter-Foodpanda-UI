import 'package:flutter/material.dart';

class CartModal extends ChangeNotifier {
  final _itemsList = [
    [
      "McDonald",
      "assets/images/burgers.jpg",
      "699",
      "McDonalds might offer a Meal Deal that includes a burger, fries, and a drink for a lower price than if these items were purchased separately. Another popular deal is the Extra Value Meal, which includes a burger, fries, and a drink, as well as an additional menu item such as chicken nuggets or a salad."
    ],
    [
      "Delizia",
      "assets/images/delizia.PNG",
      "899",
      "Delizia might offer a Meal Deal that includes a burger, fries, and a drink for a lower price than if these items were purchased separately. Another popular deal is the Extra Value Meal, which includes a burger, fries, and a drink, as well as an additional menu item such as chicken nuggets or a salad.s"
    ],
    [
      'Kababjees',
      'assets/images/kababjees.jpg',
      '999',
      'Kababjees might offer a Meal Deal that includes a burger, fries, and a drink for a lower price than if these items were purchased separately. Another popular deal is the Extra Value Meal, which includes a burger, fries, and a drink, as well as an additional menu item such as chicken nuggets or a salad.'
    ],
    [
      "OPTP",
      "assets/images/optp.PNG",
      "1699",
      "OPTP might offer a Meal Deal that includes a burger, fries, and a drink for a lower price than if these items were purchased separately. Another popular deal is the Extra Value Meal, which includes a burger, fries, and a drink, as well as an additional menu item such as chicken nuggets or a salad."
    ],
    [
      "Broadway Pizza",
      "assets/images/broadway.PNG",
      "1999",
      "Broadway Pizza might offer a Meal Deal that includes a burger, fries, and a drink for a lower price than if these items were purchased separately. Another popular deal is the Extra Value Meal, which includes a burger, fries, and a drink, as well as an additional menu item such as chicken nuggets or a salad."
    ],
  ];

  //list of cart items
  final List _cartItems = [];

  get itemsList => _itemsList;

  get cartItems => _cartItems;

  //add item to the cart
  void addItemToCart(int index) {
    _cartItems.add(_itemsList[index]);
    notifyListeners();
  }

  //remove item to the cart
  void removeItemsFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  //calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][2]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
