import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // List of shop items
  final List<List<dynamic>> shopItems = [
    // [ itemName, itemPrice, imagePath, color ]
    ["Avocado", "4.00", "lib/images/avocado.png", Colors.green],
    ["Banana", "2.50", "lib/images/banana.png", Colors.yellow],
    ["Chicken", "12.80", "lib/images/chicken.png", Colors.brown],
    ["Water", "1.00", "lib/images/water.png", Colors.blue],
    // Add more items...
  ];

  // list of cart items
  List _cartItems = [];

  get cartItems => _cartItems;

  get shopItem => shopItems;

  // add item to cart
  void addItemToCart(int index) {
    _cartItems.add(shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}