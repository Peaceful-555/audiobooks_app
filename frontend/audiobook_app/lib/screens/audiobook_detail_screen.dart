import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/audiobook.dart';
import '../models/review.dart';
import '../providers/audiobook_provider.dart';
import '../providers/review_provider.dart';
import 'add_review_screen.dart';
import 'edit_audiobook_screen.dart';
import 'edit_review_screen.dart';

class AudiobookDetailScreen extends StatelessWidget {
  final Audiobook audiobook;

  AudiobookDetailScreen({required this.audiobook});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => ReviewProvider()..fetchReviews(audiobook.id)),
        ChangeNotifierProvider.value(
            value: Provider.of<AudiobookProvider>(context, listen: false)),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(audiobook.title),
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EditAudiobookScreen(audiobook: audiobook),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Delete Audiobook'),
                      content: Text(
                          'Are you sure you want to delete this audiobook?'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Delete'),
                          onPressed: () {
                            Provider.of<AudiobookProvider>(context,
                                    listen: false)
                                .deleteAudiobook(audiobook.id);
                            Navigator.of(context).pop(); // Close the dialog
                            Navigator.of(context)
                                .pop(); // Go back to the audiobook list
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(audiobook.coverImage),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Author: ${audiobook.author}',
                        style: TextStyle(fontSize: 18)),
                    Text('Genre: ${audiobook.genre}',
                        style: TextStyle(fontSize: 18)),
                    Text(
                        'Rating: ${audiobook.averageRating.toStringAsFixed(1)}',
                        style: TextStyle(fontSize: 18)),
                    SizedBox(height: 10),
                    Text('Description:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(audiobook.description),
                    SizedBox(height: 20),
                    Text('Reviews:',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Consumer<ReviewProvider>(
                builder: (context, reviewProvider, child) {
                  if (reviewProvider.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return reviewProvider.reviews.isEmpty
                      ? Center(child: Text('No reviews available'))
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: reviewProvider.reviews.length,
                          itemBuilder: (context, index) {
                            Review review = reviewProvider.reviews[index];
                            return ListTile(
                              title: Text(review.user),
                              subtitle: Text(review.comment),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Rating: ${review.rating}'),
                                  IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              EditReviewScreen(review: review),
                                        ),
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Delete Review'),
                                            content: Text(
                                                'Are you sure you want to delete this review?'),
                                            actions: <Widget>[
                                              TextButton(
                                                child: Text('Cancel'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              TextButton(
                                                child: Text('Delete'),
                                                onPressed: () {
                                                  reviewProvider
                                                      .deleteReview(review.id);
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AddReviewScreen(audiobookId: audiobook.id),
              ),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
