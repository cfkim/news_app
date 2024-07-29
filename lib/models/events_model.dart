class EventModel {
  String name;
  DateTime date;
  String location;
  String description;
  String imagePath;

  EventModel({
    required this.name,
    required this.date,
    required this.location,
    required this.description,
    required this.imagePath,
  });

  static List<EventModel> getEvents() {
    List<EventModel> events = [];

    events.add(
      EventModel(
        name: 'Music Festival',
        date: DateTime(2024, 8, 15),
        location: 'Central Park, NYC',
        description: 'A fun music festival with various artists performing.',
        imagePath: 'assets/images/music_festival.jpg',
      ),
    );

    events.add(
      EventModel(
        name: 'Art Exhibition',
        date: DateTime(2024, 9, 10),
        location: 'Downtown Gallery',
        description: 'An exhibition showcasing modern art.',
        imagePath: 'assets/images/art_exhibit.jpg',
      ),
    );

    events.add(
      EventModel(
        name: 'Food Truck Rally',
        date: DateTime(2024, 7, 25),
        location: 'City Square',
        description: 'A gathering of food trucks offering a variety of cuisines.',
        imagePath: 'assets/images/foodtruck.jpg',
      ),
    );

    events.add(
      EventModel(
        name: 'Tech Conference',
        date: DateTime(2024, 11, 5),
        location: 'Convention Center',
        description: 'A conference focusing on the latest in technology and innovation.',
        imagePath: 'assets/images/conference.jpg',
      ),
    );

    return events;
  }
}