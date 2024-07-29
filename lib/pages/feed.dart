import 'package:flutter/material.dart';
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
      body: ListView.separated(
        itemCount: feed.length,
        shrinkWrap: true,
        separatorBuilder: (context, index) => const SizedBox(height: 25),
        padding: const EdgeInsets.only(
          left: 20,
          right: 20
        ),
        itemBuilder: (context, index) {
          return Container(
            width: 335,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(children: [
                Row(children: [
                    Text(feed[index].author),
                    Spacer(),
                    Text(feed[index].date)
                  ],
                ),
                Image.asset('assets/images/feed_image.png'),
                Row(children: [
                    Text('${feed[index].comments}'),
                    Text('${feed[index].likes}'),
                  ],
                ),
              ]
            )
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
                      )
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}
