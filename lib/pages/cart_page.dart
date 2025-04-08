import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_clone/model/cart_model.dart';
 
 class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          if (value.cartItems.isEmpty) {
            return const Center(
              child: Text("Your cart is empty"),
            );
          }
          
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: value.cartItems.length,
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    final item = value.cartItems[index];
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            item[2],
                            height: 36,
                          ),
                          title: Text(item[0]),
                          subtitle: Text('\$${item[1]}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.cancel),
                            onPressed: () {
                              Provider.of<CartModel>(context, listen: false)
                                  .removeItemsFromCart(index);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total Price"),
                      Text(value.calculateTotal()),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}