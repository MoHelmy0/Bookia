import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booksotre/features/home/data/models/book_model.dart';
import 'package:booksotre/core/theme/app_colors.dart';
import '../cubit/book_details_cubit.dart';
import '../cubit/book_details_state.dart';

class BookDetailsScreen extends StatelessWidget {
  final BookModel book;

  const BookDetailsScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookDetailsCubit, BookDetailsState>(
      listener: (context, state) {
        if (state is AddCartSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Added to Cart Successfully!')),
          );
        } else if (state is AddCartError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        } else if (state is AddWishlistSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Added to Wishlist Successfully!')),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            BlocBuilder<BookDetailsCubit, BookDetailsState>(
              builder: (context, state) {
                if (state is AddWishlistLoading) {
                  return const Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                  );
                }
                return IconButton(
                  icon: const Icon(Icons.bookmark_border, color: Colors.black, size: 26),
                  onPressed: () {
                    context.read<BookDetailsCubit>().addToWishlist(book.id);
                  },
                );
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Book Image
                      Hero(
                        tag: 'book_image_${book.id ?? book.name}',
                        child: Container(
                          width: double.infinity,
                          height: 300, // Fixed height or adjust to screen ratio
                          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                            image: book.image != null
                                ? DecorationImage(
                                    image: NetworkImage(book.image!),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                            color: Colors.grey[200],
                          ),
                          child: book.image == null
                              ? const Center(child: Icon(Icons.book, size: 100, color: Colors.grey))
                              : null,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Book Name
                      Text(
                        book.name ?? 'Unknown Title',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'serif', // Gives that bookish look matching Figma
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Author / Category
                      Text(
                        book.author ?? 'Broché', // Default fallback based on screenshot
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Description
                      Text(
                        book.description ??
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.5,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom Section (Price and Add to Cart)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '₹${book.price ?? "285"}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    BlocBuilder<BookDetailsCubit, BookDetailsState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: state is AddCartLoading
                              ? null
                              : () {
                                  context.read<BookDetailsCubit>().addToCart(book.id);
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2E2E2E), // Dark nearly black
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: state is AddCartLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text(
                                  'Add To Cart',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
