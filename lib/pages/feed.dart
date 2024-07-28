import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        flexibleSpace: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40, // Set the height of the search bar
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: const EdgeInsets.only(top: 10, bottom: 10),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset('assets/icons/glass.png',
                                height: 20, width: 20),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color(0xFFF3F5F7),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8), // Add some spacing between search bar and button
                  GestureDetector(
                    onTap: () {
                      // Define your button action here
                    },
                    child: Container(
                      width: 40, // Set width of the custom button
                      height: 40, // Set height of the custom button
                      decoration: BoxDecoration(
                        color: Color(0xFFF3F5F7), // Background color
                        shape: BoxShape.circle, // Circular shape
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/icons/plane.png'),
                      )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Center(child: Text('Feed Page Content')),
    );
  }
}
