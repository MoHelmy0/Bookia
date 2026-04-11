import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/cart_item_model.dart';
import '../../cubit/cart_cubit.dart';

class CartItemWidget extends StatelessWidget {
  final CartItemModel cartItem;

  const CartItemWidget({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white, // Or a very light gray if needed, but looks white in Figma
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Book Image
          Container(
            width: 80,
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: cartItem.book.image != null
                  ? DecorationImage(
                      image: NetworkImage(cartItem.book.image!),
                      fit: BoxFit.cover,
                    )
                  : null,
              color: Colors.grey[300],
            ),
            child: cartItem.book.image == null
                ? const Center(child: Icon(Icons.book, color: Colors.grey))
                : null,
          ),
          const SizedBox(width: 16),
          // Book Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        cartItem.book.name ?? 'Unknown',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'serif',
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<CartCubit>().removeFromCart(cartItem.book.id ?? 0);
                      },
                      child: const Icon(Icons.cancel_outlined, color: Colors.black, size: 24),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '₹${cartItem.book.price ?? "285"}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                // Quantity Controller (+ 01 - as per screenshot)
                Row(
                  children: [
                    _buildQuantityButton(
                      icon: Icons.add,
                      onTap: () {
                        context.read<CartCubit>().incrementQuantity(cartItem.book.id ?? 0);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        cartItem.quantity.toString().padLeft(2, '0'),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    _buildQuantityButton(
                      icon: Icons.remove,
                      onTap: () {
                        context.read<CartCubit>().decrementQuantity(cartItem.book.id ?? 0);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(icon, size: 18, color: Colors.black),
      ),
    );
  }
}
