import '../data/models/book_model.dart';
import '../data/models/slider_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<SliderModel> sliders;
  final List<BookModel> bestSellers;

  HomeLoaded(this.sliders, this.bestSellers);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
