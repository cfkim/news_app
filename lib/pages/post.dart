import 'package:flutter/material.dart';
import 'package:news_app/pages/nav.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CreatePostPage extends StatefulWidget {
  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  String? _selectedPostType;
  String? _selectedCategory;
  final _categories = ['Event', 'Community Post', 'Poll'];
  final _tags = [
    'Shopping',
    'Dining',
    'Sports',
    'New Businesses',
    'Festivals',
    'Arts & Culture',
    'Family Friendly',
    'Health & Wellness',
    'Networking',
    'Community Events'
  ];

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _eventDateController = TextEditingController();
  final _pollOptionsController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _eventDateController.dispose();
    _pollOptionsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Create'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 22.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: [Color(0xFF5151C6), Color(0xFF888BF4)],
                  tileMode: TileMode.mirror,
                ).createShader(bounds),
                child: Text(
                  'Post',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Post Type:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButtonFormField<String>(
              dropdownColor: Colors.white,
              value: _selectedPostType,
              hint: Text('Select Post Type'),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedPostType = newValue;
                });
              },
              items: _categories.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text('Category:', style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButtonFormField<String>(
              dropdownColor: Colors.white,
              value: _selectedCategory,
              hint: Text('Select Category'),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCategory = newValue;
                });
              },
              items: _tags.map((String tag) {
                return DropdownMenuItem<String>(
                  value: tag,
                  child: Text(tag),
                );
              }).toList(),
            ),
            SizedBox(height: 25),
            if (_selectedPostType == 'Event' || _selectedPostType == 'Community Post') ...[
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (_image != null) ...[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            File(_image!.path),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 150,
                          ),
                        ),
                      ] else ...[
                        Positioned.fill(
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.camera_alt,
                                  color: Colors.grey,
                                  size: 40,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Upload Image',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ), 
                      ],
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
            SizedBox(height: 16),
            _selectedPostType == null
                ? Center(
                    child: Text(
                      'Please select a category to see more options.',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  )
                : 
              Container(
              child: Column(
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 4,
                  ),
                  SizedBox(height: 14),
                  Visibility(
                    visible: _selectedPostType == 'Event',
                    child: TextField(
                      controller: _eventDateController,
                      decoration: InputDecoration(
                        labelText: 'Event Date',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _selectedPostType == 'Poll',
                    child: TextField(
                      controller: _pollOptionsController,
                      decoration: InputDecoration(
                        labelText: 'Poll Options (comma-separated)',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
