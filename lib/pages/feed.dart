import 'package:flutter/material.dart';
import 'package:news_app/pages/postDetail.dart';
import '../models/feed_model.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  String? _selectedOption;
  List<String> options = ['Popular', 'Trending', 'Following'];
  // gets feed
  List<FeedModel> feed = [];

  void _getInitialInfo() {
    feed = FeedModel.getFeed();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    print('Feed length: ${feed.length}');
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(102),
        child: appBar(),
      ),
      backgroundColor: Color(0xFFF3F5F7),
      body: ListView.separated(
        itemCount: feed.length,
        separatorBuilder: (context, index) => const SizedBox(height: 25),
        padding: const EdgeInsets.only(
          top: 15,
          left: 20,
          right: 20,
          bottom: 120,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostDetailPage(
                    title: 'Going to the Beach',
                    description: 'today i went to the beach and it was nice.',
                    imageUrl: feed[index].image, // or null if no image
                    author: feed[index].author,
                    timestamp: feed[index].date,
                    likes: 3
                  ),
                ),
              );
            },
            child: Container(
              width: 335,
              height: 335,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12, top: 11, bottom: 11),
                    child: Row(
                      children: [
                        Image.asset('assets/images/pfp.png', width: 30, height: 30),
                        SizedBox(width: 7),
                        Text(feed[index].author),
                        Spacer(),
                        Text('1 hour ago', style: TextStyle(color: Color(0xffBDBDBD), fontSize: 13)),
                      ],
                    ),
                  ),
                  Container(
                    height: 230,
                    width: double.infinity,
                    child: FittedBox(
                      fit: BoxFit.contain, // Adjusts the image size while maintaining its aspect ratio
                      child: Image.asset('assets/images/feed_image.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 13,
                      left: 15, 
                      right: 15,
                      bottom: 13,
                      ),
                    child: Row(children: [
                        Image.asset('assets/icons/save.png', height: 20, width: 20),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('${feed[index].comments}', style: TextStyle(color: Color(0xff828282))),
                        ),
                        Image.asset('assets/icons/comment.png', height: 20, width: 20),
                        SizedBox(width: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('${feed[index].likes}', style: TextStyle(color: Color(0xff828282))),
                        ),
                        Image.asset('assets/icons/heart.png', height: 20, width: 20),                 
                      ],
                    ),
                  ),
                ]
              )
            ),
          );
        },
      ),
    );
  }

  PreferredSize appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(102),
      child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
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
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: options.map((String option) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedOption = option;
                            });
                          },
                          child: Container(
                            width: 115,
                            height: 39,
                            decoration: BoxDecoration(
                              color: _selectedOption == option ? Color(0xFFF1F1FE) : Colors.transparent,
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: Center(
                              child: Text(option, style: TextStyle(
                                color: _selectedOption == option ? Color(0xff888BF4) : Color(0xFFBDBDBD),
                                fontWeight: _selectedOption == option ? FontWeight.bold : FontWeight.normal,
                              ))
                            )
                          )
                        );
                      }).toList()
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
