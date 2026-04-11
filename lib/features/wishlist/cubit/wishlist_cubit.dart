import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booksotre/features/home/data/models/book_model.dart';
import 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());

  List<BookModel> _wishlistBooks = [];

  Future<void> fetchWishlist() async {
    emit(WishlistLoading());
    try {
      // Simulating a network call
      await Future.delayed(const Duration(milliseconds: 800));

      // Mock Data heavily inspired by the Figma Screenshot
      _wishlistBooks = [
        BookModel(
          id: 1,
          name: 'The Republic',
          author: 'Plato',
          description: 'A Socratic dialogue, authored by Plato around 375 BC, concerning justice...',
          image: 'https://m.media-amazon.com/images/I/71X8NNJ63+L._AC_UF1000,1000_QL80_.jpg', // Fallback standard cover URL for The Republic
          price: '285',
        ),
        BookModel(
          id: 2,
          name: 'The Republidfdfd dfgc',
          author: 'Plato',
          description: 'Alternative format placeholder.',
          image: 'https://m.media-amazon.com/images/I/71X8NNJ63+L._AC_UF1000,1000_QL80_.jpg',
          price: '285',
        ),
        BookModel(
          id: 3,
          name: 'The Republic',
          author: 'Plato',
          description: 'Another sample placeholder.',
          image: 'https://m.media-amazon.com/images/I/71X8NNJ63+L._AC_UF1000,1000_QL80_.jpg',
          price: '285',
        ),
        BookModel(
          id: 4,
          name: 'The Republidfdfd dfgc',
          author: 'Plato',
          description: 'Alternative format placeholder.',
          image: 'https://m.media-amazon.com/images/I/71X8NNJ63+L._AC_UF1000,1000_QL80_.jpg',
          price: '285',
        ),
      ];

      emit(WishlistLoaded(List.from(_wishlistBooks)));
    } catch (e) {
      emit(WishlistError('Failed to load wishlist.'));
    }
  }

  void removeFromWishlist(int id) {
    if (state is WishlistLoaded) {
      _wishlistBooks.removeWhere((book) => book.id == id);
      emit(WishlistLoaded(List.from(_wishlistBooks)));
    }
  }
}
