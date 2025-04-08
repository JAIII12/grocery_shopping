import 'package:flutter/material.dart';
import 'home_page.dart';
 

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 80, right: 80, bottom: 80, top: 160),
            child: Image.asset('lib/images/avocado.png'),
          ),
         Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              "We deliver grocery at your doorstep",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),


          const SizedBox(height:24),  

          //fresh items everyday
           Text(
            "Fresh items everyday",
            style: TextStyle(
              color: Colors.grey
            ),
            ),

            const Spacer(),

            //get started button

            GestureDetector(
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return const HomePage();
              },)),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(24),
                    child: const Text("get started",
                      style: TextStyle(color: Colors.white),
                       )
                    ),
            ),

                  const Spacer(),

        ]      
      ),
    );
  }
}
