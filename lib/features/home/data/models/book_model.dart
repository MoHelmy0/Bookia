class BookModel {
  final int? id;
  final String? name;
  final String? description;
  final String? author;
  final String? image;
  final String? price;

  BookModel({
    this.id,
    this.name,
    this.description,
    this.author,
    this.image,
    this.price,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      author: json['author'] as String?,
      image: json['image'] as String?,
      price: json['price'] as String?,
    );
  }
}
