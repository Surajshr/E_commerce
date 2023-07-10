part of 'home_view_provider.dart';

@freezed
class HomeViewState with _$HomeViewState {
  const factory HomeViewState({
    @Default([]) List<ProductModel> products,
    @Default([]) List<CardProductModel> cardProducts,
    @Default(true) bool isLoading,
    @Default(false) bool isDataLoading,
    @Default('') String hasError,
    @Default(0) int index,
    @Default(1) int productQuantity,
    @Default(1) int totalPrice,
    @Default(0) int totalBoughtProductPrice,
  }) = _HomeViewState;
}
