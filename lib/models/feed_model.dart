class FeedModel {
  String author;
  String date;
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
       date: 'February 20, 2024',
       likes: 2,
       comments: 2,
       image: 'assets/images/feed_image.png',
      )
    );

    feed.add(
      FeedModel(
       author: 'Andrew Smith',
       date: 'February 20, 2024',
       likes: 2,
       comments: 2,
       image: 'assets/images/feed_image.png',
      )
    );

    feed.add(
      FeedModel(
       author: 'Andrew Smith',
       date: 'February 20, 2024',
       likes: 2,
       comments: 2,
       image: 'assets/images/feed_image.png',
      )
    );

    feed.add(
      FeedModel(
       author: 'Andrew Smith',
       date: 'February 20, 2024',
       likes: 2,
       comments: 2,
       image: 'assets/images/feed_image.png',
      )
    );
    print('Feed generated with ${feed.length} items');
    return feed;
  }
}