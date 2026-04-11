import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_state.dart';
import '../data/models/user_model.dart';
import '../data/models/order_model.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  UserModel? _currentUser;
  List<OrderModel> _currentOrders = [];

  void fetchProfileData() async {
    emit(ProfileLoading());
    // Simulated API call
    await Future.delayed(const Duration(seconds: 1));
    
    _currentUser = UserModel(
      name: 'Sayed Abdul Aziz',
      email: 'sayed@gmail.com',
      phone: '0123456789',
      address: 'Cairo, Egypt',
    );

    _currentOrders = [
      OrderModel(orderId: '238562312', date: '20/03/2020', total: '150'),
    ];

    emit(ProfileLoaded(user: _currentUser!, orders: _currentOrders));
  }

  void updateProfile({required String name, required String phone, required String address}) async {
    emit(ProfileLoading());
    await Future.delayed(const Duration(seconds: 1));
    
    if (_currentUser != null) {
      _currentUser = _currentUser!.copyWith(name: name, phone: phone, address: address);
      emit(ProfileUpdateSuccess());
      emit(ProfileLoaded(user: _currentUser!, orders: _currentOrders));
    }
  }

  void updatePassword({required String currentPassword, required String newPassword}) async {
    emit(ProfileLoading());
    await Future.delayed(const Duration(seconds: 1));
    
    // Simulating success
    emit(ProfileUpdateSuccess());
    if (_currentUser != null) {
      emit(ProfileLoaded(user: _currentUser!, orders: _currentOrders));
    }
  }

  void logout() {
    emit(ProfileLogout());
  }
}
