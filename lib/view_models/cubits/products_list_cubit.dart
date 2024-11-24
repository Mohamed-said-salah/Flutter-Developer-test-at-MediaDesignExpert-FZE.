import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_developer_test_at_media_design_expert_fze/data/models/error_model.dart';

import '../../data/models/product_model.dart';
import '../../data/repos/products_repo.dart';

part './products_list_states.dart';

class ProductsListCubit extends Cubit<ProductsListState> {
  ProductsListCubit._priv() : super(ProductsListInitial()) {
    _fetchSampleProducts();
  }

  static final _instance = ProductsListCubit._priv();

  factory ProductsListCubit() => _instance;

  Future _fetchSampleProducts() async {
    emit(ProductsListLoading());

    final result = await ProductsRepo.getProductsSample();

    result.fold(
      (left) {
        emit(ProductsListError(left));
      },
      (right) {
        emit(ProductsListLoaded(right));
      },
    );
  }

  Future<List<ProductModel>?> getSuggestions(String query) async {
    if (state is ProductsListLoaded) {
      final productsList = (state as ProductsListLoaded).productsList;
      final List<ProductModel> suggestions = [];

      for (final product in productsList) {
        if (product.searchIndex.contains(query.toLowerCase())) {
          suggestions.add(product);
        }
      }

      return suggestions;
    } else if (state is! ProductsListLoading) {
      _fetchSampleProducts();
    }

    return null;
  }
}
