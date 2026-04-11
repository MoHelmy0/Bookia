import 'package:flutter/material.dart';
import 'package:booksotre/features/home/data/models/book_model.dart';

class WishlistItemWidget extends StatelessWidget {
  final BookModel book;
  final VoidCallback onRemove;

  const WishlistItemWidget({
    super.key,
    required this.book,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9), // Slight off-white background
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Book Image with Badge
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: book.image != null
                        ? DecorationImage(
                            image: NetworkImage(book.image!),
                            fit: BoxFit.cover,
                          )
                        : null,
                    color: Colors.grey[300],
                  ),
                ),
                // Small badge at top right
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Icon(Icons.bookmark, size: 14, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Book Name
          Text(
            book.name ?? 'Unknown',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'serif',
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),

          // Price and Remove Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₹${book.price ?? "285"}',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              InkWell(
                onTap: onRemove,
                child: const Icon(
                  Icons.cancel_outlined,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
