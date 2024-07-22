import 'package:flutter/foundation.dart';
import '../models/review.dart';
import '../services/api_service.dart';

class ReviewProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Review> _reviews = [];
  bool _isLoading = false;

  List<Review> get reviews => _reviews;
  bool get isLoading => _isLoading;

  Future<void> fetchReviews(int audiobookId) async {
    _isLoading = true;
    notifyListeners();
    try {
      _reviews = await _apiService.fetchReviews(audiobookId);
    } catch (e) {
      print('Error fetching reviews: $e');
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addReview(Review review) async {
    try {
      final newReview = await _apiService.addReview(review);
      _reviews.add(newReview);
      notifyListeners();
    } catch (e) {
      print('Error adding review: $e');
    }
  }

  Future<void> updateReview(Review review) async {
    try {
      final updatedReview = await _apiService.updateReview(review);
      final index = _reviews.indexWhere((r) => r.id == updatedReview.id);
      if (index != -1) {
        _reviews[index] = updatedReview;
        notifyListeners();
      }
    } catch (e) {
      print('Error updating review: $e');
    }
  }

  Future<void> deleteReview(int id) async {
    try {
      await _apiService.deleteReview(id);
      _reviews.removeWhere((r) => r.id == id);
      notifyListeners();
    } catch (e) {
      print('Error deleting review: $e');
    }
  }
}
