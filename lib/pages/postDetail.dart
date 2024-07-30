import 'package:flutter/material.dart';

class PostDetailPage extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String author;
  final DateTime timestamp;
  final int likes;

  const PostDetailPage({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.author,
    required this.timestamp,
    required this.likes,
  }) : super(key: key);

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  bool _isLiked = false;
  bool _isSaved = false;
  final TextEditingController _commentController = TextEditingController();
  final List<String> _comments = [];

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  void _toggleSave() {
    setState(() {
      _isSaved = !_isSaved;
    });
  }

  void _addComment() {
    if (_commentController.text.isNotEmpty) {
      setState(() {
        _comments.add(_commentController.text);
        _commentController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 1.0),
            child: IconButton(
              icon: Icon(
                _isLiked ? Icons.favorite : Icons.favorite_border,
                color: _isLiked ? Colors.red : Colors.grey,
              ),
              onPressed: _toggleLike,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Icon(
                _isSaved ? Icons.bookmark_add : Icons.bookmark_add_outlined,
                color: _isSaved ? Colors.black: Colors.grey,
              ),
              onPressed: _toggleSave,
            ),
          ),
        ],
      ),
      body: 
        Column(
          children: [
            SizedBox(height:10),
            if (widget.imageUrl != null)
              Image.asset(widget.imageUrl),
            Container(
              height: 450,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Likes: ${widget.likes}"),
                      ),
                  ],),
                  SizedBox(height: 8),
                  Text(
                    'By ${widget.author}',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${widget.timestamp.toLocal()}'.split(' ')[0], // Display date only
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  SizedBox(height: 16),
                  Text(
                    widget.description,
                    style: TextStyle(fontSize: 12, color: Color(0xFF828282)),
                  ),
                  SizedBox(height: 24),
                  SizedBox(height: 24),
                  Text('Comments:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Expanded(
                    child: ListView.separated(
                      itemCount: _comments.length,
                      separatorBuilder: (context, index) => SizedBox(height: 10) ,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Color(0x11BDBDBD)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(_comments[index]),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            cursorHeight: 15,
                            controller: _commentController,
                            decoration: InputDecoration(
                              labelText: 'Add a comment...',
                              labelStyle: TextStyle(color: Color(0xFFBDBDBD), fontSize: 14),
                              
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              fontSize: 14, // Adjust the font size here
                            ),
                            maxLines: 1,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.send),
                          onPressed: _addComment,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        
      ),
    );
  }
}
