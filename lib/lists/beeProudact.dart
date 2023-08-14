import 'package:flutter/material.dart';
import 'package:shammarapp/details.dart';

class BeeProdacts extends StatefulWidget {

  const BeeProdacts({Key? key}) : super(key: key);

  @override
  State<BeeProdacts> createState() => _BeeProdactsState();
}

class _BeeProdactsState extends State<BeeProdacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 1, // Set the number of items you want to display
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostDetailsProdacts()),
                );
              },
              child: Card(
                color:  Color(0xFFFee5c8),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              ),
              elevation: 7,
              margin: const EdgeInsets.all(10),
              child: SizedBox(
              height: 350,
              width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/products.png',
                      height: 280,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Product Name',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Size: ',
                                style: TextStyle(fontSize: 18),
                              ),

                            ],
                          ),

                        Column(
                          children: [
                            Text(
                              'Price: ..JD',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                     ] ),
                    ),
                  ],
                ),
              ),)
            );
          },
        ),
      ),
    );
  }
}
