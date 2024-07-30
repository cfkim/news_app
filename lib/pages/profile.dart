import 'package:flutter/material.dart';
import '../models/post_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int followers = 10;
  int following = 100;
  List<PostModel> posts = [];

  @override
  void initState() {
    super.initState();
    posts = PostModel.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset('assets/images/header.png'),
              Positioned(
                bottom: -50,
                left: MediaQuery.of(context).size.width / 2 - 50,
                child: Container(
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white, // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/pfp.png'),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 70),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Text('Joe Smith'),
                Text('Scranton, PA', style: TextStyle(color: Color(0xFF8F90A7))),
                SizedBox(height: 10),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFFF6F7F9),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text("${followers}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
                          SizedBox(width: 5),
                          Text("Followers", style: TextStyle(color: Color(0xFFBDBDBD))),
                        ],
                      ),
                      Text('|', style: TextStyle(color: Color(0x55BDBDBD))),
                      Row(
                        children: [
                          Text("${following}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
                          SizedBox(width: 5),
                          Text("Following", style: TextStyle(color: Color(0xFFBDBDBD))),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 120),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6),
                        ),
                        child: Image.asset(
                          post.imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(post.title, style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                        child: Text(
                          post.content,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
