part of './products_list_cubit.dart';

sealed class ProductsListState extends Equatable {
  const ProductsListState();

  @override
  List<Object> get props => [];
}

class ProductsListInitial extends ProductsListState {}

class ProductsListLoading extends ProductsListState {}

class ProductsListLoaded extends ProductsListState {
  final List<ProductModel> productsList;
  const ProductsListLoaded(this.productsList);

  @override
  List<Object> get props => [productsList];
}

class ProductsListError extends ProductsListState {
  final ErrorModel error;
  const ProductsListError(this.error);

  @override
  List<Object> get props => [error];
}
