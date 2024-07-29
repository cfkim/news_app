import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbols.dart';
import 'package:news_app/pages/featured_poll.dart';
import '../models/events_model.dart';
import '/pages/events.dart';
import '../models/category_model.dart';
import 'package:intl/intl.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<CategoryModel> categories = [];
  List<EventModel> events = [];

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    events = EventModel.getEvents();

  }
  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(children: [
        
        _categoriesSection(context),
        SizedBox(height: 20),
        _eventsSection(context),
        SizedBox(height: 20),
        Column(children: [
          Padding(
          padding: const EdgeInsets.only(
            left: 17.0,
            right: 17.0,
            bottom: 5.0
          ),
          child: Row(
            children: [
              Text(
                'Community Polls',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                )
              ),
              
            ],
          ),
        ),
          FeaturedPoll()
        ],)
        
      ])
    );
  }
  
  Column _eventsSection(BuildContext context) {
    final dateFormatter = DateFormat('MM/dd/yy');
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 17.0,
              left: 17.0,
              right: 17.0,
              bottom: 5.0
            ),
            child: Row(
              children: [
                Text(
                  'Featured Events',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  )
                ),
                Spacer(),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'View All',
                        style: TextStyle(
                          color: Color(0xFF5555c9),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EventsPage()),
                            );
                          },
                      ),
                    ],
                  )
                  
                )
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            height: 250,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  width: 210,
                  height: 210,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                              events[index].imagePath,
                              width: 210,
                              height: 210,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Text(
                              events[index].name,
                              style: TextStyle(fontSize: 12)
                            ),
                            Spacer(),
                            Text(
                              dateFormatter.format(events[index].date),
                              style: TextStyle(fontSize: 12)
                            )
                          ],
                        ),
                      )
                  ],)
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 25),
              itemCount: events.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20, right: 20),
            ),
          ),
        ]
      );
  }

  Column _categoriesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 17.0,
            left: 17.0,
            right: 17.0,
            bottom: 5.0
          ),
          child: Row(
            children: [
              Text(
                'Category',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                )
              ),
              
            ],
          ),
        ),
        const SizedBox(height: 15),
        Container(
          height: 150,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                width: 210,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.3),
                            BlendMode.darken,
                          ),
                          child: Image.asset(
                            categories[index].imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Text(
                          categories[index].name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 25),
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
          ),
        ),
      ]
    );
  }

  PreferredSize appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.only(left: 15),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: TextStyle(color: Colors.grey),
                                contentPadding: const EdgeInsets.only(top: 10, bottom: 10),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Image.asset('assets/icons/search-color.png',
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
                        SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                          },
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color(0xFFF3F5F7),
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assets/icons/plane.png'),
                              )
                            ),
                          ),
                        ),
                        
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}