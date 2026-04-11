import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'home_state.dart';
import '../data/models/slider_model.dart';
import '../data/models/book_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  // Using 10.0.2.2 instead of 127.0.0.1 because Android Emulator uses 10.0.2.2 to access host machine's localhost
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://codingarabic.online/api'));

  Future<void> fetchHomeData() async {
    emit(HomeLoading());
    try {
      // 1. Fetch Sliders
      final sliderResponse = await dio.get('sliders');
      List<SliderModel> sliders = [];
      if (sliderResponse.data != null &&
          sliderResponse.data['data'] != null &&
          sliderResponse.data['data']['sliders'] != null) {
        final slidersJson = sliderResponse.data['data']['sliders'] as List;
        sliders = slidersJson.map((e) => SliderModel.fromJson(e)).toList();
      }

      // 2. Fetch Best Sellers
      final bestSellerResponse = await dio.get('products-bestseller');
      List<BookModel> bestSellers = [];
      if (bestSellerResponse.data != null &&
          bestSellerResponse.data['data'] != null) {
        final bestSellersJson = bestSellerResponse.data['data'] as List;
        bestSellers = bestSellersJson
            .map((e) => BookModel.fromJson(e))
            .toList();
      }

      emit(HomeLoaded(sliders, bestSellers));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
