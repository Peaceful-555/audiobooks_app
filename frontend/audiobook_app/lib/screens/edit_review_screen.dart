import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/review.dart';
import '../providers/review_provider.dart';

class EditReviewScreen extends StatefulWidget {
  final Review review;

  EditReviewScreen({required this.review});

  @override
  _EditReviewScreenState createState() => _EditReviewScreenState();
}

class _EditReviewScreenState extends State<EditReviewScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _userController;
  late TextEditingController _ratingController;
  late TextEditingController _commentController;

  @override
  void initState() {
    super.initState();
    _userController = TextEditingController(text: widget.review.user);
    _ratingController =
        TextEditingController(text: widget.review.rating.toString());
    _commentController = TextEditingController(text: widget.review.comment);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Review')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _userController,
                decoration: InputDecoration(labelText: 'User'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ratingController,
                decoration: InputDecoration(labelText: 'Rating'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a rating';
                  }
                  final rating = int.tryParse(value);
                  if (rating == null || rating < 1 || rating > 5) {
                    return 'Please enter a rating between 1 and 5';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _commentController,
                decoration: InputDecoration(labelText: 'Comment'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a comment';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final updatedReview = Review(
                      id: widget.review.id,
                      audiobookId: widget.review.audiobookId,
                      user: _userController.text,
                      rating: int.parse(_ratingController.text),
                      comment: _commentController.text,
                    );

                    Provider.of<ReviewProvider>(context, listen: false)
                        .updateReview(updatedReview);

                    Navigator.pop(context);
                  }
                },
                child: Text('Update Review'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
