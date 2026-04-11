import '../data/models/user_model.dart';
import '../data/models/order_model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserModel user;
  final List<OrderModel> orders;
  ProfileLoaded({required this.user, required this.orders});
}

class ProfileUpdateSuccess extends ProfileState {}

class ProfileUpdateError extends ProfileState {
  final String message;
  ProfileUpdateError(this.message);
}

class ProfileLogout extends ProfileState {}
