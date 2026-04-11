import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/wishlist_cubit.dart';
import '../cubit/wishlist_state.dart';
import 'widgets/wishlist_item_widget.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishlistCubit()..fetchWishlist(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Wishlist',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'serif',
            ),
          ),
        ),
        body: BlocBuilder<WishlistCubit, WishlistState>(
          builder: (context, state) {
            if (state is WishlistLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.black),
              );
            } else if (state is WishlistError) {
              return Center(child: Text(state.message));
            } else if (state is WishlistLoaded) {
              final books = state.wishlistBooks;

              if (books.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.bookmark_border, size: 80, color: Colors.grey[400]),
                      const SizedBox(height: 16),
                      Text(
                        'Your Wishlist is Empty',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.60, // Adjust aspect ratio to match Figma (taller cards)
                ),
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return WishlistItemWidget(
                    book: book,
                    onRemove: () {
                      context.read<WishlistCubit>().removeFromWishlist(book.id ?? 0);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${book.name} removed from Wishlist')),
                      );
                    },
                  );
                },
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
