import 'package:flutter/foundation.dart';
import '../models/audiobook.dart';
import '../services/api_service.dart';

class AudiobookProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Audiobook> _audiobooks = [];
  List<Audiobook> _filteredAudiobooks = [];
  bool _isLoading = false;

  List<Audiobook> get audiobooks => _filteredAudiobooks;
  bool get isLoading => _isLoading;

  Future<void> fetchAudiobooks() async {
    _isLoading = true;
    notifyListeners();
    try {
      _audiobooks = await _apiService.fetchAudiobooks();
      _filteredAudiobooks = List.from(_audiobooks);
    } catch (e) {
      print('Error fetching audiobooks: $e');
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addAudiobook(Audiobook audiobook) async {
    try {
      final newAudiobook = await _apiService.addAudiobook(audiobook);
      _audiobooks.add(newAudiobook);
      _filteredAudiobooks = List.from(_audiobooks);
      notifyListeners();
    } catch (e) {
      print('Error adding audiobook: $e');
    }
  }

  Future<void> updateAudiobook(Audiobook audiobook) async {
    try {
      final updatedAudiobook = await _apiService.updateAudiobook(audiobook);
      final index = _audiobooks.indexWhere((a) => a.id == updatedAudiobook.id);
      if (index != -1) {
        _audiobooks[index] = updatedAudiobook;
        _filteredAudiobooks = List.from(_audiobooks);
        notifyListeners();
      }
    } catch (e) {
      print('Error updating audiobook: $e');
    }
  }

  Future<void> deleteAudiobook(int id) async {
    try {
      await _apiService.deleteAudiobook(id);
      _audiobooks.removeWhere((a) => a.id == id);
      _filteredAudiobooks = List.from(_audiobooks);
      notifyListeners();
    } catch (e) {
      print('Error deleting audiobook: $e');
    }
  }

  void filterByGenre(String genre) {
    if (genre.isEmpty) {
      _filteredAudiobooks = List.from(_audiobooks);
    } else {
      _filteredAudiobooks =
          _audiobooks.where((audiobook) => audiobook.genre == genre).toList();
    }
    notifyListeners();
  }

  void filterByAuthor(String author) {
    if (author.isEmpty) {
      _filteredAudiobooks = List.from(_audiobooks);
    } else {
      _filteredAudiobooks = _audiobooks
          .where((audiobook) =>
              audiobook.author.toLowerCase().contains(author.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  void sortByRating(bool ascending) {
    _filteredAudiobooks.sort((a, b) => ascending
        ? a.averageRating.compareTo(b.averageRating)
        : b.averageRating.compareTo(a.averageRating));
    notifyListeners();
  }

  void resetFilters() {
    _filteredAudiobooks = List.from(_audiobooks);
    notifyListeners();
  }
}
