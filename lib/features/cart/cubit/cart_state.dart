import 'package:flutter/foundation.dart';
import '../data/models/cart_item_model.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartItemModel> cartItems;
  final double totalPrice;

  CartLoaded({required this.cartItems, required this.totalPrice});
}

class CartError extends CartState {
  final String message;
  CartError(this.message);
}
