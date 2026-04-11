import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booksotre/core/routes/routes.dart';
import '../cubit/profile_cubit.dart';
import '../cubit/profile_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..fetchProfileData(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Profile',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'serif',
            ),
          ),
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.logout, color: Colors.black),
                onPressed: () {
                  context.read<ProfileCubit>().logout();
                },
              ),
            ),
          ],
        ),
        body: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is ProfileLogout) {
              Navigator.pushNamedAndRemoveUntil(context, Routes.loginScreen, (route) => false);
            }
          },
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator(color: Colors.black));
            } else if (state is ProfileLoaded) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: Color(0xFFE0E0E0),
                        child: Icon(Icons.person, size: 50, color: Colors.grey),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        state.user.name,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        state.user.email,
                        style: const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(height: 32),
                      _buildMenuItem(
                        context,
                        title: 'My Orders',
                        onTap: () => Navigator.pushNamed(context, Routes.orderHistory),
                      ),
                      _buildMenuItem(
                        context,
                        title: 'Edit Profile',
                        onTap: () => Navigator.pushNamed(context, Routes.editProfile),
                      ),
                      _buildMenuItem(
                        context,
                        title: 'Reset Password',
                        onTap: () => Navigator.pushNamed(context, Routes.updatePassword),
                      ),
                      _buildMenuItem(context, title: 'FAQ', onTap: () {}),
                      _buildMenuItem(context, title: 'Contact Us', onTap: () {}),
                      _buildMenuItem(context, title: 'Privacy & Terms', onTap: () {}),
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

  Widget _buildMenuItem(BuildContext context, {required String title, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFF9F9F9),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
