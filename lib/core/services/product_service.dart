import 'package:dartz/dartz.dart';
import 'package:shopping_application/core/model/product_model/product_model.dart';
import 'package:shopping_application/utils/common_utils.dart';

import '../exceptions/app_error.dart';
import '../locator/locator.dart';
import 'firebase_services.dart';

class ProductService {
  final firebaseService = locator<FirebaseService>();

  Future<Either<AppError, List<ProductModel>>> getProducts() async {
    try {
      final List<ProductModel> products = [];
      final response = await firebaseService.fetchProducts();
      if (response != null && response.isNotEmpty) {
        dPrint("dataBefore parsing intoJson:$response");
        response.forEach((key, value) {
          final product = ProductModel.fromJson(value);
          products.add(product);
        });
      }
      return Right(products);
    } catch (e) {
      dPrint("Error while fetching product :$e");
      return Left(
        AppError(
          message: "Failed to fetch product",
        ),
      );
    }
  }
}
