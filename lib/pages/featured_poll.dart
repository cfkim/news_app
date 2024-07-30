import 'package:flutter/material.dart';

class FeaturedPoll extends StatefulWidget {
  const FeaturedPoll({super.key});

  @override
  _FeaturedPollState createState() => _FeaturedPollState();
}

class _FeaturedPollState extends State<FeaturedPoll> {
  final List<String> _options = ['Dragon Drink', 'Pink Drink', 'Matcha Latte', 'Iced Chai Latte'];
  String? _selectedOption;
  int _totalVotes = 112; // Dummy data for total votes
  List<String> _voters = ['assets/images/pfp.png', 'assets/images/pfp.png', 'assets/images/pfp.png']; // Dummy profile pictures
  int _daysLeft = 5; // Dummy data for days left

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: 500, // Fixed width
      height: 335, // Fixed height
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Card(
          color: Color(0xFFF4F188),
          margin: const EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0), // content within the card padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Poll Question
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8, right: 8, top: 10,
                  ),
                  child: Text(
                    'What is the best drink at Alfee Cafe?', style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 12),
                // Poll Options
                ..._options.map((option) => PollOption(
                      option: option,
                      isSelected: _selectedOption == option,
                      onSelect: () {
                        setState(() {
                          _selectedOption = option;
                        });
                      },
                    )),
                
                // Footer with votes, profile pictures, days left, and comment button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Total votes and profile pictures
                      Row(
                        children: [
                          Text('$_totalVotes Votes'),
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Container(
                                  // Adjust the padding to control border thickness
                                  padding: const EdgeInsets.only(left: 0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white, // Border color
                                      width: 1.0, // Border width
                                    ),
                                  ),
                                  child: CircleAvatar(
                                      radius: 12,
                                      backgroundImage: AssetImage('assets/images/pfp.png'),
                                    ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 13.0),
                                child: Container(
                                  // Adjust the padding to control border thickness
                                  padding: const EdgeInsets.only(left: 0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white, // Border color
                                      width: 1.0, // Border width
                                    ),
                                  ),
                                  child: CircleAvatar(
                                      radius: 12,
                                      backgroundImage: AssetImage('assets/images/pfp1.png'),
                                    ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 21.0),
                                child: Container(
                                  // Adjust the padding to control border thickness
                                  padding: const EdgeInsets.only(left: 0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white, // Border color
                                      width: 1.0, // Border width
                                    ),
                                  ),
                                  child: CircleAvatar(
                                      radius: 12,
                                      backgroundImage: AssetImage('assets/images/pfp2.png'),
                                    ),
                                ),
                              ),  
                            ]
                          ),
                          SizedBox(width: 10),
                          Text('$_daysLeft days left'),
                          
                        ],
                      ),
                      Spacer(),
                      // Comment button
                      TextButton(
                        onPressed: () {
                          // Handle comment section
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Open comment section')),
                          );
                        },
                        child: Image.asset('assets/icons/comment.png', width: 25, height: 25),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PollOption extends StatelessWidget {
  final String option;
  final bool isSelected;
  final VoidCallback onSelect;

  const PollOption({
    required this.option,
    required this.isSelected,
    required this.onSelect,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        height: 35,
        margin: const EdgeInsets.only(bottom: 6),
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
        decoration: BoxDecoration(
          gradient: isSelected ? const LinearGradient(
            colors: [
              Color(0xFF5151C6),
              Color(0xFF888BF4),
            ]
          ) : LinearGradient(colors: [Colors.white, Colors.white]),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.transparent : Color(0xFFBDBDBD),
            width: 0.5,
          ),
        ),
        child: Row(
          children: [
            Text(
              option,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            Spacer(),
            isSelected
                ? Icon(Icons.check, color: Colors.white)
                : Container(width: 24), // Placeholder for radio button
          ],
        ),
      ),
    );
  }
}
