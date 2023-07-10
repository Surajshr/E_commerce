part of 'home_view_provider.dart';

class HomeViewModel extends StateNotifier<HomeViewState> {
  HomeViewModel({
    required this.ref,
  }) : super(const HomeViewState());

  StateNotifierProviderRef ref;
  final productServices = locator<ProductService>();
  PageController pageController = PageController();
  final firebaseService = locator<FirebaseService>();

  void setCurrentIndex(int value) {
    state = state.copyWith(
      index: value,
    );
  }

  void changePage(int index) {
    setCurrentIndex(index);
  }

  void goToDetailPage({
    required BuildContext context,
    required String price,
    required String description,
    required String title,
    required String brand,
    required String image,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailView(
          price: price,
          description: description,
          title: title,
          brand: brand,
          image: image,
        ),
      ),
    );
  }

  Future<void> getProductDetail() async {
    try {
      final response = await productServices.getProducts();
      response.fold((error) {
        dPrint(error.message);
        state = state.copyWith(
          hasError: error.message,
        );
      }, (success) {
        dPrint('successProduct Detail:$success');
        state = state.copyWith(
          products: success,
        );
      });
    } catch (e) {
      dPrint("failed to fetch data");
    }
  }

  Future<String> addItemTOCard({required CardProductModel productModel}) async {
    try {
      state = state.copyWith(cardProducts: [
        ...state.cardProducts,
        productModel,
      ]);
      return 'success';
    } catch (e) {
      dPrint('failed to add product');
      return 'failed';
    }
  }

  Future<void> calculateCardProductPrice() async {
    int totalPrice = 0;
    for (int i = 0; i < state.cardProducts.length; i++) {
      dPrint('priceOfEachItem:${state.cardProducts[i].totalBoughtPrice}');
      int number = int.parse(state.cardProducts[i].totalBoughtPrice);
      totalPrice += number;
    }
    state = state.copyWith(
      totalBoughtProductPrice: totalPrice,
    );
    dPrint('LastFinalPrice is :$totalPrice');
  }

  void showSnackBar({
    required BuildContext context,
    required String message,
  }) {
    final bool isSuccess = (message == 'success') ? true : false;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: isSuccess ? ColorAssets.success : ColorAssets.error,
        content: Text(message),
      ),
    );
  }

  void increaseQuantity({required String productPrice}) {
    state = state.copyWith(
      productQuantity: state.productQuantity + 1,
    );
    calculateNewTotal(productPrice: productPrice);
  }

  Future<void> calculateNewTotal({required String productPrice}) async {
    final newTotalPrice = int.parse(productPrice) * state.productQuantity;
    state = await state.copyWith(
      totalPrice: newTotalPrice,
    );
  }

  Future<void> storeBoughtProduct({
    required List<CardProductModel> boughtProduct,
  }) async {
    try {
      for (int index = 0; index < boughtProduct.length; index++) {
        final respond = firebaseService.storeProduct(
          tableName: 'boughtProduct',
          dataId: boughtProduct[index].title,
          productName: boughtProduct[index].title,
          productPrice: boughtProduct[index].price,
          quantity: boughtProduct[index].quantity,
          description: boughtProduct[index].description,
          totalPrice: boughtProduct[index].totalBoughtPrice,
        );
      }
      state = state.copyWith(
        cardProducts: [],
      );
    } catch (e) {
      dPrint('failed to store bought data to server');
    }
  }

  void decrementQuantity({required String productPrice}) {
    if (state.productQuantity > 0) {
      state = state.copyWith(
        productQuantity: state.productQuantity - 1,
      );
      calculateNewTotal(productPrice: productPrice);
    }
  }

  Future<void> init() async {
    getProductDetail();
  }
}
