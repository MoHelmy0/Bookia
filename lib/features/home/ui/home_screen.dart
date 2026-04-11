import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import 'widgets/home_slider_widget.dart';
import 'widgets/best_seller_grid_widget.dart';
import 'package:booksotre/core/routes/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..fetchHomeData(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              Image.asset(
                'assets/images/splash.png', 
                height: 30,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.menu_book, color: Colors.amber, size: 30),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.black, size: 28),
              onPressed: () {
                Navigator.pushNamed(context, Routes.searchScreen);
              },
            ),
          ],
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator(color: Colors.black));
            } else if (state is HomeError) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is HomeLoaded) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Slider Component
                      HomeSliderWidget(sliders: state.sliders),
                      
                      const SizedBox(height: 25),
                      
                      // Best Seller Title
                      const Text(
                        'Best Seller',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                      const SizedBox(height: 15),
                      
                      // Best Seller Grid
                      BestSellerGridWidget(bestSellers: state.bestSellers),
                    ],
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
