class Audiobook {
  final int id;
  final String title;
  final String author;
  final String genre;
  final String description;
  final String coverImage;
  final double averageRating;

  Audiobook({
    required this.id,
    required this.title,
    required this.author,
    required this.genre,
    required this.description,
    required this.coverImage,
    required this.averageRating,
  });

  factory Audiobook.fromJson(Map<String, dynamic> json) {
    return Audiobook(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      genre: json['genre'],
      description: json['description'],
      coverImage: json['cover_image'],
      averageRating: json['average_rating'] != null
          ? (json['average_rating'] as num).toDouble()
          : 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'genre': genre,
      'description': description,
      'cover_image': coverImage,
      'average_rating': averageRating,
    };
  }
}
