import 'package:flutter/foundation.dart';

@immutable
abstract class BookDetailsState {}

class BookDetailsInitial extends BookDetailsState {}

// Cart States
class AddCartLoading extends BookDetailsState {}
class AddCartSuccess extends BookDetailsState {}
class AddCartError extends BookDetailsState {
  final String message;
  AddCartError(this.message);
}

// Wishlist States
class AddWishlistLoading extends BookDetailsState {}
class AddWishlistSuccess extends BookDetailsState {}
class AddWishlistError extends BookDetailsState {
  final String message;
  AddWishlistError(this.message);
}
