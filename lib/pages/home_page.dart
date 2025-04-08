import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_clone/components/grocery_item_tile.dart';
import 'package:second_clone/model/cart_model.dart';
import 'package:second_clone/pages/cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Navigator.push(context, MaterialPageRoute(
        builder: (context){
          return CartPage ();
        },
        ),
        ),
      backgroundColor: Colors.black, 
      child:Icon(Icons.shopping_bag),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 48,),
          //good morning
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:24.0),
            child: Text('Good morning'),
          ),

          const SizedBox(height: 4,),
        
          //lets order fresh food for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text("Lets order fresh foods for you",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
        
          //divider
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(),
          ),

          const SizedBox(height: 24,),
        
          //fresh items + grid
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text("Fresh items",
            style: TextStyle(fontSize:16),
            ),
          ),

          Expanded(
            child: Consumer<CartModel>(
              builder:( context, value, child) {
              return GridView.builder(
                itemCount: value.shopItems.length,
                padding: EdgeInsets.all(12),
                gridDelegate: 
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1/1.3), 
              itemBuilder: (context,index){
                return GroceryItemTile(
                  itemName: value.shopItems[index][0],
                  itemPrice: value.shopItems[index][1],
                  imagePath: value.shopItems[index][2],
                  color: value.shopItems[index][3],
                  onPressed: () {
                    Provider.of<CartModel>(context, listen: false)
                    .addItemToCart(index);
                  },
                );
              },
              );
            },
            ),
        )


        ],),
      ),
    );
  }
}