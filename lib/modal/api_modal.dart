class Quote {
  String? quote;
  String? author;
  String? category;
  String? image;
  bool isLiked;

  Quote({this.quote, this.author, this.category, this.image, this.isLiked = false});

  factory Quote.fromMap(Map data) {
    return Quote(
      quote: data['quote'],
      author: data['author'],
      category: data['category'],
      image: data['image'],
      isLiked: data['isLike'] == 1,
    );
  }

  Map toMap() {
    return {
      'quote': quote,
      'author': author,
      'category': category,
      'image': image,
      'isLike': isLiked ? 1 : 0,
    };
  }
}
