import 'package:flutter/material.dart';
import '../../data/models/book_model.dart';

class BestSellerGridWidget extends StatelessWidget {
  final List<BookModel> bestSellers;

  const BestSellerGridWidget({super.key, required this.bestSellers});

  @override
  Widget build(BuildContext context) {
    if (bestSellers.isEmpty) {
      return const Center(child: Text('No best sellers found.'));
    }

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(), // To avoid scrolling conflict with main page
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.65, // Adjust for Figma proportion
      ),
      itemCount: bestSellers.length,
      itemBuilder: (context, index) {
        final book = bestSellers[index];
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF6F6F6), // Slightly rounded off-white background
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Book Image
              Expanded(
                child: Container(
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
              ),
              const SizedBox(height: 10),
              // Book Name
              Text(
                book.name ?? 'Unknown',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5),
              // Price and Buy Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${book.price ?? "0.0"}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Implement Buy Action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Dark button from Figma
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      minimumSize: const Size(0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Buy', style: TextStyle(color: Colors.white, fontSize: 13)),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
