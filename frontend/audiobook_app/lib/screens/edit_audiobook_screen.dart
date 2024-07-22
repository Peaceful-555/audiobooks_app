import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/audiobook.dart';
import '../providers/audiobook_provider.dart';

class EditAudiobookScreen extends StatefulWidget {
  final Audiobook audiobook;

  EditAudiobookScreen({required this.audiobook});

  @override
  _EditAudiobookScreenState createState() => _EditAudiobookScreenState();
}

class _EditAudiobookScreenState extends State<EditAudiobookScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _authorController;
  late TextEditingController _genreController;
  late TextEditingController _descriptionController;
  late TextEditingController _coverImageController;
  late TextEditingController _averageRatingController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.audiobook.title);
    _authorController = TextEditingController(text: widget.audiobook.author);
    _genreController = TextEditingController(text: widget.audiobook.genre);
    _descriptionController =
        TextEditingController(text: widget.audiobook.description);
    _coverImageController =
        TextEditingController(text: widget.audiobook.coverImage);
    _averageRatingController =
        TextEditingController(text: widget.audiobook.averageRating.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Audiobook')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _authorController,
                decoration: InputDecoration(labelText: 'Author'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an author';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _genreController,
                decoration: InputDecoration(labelText: 'Genre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a genre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _coverImageController,
                decoration: InputDecoration(labelText: 'Cover Image URL'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a cover image URL';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _averageRatingController,
                decoration: InputDecoration(labelText: 'Average Rating'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an average rating';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final updatedAudiobook = Audiobook(
                      id: widget.audiobook.id,
                      title: _titleController.text,
                      author: _authorController.text,
                      genre: _genreController.text,
                      description: _descriptionController.text,
                      coverImage: _coverImageController.text,
                      averageRating:
                          double.parse(_averageRatingController.text),
                    );

                    Provider.of<AudiobookProvider>(context, listen: false)
                        .updateAudiobook(updatedAudiobook);

                    Navigator.pop(context);
                  }
                },
                child: Text('Update Audiobook'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
