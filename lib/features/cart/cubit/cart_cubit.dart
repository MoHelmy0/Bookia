import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booksotre/features/home/data/models/book_model.dart';
import '../data/models/cart_item_model.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<CartItemModel> _cartItems = [];

  Future<void> fetchCart() async {
    emit(CartLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 600));

      // Mock Data heavily inspired by the Figma Screenshot
      _cartItems = [
        CartItemModel(
          book: BookModel(
            id: 1,
            name: 'The Republic',
            author: 'Plato',
            description: 'A Socratic dialogue...',
            image: 'https://m.media-amazon.com/images/I/71X8NNJ63+L._AC_UF1000,1000_QL80_.jpg',
            price: '285', // Matches screenshot '285'
          ),
          quantity: 1,
        ),
        CartItemModel(
          book: BookModel(
            id: 2,
            name: 'The Republic',
            author: 'Plato',
            description: 'Placeholder second instance...',
            image: 'https://m.media-amazon.com/images/I/71X8NNJ63+L._AC_UF1000,1000_QL80_.jpg',
            price: '285',
          ),
          quantity: 1,
        ),
      ];

      _emitLoadedState();
    } catch (e) {
      emit(CartError('Failed to load cart.'));
    }
  }

  void incrementQuantity(int bookId) {
    if (state is CartLoaded) {
      final index = _cartItems.indexWhere((item) => item.book.id == bookId);
      if (index != -1) {
        _cartItems[index].quantity += 1;
        _emitLoadedState();
      }
    }
  }

  void decrementQuantity(int bookId) {
    if (state is CartLoaded) {
      final index = _cartItems.indexWhere((item) => item.book.id == bookId);
      if (index != -1) {
        if (_cartItems[index].quantity > 1) {
          _cartItems[index].quantity -= 1;
          _emitLoadedState();
        } else {
          removeFromCart(bookId); // Minimum 1 or removed
        }
      }
    }
  }

  void removeFromCart(int bookId) {
    if (state is CartLoaded) {
      _cartItems.removeWhere((item) => item.book.id == bookId);
      _emitLoadedState();
    }
  }

  void _emitLoadedState() {
    double total = 0.0;
    for (var item in _cartItems) {
      total += item.totalPrice;
    }
    emit(CartLoaded(cartItems: List.from(_cartItems), totalPrice: total));
  }
}
