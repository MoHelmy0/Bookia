import 'package:flutter/foundation.dart';
import 'package:booksotre/features/home/data/models/book_model.dart';

@immutable
abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {
  final List<BookModel> wishlistBooks;
  WishlistLoaded(this.wishlistBooks);
}

class WishlistError extends WishlistState {
  final String message;
  WishlistError(this.message);
}
