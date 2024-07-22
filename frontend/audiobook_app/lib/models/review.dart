class Review {
  final int id;
  final int audiobookId;
  final String user;
  final int rating;
  final String comment;

  Review({
    required this.id,
    required this.audiobookId,
    required this.user,
    required this.rating,
    required this.comment,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      audiobookId: json['audiobook'],
      user: json['user'],
      rating: json['rating'],
      comment: json['comment'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'audiobook': audiobookId,
      'user': user,
      'rating': rating,
      'comment': comment,
    };
  }
}
