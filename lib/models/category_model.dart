import 'package:flutter/material.dart';

class CategoryModel{
  String name;
  String imagePath;
  Color boxColor;
  String description;

  CategoryModel({
    required this.name,
    required this.imagePath,
    required this.boxColor,
    required this.description,
  });

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
        name: 'Shopping',
        imagePath: 'assets/images/shopping.jpg', // Replace with your image path
        boxColor: Colors.blueAccent,
        description: 'Find the latest deals, new store openings, and special shopping events in your area.',
      ),
      CategoryModel(
        name: 'Dining',
        imagePath: 'assets/images/dining.jpg', // Replace with your image path
        boxColor: Colors.orangeAccent,
        description: 'Discover new restaurants, food festivals, special dining events, and more.',
      ),
      CategoryModel(
        name: 'Sports',
        imagePath: 'assets/images/sports.jpg', // Replace with your image path
        boxColor: Colors.greenAccent,
        description: 'Stay updated on local sports events, games, fitness classes, and sports-related activities.',
      ),
      CategoryModel(
        name: 'New Businesses',
        imagePath: 'assets/images/new_businesses.jpg', // Replace with your image path
        boxColor: Colors.purpleAccent,
        description: 'Explore newly opened businesses, startups, and new services in your community.',
      ),
      CategoryModel(
        name: 'Festivals',
        imagePath: 'assets/images/festivals.jpg', // Replace with your image path
        boxColor: Colors.redAccent,
        description: 'Get information on local festivals, fairs, and cultural celebrations happening in your area.',
      ),
      CategoryModel(
        name: 'Arts & Culture',
        imagePath: 'assets/images/arts_culture.jpg', // Replace with your image path
        boxColor: Colors.tealAccent,
        description: 'Discover art exhibitions, theater performances, live music events, and cultural activities.',
      ),
      CategoryModel(
        name: 'Family-Friendly',
        imagePath: 'assets/images/family_friendly.jpg', // Replace with your image path
        boxColor: Colors.pinkAccent,
        description: 'Find events and activities suitable for families and kids, including educational workshops and fun outings.',
      ),
      CategoryModel(
        name: 'Health & Wellness',
        imagePath: 'assets/images/health_wellness.jpg', // Replace with your image path
        boxColor: Colors.lightGreenAccent,
        description: 'Explore wellness events, health workshops, fitness classes, and self-care activities.',
      ),
      CategoryModel(
        name: 'Networking & Meetups',
        imagePath: 'assets/images/networking_events.jpg', // Replace with your image path
        boxColor: Colors.cyanAccent,
        description: 'Connect with local professionals, attend business networking events, and join community meetups.',
      ),
      CategoryModel(
        name: 'Community Events',
        imagePath: 'assets/images/community_events.jpg', // Replace with your image path
        boxColor: Colors.indigoAccent,
        description: 'Stay informed about general community events, neighborhood gatherings, and local initiatives.',
      ),
    ];
  }
}