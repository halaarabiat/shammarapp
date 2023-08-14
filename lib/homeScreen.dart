import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              child: Image.asset(
                "assets/background.png", // Replace with your image URL
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    // Navigate to products page
                  },
                  child: Container(
                    height: 200,
                    decoration : BoxDecoration(
                      color: Colors.white, // Set your desired background color
                      borderRadius: BorderRadius.circular(25), // Adjust the radius as needed
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/products.png", // Replace with your image URL
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text('Products',style: TextStyle(fontSize:35 ,fontWeight: FontWeight.w600,  ),),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                InkWell(
                  onTap: () {
                    // Navigate to equipment page
                  },
                  child: Container(
                    height: 200,
                    decoration : BoxDecoration(
                      color: Colors.white, // Set your desired background color
                      borderRadius: BorderRadius.circular(25), // Adjust the radius as needed
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/equipment.jpg", // Replace with your image URL
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text('Equipment',style: TextStyle(fontSize:35 ,fontWeight: FontWeight.w600,  ),),
                        ),

                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                InkWell(
                  onTap: () {
                    // Navigate to gifts page
                  },
                  child: Container(
                    height: 200 ,
                    decoration : BoxDecoration(
                      color: Colors.white, // Set your desired background color
                      borderRadius: BorderRadius.circular(25), // Adjust the radius as needed
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/gift.png", // Replace with your image URL
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text('Gifts',style: TextStyle(fontSize:35 ,fontWeight: FontWeight.w600,  ),),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: SimpleShadow(

        opacity: 0.6,         // Default: 0.5
        // color: Colors.blue,   // Default: Black
        offset: const Offset(5, 5), // Default: Offset(2, 2)
        sigma: 7,

        child: FloatingActionButton(
          onPressed: () {
            // Navigate to home page
          },
          child: const Icon(Icons.home , color: Color(0xFFF1A661),),
          backgroundColor: Color(0xFFFee5c8),

        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: SimpleShadow(
        opacity: 0.6,         // Default: 0.5
        // color: Colors.blue,   // Default: Black
        offset: const Offset(5, 5), // Default: Offset(2, 2)
        sigma: 7,
        child: BottomAppBar(

          shape: const CircularNotchedRectangle(),
          color: Color(0xFFF1A661),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.person , color: Color(0xFFFee5c8),),
                onPressed: () {
                  // Navigate to profile page
                },
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart , color: Color(0xFFFee5c8)),
                onPressed: () {
                  // Navigate to cart page
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
