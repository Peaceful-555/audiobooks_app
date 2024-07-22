import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/audiobook.dart';
import '../models/review.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:8000/api';

  Future<List<Audiobook>> fetchAudiobooks() async {
    final response = await http.get(Uri.parse('$baseUrl/audiobooks/'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((audiobook) => Audiobook.fromJson(audiobook))
          .toList();
    } else {
      throw Exception('Failed to load audiobooks');
    }
  }

  Future<Audiobook> addAudiobook(Audiobook audiobook) async {
    final response = await http.post(
      Uri.parse('$baseUrl/audiobooks/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(audiobook.toJson()),
    );
    if (response.statusCode == 201) {
      return Audiobook.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add audiobook');
    }
  }

  Future<Audiobook> updateAudiobook(Audiobook audiobook) async {
    final response = await http.put(
      Uri.parse('$baseUrl/audiobooks/${audiobook.id}/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(audiobook.toJson()),
    );
    if (response.statusCode == 200) {
      return Audiobook.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update audiobook');
    }
  }

  Future<void> deleteAudiobook(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/audiobooks/$id/'));
    if (response.statusCode != 204) {
      throw Exception('Failed to delete audiobook');
    }
  }

  Future<List<Review>> fetchReviews(int audiobookId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/reviews/?audiobook=$audiobookId'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((review) => Review.fromJson(review)).toList();
    } else {
      throw Exception('Failed to load reviews');
    }
  }

  Future<Review> addReview(Review review) async {
    final response = await http.post(
      Uri.parse('$baseUrl/reviews/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(review.toJson()),
    );
    if (response.statusCode == 201) {
      return Review.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add review');
    }
  }

  Future<Review> updateReview(Review review) async {
    final response = await http.put(
      Uri.parse('$baseUrl/reviews/${review.id}/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(review.toJson()),
    );
    if (response.statusCode == 200) {
      return Review.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update review');
    }
  }

  Future<void> deleteReview(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/reviews/$id/'));
    if (response.statusCode != 204) {
      throw Exception('Failed to delete review');
    }
  }
}
