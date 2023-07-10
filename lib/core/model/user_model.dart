class UserModel {
  String? name;
  String? email;
  String? password;
  BoughtProduct? boughtProduct;

  UserModel({this.name, this.email, this.password, this.boughtProduct});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    email = json['Email'];
    password = json['password'];
    boughtProduct = json['bought_product'] != null
        ? BoughtProduct.fromJson(json['bought_product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Name'] = name;
    data['Email'] = email;
    data['password'] = password;
    if (boughtProduct != null) {
      data['bought_product'] = boughtProduct!.toJson();
    }
    return data;
  }
}

class BoughtProduct {
  String? productName;
  String? productPrice;
  String? quantity;
  String? description;

  BoughtProduct(
      {this.productName, this.productPrice, this.quantity, this.description});

  BoughtProduct.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    productPrice = json['product_price'];
    quantity = json['quantity'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_name'] = productName;
    data['product_price'] = productPrice;
    data['quantity'] = quantity;
    data['description'] = description;
    return data;
  }
}
