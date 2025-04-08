import 'package:flutter/material.dart';
 
class CartModel extends ChangeNotifier{
  //list items on sale
  final List _shopItems = [
    // [itemName,itemPrice,imagePath,color]
    ["Avocado", "4.0", "lib/images/avocado.png",Colors.green],
    ["Banana", "2.5", "lib/images/banana.png",Colors.yellow],
    ["Chicken", "12.80","lib/images/chicken.png",Colors.brown],
    ["Water", "1.0", "lib/images/water.png",Colors.blue],
  ];

  //list of cart items

 List _cartItems =[];

  get shopItems => _shopItems;

  get cartItems => _shopItems;

  //add items to cart 
  void addItemToCart(int index){
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  //Remove items to cart
  void removeItemsFromCart(int index){
    _cartItems.removeAt(index);
    notifyListeners ();
  }

  //calculate total price
  String calculateTotal(){
    double totalPrice=0;
    for (int i=0;i < _cartItems.length;i++){
      totalPrice += double.parse(_cartItems[i] [i]);
} 
      return totalPrice.toStringAsFixed(2);
  }

}