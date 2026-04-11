import 'package:booksotre/features/home/data/models/book_model.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<BookModel> results;
  SearchSuccess(this.results);
}

class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}
