import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../home/data/models/book_model.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  final Dio dio = Dio(BaseOptions(baseUrl: 'https://codingarabic.online/api'));

  void searchBooks(String query) async {
    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());
    try {
      // Mocking search for now since specific search endpoint isn't documented
      // Commonly it would be something like 'products-search' or filtering 'products'
      final response = await dio.get('products-search', queryParameters: {'name': query});
      
      List<BookModel> results = [];
      if (response.data != null && response.data['data'] != null) {
        final resultsJson = response.data['data'] as List;
        results = resultsJson.map((e) => BookModel.fromJson(e)).toList();
      }
      
      emit(SearchSuccess(results));
    } catch (e) {
      // If endpoint doesn't exist, we might get 404. 
      // For the sake of the task, if it fails, I'll mock a success with some filtered data
      // but let's try the real one first.
      emit(SearchError('Failed to fetch search results.'));
    }
  }
}
