import 'package:babylonjs_viewer/babylonjs_viewer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String src = 'assets/t-shirt_orange.glb';
  Key babylonKey = UniqueKey(); // Key for the BabylonJSViewer widget
  Color? selectedColor = Colors.orange;
  String selectedSize = "XL";
  String price = "100";

  // Sizes to be displayed in the dropdown
  final List<String> sizes = ["S", "M", "L", "XL", "XXL"];

  void _addToCart() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("done!"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Size: $selectedSize",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text("Price: \$ $price",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 400,
              color: Colors.grey,
              child: BabylonJSViewer(
                key: babylonKey, // Use the key for BabylonJSViewer
                src: src,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Colors:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          _buildColorContainer(Colors.orange),
                          SizedBox(
                            width: 10,
                          ),
                          _buildColorContainer(Colors.blue),
                          SizedBox(
                            width: 10,
                          ),
                          _buildColorContainer(Colors.yellow),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Price:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Text(
                            '\$ $price',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select Your Size:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: _buildLogoImages(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Selected Size:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      _buildSizeDropdownButton(),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      _addToCart();
                    },
                    child: Container(
                      height: 65,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green),
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildLogoImages() {
    if (selectedColor == Colors.orange) {
      return [
        GestureDetector(
            onTap: () {
              setState(() {
                src = 'assets/logos/t-shirt_orange_logo1.glb';
                babylonKey = UniqueKey();
                _buildColorContainer(Colors.orange);
                price = "120";
              });
            },
            child: Image.asset('assets/logos/orange1.png')),
        GestureDetector(
            onTap: () {
              setState(() {
                src = 'assets/logos/t-shirt_orange_logo2.glb';
                babylonKey = UniqueKey();
                _buildColorContainer(Colors.orange);
                price = "145";
              });
            },
            child: Image.asset('assets/logos/orange2.png')),
        GestureDetector(
            onTap: () {
              setState(() {
                src = 'assets/logos/t-shirt_orange_logo3.glb';
                babylonKey = UniqueKey();
                _buildColorContainer(Colors.orange);
                price = "129";
              });
            },
            child: Image.asset('assets/logos/orange3.png')),
        GestureDetector(
            onTap: () {
              setState(() {
                src = 'assets/logos/t-shirt_orange_logo4.glb';
                babylonKey = UniqueKey();
                _buildColorContainer(Colors.orange);
                price = "130";
              });
            },
            child: Image.asset('assets/logos/orange4.png')),
      ];
    } else if (selectedColor == Colors.yellow) {
      return [
        GestureDetector(
            onTap: () {
              setState(() {
                src = 'assets/logos/t-shirt_yellow_logo1.glb';
                babylonKey = UniqueKey();
                _buildColorContainer(Colors.yellow);
                price = "110";
              });
            },
            child: Image.asset('assets/logos/yellow1.png')),
        GestureDetector(
            onTap: () {
              setState(() {
                src = 'assets/logos/t-shirt_yellow_logo2.glb';
                babylonKey = UniqueKey();
                _buildColorContainer(Colors.yellow);
                price = "155";
              });
            },
            child: Image.asset('assets/logos/yellow2.png')),
        GestureDetector(
            onTap: () {
              setState(() {
                src = 'assets/logos/t-shirt_yellow_logo3.glb';
                babylonKey = UniqueKey();
                _buildColorContainer(Colors.yellow);
                price = "109";
              });
            },
            child: Image.asset('assets/logos/yellow3.png')),
      ];
    } else if (selectedColor == Colors.blue) {
      return [
        GestureDetector(
            onTap: () {
              setState(() {
                src = 'assets/logos/t-shirt_blue_logo1.glb';
                babylonKey = UniqueKey();
                _buildColorContainer(Colors.blue);
                price = "113";
              });
            },
            child: Image.asset('assets/logos/blue1.png')),
        GestureDetector(
            onTap: () {
              setState(() {
                src = 'assets/logos/t-shirt_blue_logo2.glb';
                babylonKey = UniqueKey();
                _buildColorContainer(Colors.blue);
                price = "118";
              });
            },
            child: Image.asset('assets/logos/blue2.png')),
        GestureDetector(
            onTap: () {
              setState(() {
                src = 'assets/logos/t-shirt_blue_logo3.glb';
                babylonKey = UniqueKey();
                _buildColorContainer(Colors.blue);
                price = "134";
              });
            },
            child: Image.asset('assets/logos/blue3.png')),
      ];
    } else {
      return [];
    }
  }

  Widget _buildColorContainer(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSize = "XL"; // Reset selected size when color changes
          if (color == Colors.orange) {
            src = 'assets/t-shirt_orange.glb';
            price = "100";
            selectedColor = Colors.orange;
          } else if (color == Colors.blue) {
            src = 'assets/t-shirt_blue.glb';
            price = "100";
            selectedColor = Colors.blue;
          } else if (color == Colors.yellow) {
            src = 'assets/t-shirt_yellow.glb';
            price = "100";
            selectedColor = Colors.yellow;
          }
          babylonKey = UniqueKey();
        });
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  Widget _buildSizeDropdownButton() {
    return PopupMenuButton<String>(
      onSelected: (String size) {
        setState(() {
          selectedSize = size;
        });
      },
      itemBuilder: (BuildContext context) {
        return sizes.map((String size) {
          return PopupMenuItem<String>(
            value: size,
            child: Text(size),
          );
        }).toList();
      },
      child: Row(
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                selectedSize,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}
