import 'package:flutter_bloc/flutter_bloc.dart';
import 'book_details_state.dart';

class BookDetailsCubit extends Cubit<BookDetailsState> {
  BookDetailsCubit() : super(BookDetailsInitial());

  Future<void> addToCart(int? bookId) async {
    emit(AddCartLoading());
    try {
      // Simulate network request
      await Future.delayed(const Duration(seconds: 1));
      
      // For now, emit success natively since no specific backend cart exists.
      emit(AddCartSuccess());
    } catch (e) {
      emit(AddCartError('Failed to add to cart: $e'));
    }
  }

  Future<void> addToWishlist(int? bookId) async {
    emit(AddWishlistLoading());
    try {
      // Simulate network request
      await Future.delayed(const Duration(seconds: 1));
      
      // For now, emit success natively
      emit(AddWishlistSuccess());
    } catch (e) {
      emit(AddWishlistError('Failed to add to wishlist: $e'));
    }
  }
}
