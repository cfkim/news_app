class FeedModel {
  String author;
  DateTime date;
  int likes;
  int comments;
  String image;

  FeedModel({
    required this.author,
    required this.date,
    required this.likes,
    required this.comments,
    required this.image,
  });

   static List < FeedModel > getFeed() {
    List<FeedModel> feed = [];

    feed.add(
      FeedModel(
       author: 'Andrew Smith',
       date: DateTime(2024, 8, 15),
       likes: 2,
       comments: 2,
       image: 'assets/images/feed_image.png',
      )
    );

    feed.add(
      FeedModel(
       author: 'Andrew Smith',
       date: DateTime(2024, 2, 15),
       likes: 2,
       comments: 2,
       image: 'assets/images/feed_image.png',
      )
    );

    feed.add(
      FeedModel(
       author: 'Andrew Smith',
       date: DateTime(2024, 5, 15),
       likes: 2,
       comments: 2,
       image: 'assets/images/feed_image.png',
      )
    );

    feed.add(
      FeedModel(
       author: 'Andrew Smith',
       date: DateTime(2024, 7, 15),
       likes: 2,
       comments: 2,
       image: 'assets/images/feed_image.png',
      )
    );
    print('Feed generated with ${feed.length} items');
    return feed;
  }
}