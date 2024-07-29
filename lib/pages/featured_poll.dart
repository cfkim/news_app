import 'package:flutter/material.dart';

class FeaturedPoll extends StatefulWidget {
  const FeaturedPoll({super.key});

  @override
  _FeaturedPollState createState() => _FeaturedPollState();
}

class _FeaturedPollState extends State<FeaturedPoll> {
  final List<String> _options = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];
  String? _selectedOption;
  int _totalVotes = 100; // Dummy data for total votes
  List<String> _voters = ['assets/images/pfp.png', 'assets/images/pfp.png', 'assets/images/pfp.png']; // Dummy profile pictures
  int _daysLeft = 5; // Dummy data for days left

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500, // Fixed width
      height: 330, // Fixed height
      child: Card(
        color: Color(0xFFF6F7F9),
        margin: const EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0), // content within the card padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Poll Question
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'What is the best flavor?',
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
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Total votes and profile pictures
                    Row(
                      children: [
                        Text('$_totalVotes Votes'),
                        SizedBox(width: 10),
                        Stack(
                          children: [for (String voter in _voters)
                            Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: CircleAvatar(
                                radius: 12,
                                backgroundImage: AssetImage(voter),
                              ),
                            ),]
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
        height: 40,
        margin: const EdgeInsets.only(bottom: 8.0),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
