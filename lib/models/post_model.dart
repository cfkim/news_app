class PostModel {
  String title;
  String content;
  String imageUrl;

  PostModel({
    required this.title,
    required this.content,
    required this.imageUrl,
  });

  static List<PostModel> getPosts(){
    List<PostModel> posts = [
      PostModel(
        title: 'Trying Papa Pizzeria for the first time',
        content: 'It was delightful. The customer service was amazing.',
        imageUrl: 'assets/images/feed_image.png',
      ),
      PostModel(
        title: 'Found this really nice park!',
        content: 'I was walking on Downs St. today because of construction on my usual route. I then stumbled upon a nice park!',
        imageUrl: 'assets/images/feed_image.png',
      ),
      // Add more posts as needed
    ];

    return posts;
  }
}
