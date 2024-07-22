import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/review.dart';
import '../providers/review_provider.dart';

class AddReviewScreen extends StatefulWidget {
  final int audiobookId;

  AddReviewScreen({required this.audiobookId});

  @override
  _AddReviewScreenState createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _ratingController = TextEditingController();
  final _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Review')),
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
                    final newReview = Review(
                      id: 0, // ID will be assigned by the backend
                      audiobookId: widget.audiobookId,
                      user: _userController.text,
                      rating: int.parse(_ratingController.text),
                      comment: _commentController.text,
                    );

                    Provider.of<ReviewProvider>(context, listen: false)
                        .addReview(newReview);

                    Navigator.pop(context);
                  }
                },
                child: Text('Add Review'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
