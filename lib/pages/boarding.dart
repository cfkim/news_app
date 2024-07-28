import 'package:flutter/material.dart';
import 'dart:ui';


class BoardingPage extends StatelessWidget {
  const BoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/boardingbg.jpg'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center items vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Center items horizontally
          children: [
            // Title
            Text(
              'News App', style: TextStyle(
                color: Colors.white,
                fontFamily: 'Playwrite',
                fontSize: 30,
                )
            ),
            SizedBox(height: 40),
            // Image
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Container(
                height: 422.42,
                decoration: BoxDecoration(  
                  image: DecorationImage(
                    image: AssetImage('assets/images/main.png'),
                    fit: BoxFit.cover,
                  )
                ),
              ),
            ),   
            SizedBox(height: 40),       
            // Slogan
            Text('Share • Inspire • Connect', style: TextStyle(
              color: Colors.white)
            ),
            SizedBox(height: 40),
            // Sign up
            Container(
              decoration: BoxDecoration(
                color: Color(0xD0D0D0).withOpacity(0.3),
                borderRadius: BorderRadius.circular(30), 
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 14, bottom: 14),
                child: Text('Get Started', style: TextStyle(
                  fontFamily: 'Poppins', 
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  )
                ),
              )
            ),
          ],
          )
      )
    );
  }
}