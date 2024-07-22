import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/audiobook_provider.dart';
import '../models/audiobook.dart';
import 'audiobook_detail_screen.dart';
import 'add_audiobook_screen.dart';

class AudiobookListScreen extends StatefulWidget {
  @override
  _AudiobookListScreenState createState() => _AudiobookListScreenState();
}

class _AudiobookListScreenState extends State<AudiobookListScreen> {
  String _selectedGenre = '';
  String _authorFilter = '';
  bool _sortAscending = true;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<AudiobookProvider>().fetchAudiobooks());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audiobooks'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(context),
          ),
          IconButton(
            icon: Icon(
                _sortAscending ? Icons.arrow_upward : Icons.arrow_downward),
            onPressed: () {
              setState(() {
                _sortAscending = !_sortAscending;
              });
              context.read<AudiobookProvider>().sortByRating(_sortAscending);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search by Author',
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _authorFilter = value;
                });
                context.read<AudiobookProvider>().filterByAuthor(_authorFilter);
              },
            ),
          ),
          Expanded(
            child: Consumer<AudiobookProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (provider.audiobooks.isEmpty) {
                  return Center(child: Text('No audiobooks available'));
                }
                return ListView.builder(
                  itemCount: provider.audiobooks.length,
                  itemBuilder: (context, index) {
                    Audiobook audiobook = provider.audiobooks[index];
                    return ListTile(
                      leading: Image.network(audiobook.coverImage,
                          width: 50, height: 50, fit: BoxFit.cover),
                      title: Text(audiobook.title),
                      subtitle:
                          Text('${audiobook.author} - ${audiobook.genre}'),
                      trailing: Text(
                          'Rating: ${audiobook.averageRating.toStringAsFixed(1)}'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AudiobookDetailScreen(audiobook: audiobook),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddAudiobookScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Filter by Genre'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                _buildGenreFilterOption(context, ''),
                _buildGenreFilterOption(context, 'Fiction'),
                _buildGenreFilterOption(context, 'Non-Fiction'),
                _buildGenreFilterOption(context, 'Science Fiction'),
                _buildGenreFilterOption(context, 'Fantasy'),
                _buildGenreFilterOption(context, 'Mystery'),
                _buildGenreFilterOption(context, 'Biography'),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildGenreFilterOption(BuildContext context, String genre) {
    return RadioListTile<String>(
      title: Text(genre.isEmpty ? 'All Genres' : genre),
      value: genre,
      groupValue: _selectedGenre,
      onChanged: (String? value) {
        setState(() {
          _selectedGenre = value!;
        });
        context.read<AudiobookProvider>().filterByGenre(_selectedGenre);
        Navigator.of(context).pop();
      },
    );
  }
}
