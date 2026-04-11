import 'package:booksotre/features/home/data/models/book_model.dart';

class CartItemModel {
  final BookModel book;
  int quantity;

  CartItemModel({
    required this.book,
    this.quantity = 1,
  });

  double get totalPrice {
    final double price = double.tryParse(book.price ?? "0.0") ?? 0.0;
    return price * quantity;
  }
}
