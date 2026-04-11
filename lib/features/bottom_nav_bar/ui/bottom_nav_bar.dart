import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/bottom_nav_bar_cubit.dart';
import '../../home/ui/home_screen.dart';

import 'package:booksotre/features/wishlist/ui/wishlist_screen.dart';
import 'package:booksotre/features/cart/ui/cart_screen.dart';
import 'package:booksotre/features/profile/ui/profile_screen.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBarCubit(),
      child: BlocBuilder<BottomNavBarCubit, int>(
        builder: (context, currentIndex) {
          return Scaffold(
            body: IndexedStack(
              index: currentIndex,
              children: [
                const HomeScreen(),
                const WishlistScreen(),
                const CartScreen(),
                const ProfileScreen(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                context.read<BottomNavBarCubit>().changeIndex(index);
              },
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark_border),
                  activeIcon: Icon(Icons.bookmark),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  activeIcon: Icon(Icons.shopping_cart),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  activeIcon: Icon(Icons.person),
                  label: '',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}