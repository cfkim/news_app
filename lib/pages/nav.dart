import 'package:flutter/material.dart';
import 'feed.dart';
import 'search.dart';
import 'post.dart';
import 'notifications.dart';
import 'profile.dart';

class NavPage extends StatefulWidget {
  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    FeedPage(),
    SearchPage(),
    SizedBox.shrink(), // Placeholder for Add Post button
    NotificationsPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      // Handle Add Post button press separately
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CreatePostPage()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBody: true,
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(
            
          ),
          
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: _selectedIndex == 0
                      ? Image.asset('assets/icons/house-fill.png', height: 30, width: 30)
                      : Image.asset('assets/icons/house.png', height: 30, width: 30),
                onPressed: () => _onItemTapped(0),
              ),
              IconButton(
                icon: _selectedIndex == 1
                      ? Image.asset('assets/icons/search-fill.png', height: 30, width: 30)
                      : Image.asset('assets/icons/search.png', height: 30, width: 30),
                onPressed: () => _onItemTapped(1),
              ),
              SizedBox(width: 48), // Spacer for the Add Post button
              IconButton(
                icon: _selectedIndex == 3
                      ? Image.asset('assets/icons/bell-fill.png', height: 30, width: 30)
                      : Image.asset('assets/icons/bell.png', height: 30, width: 30),
                onPressed: () => _onItemTapped(3),
              ),
              IconButton(
                icon: _selectedIndex == 4
                      ? Image.asset('assets/icons/profile-fill.png', height: 30, width: 30)
                      : Image.asset('assets/icons/profile.png', height: 30, width: 30),
                onPressed: () => _onItemTapped(4),
              ),
            ],
          ),
        ),
      ),
      
      floatingActionButton: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff5151C6), Color(0xff888BF4)], // Gradient colors
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreatePostPage()),
              );
            },
            backgroundColor: Colors.transparent,
            child: Image.asset('assets/icons/add.png', height: 25, width: 25),
            elevation: 0,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

