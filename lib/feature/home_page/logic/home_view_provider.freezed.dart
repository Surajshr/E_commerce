// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_view_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeViewState {
  List<ProductModel> get products => throw _privateConstructorUsedError;
  List<CardProductModel> get cardProducts => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isDataLoading => throw _privateConstructorUsedError;
  String get hasError => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  int get productQuantity => throw _privateConstructorUsedError;
  int get totalPrice => throw _privateConstructorUsedError;
  int get totalBoughtProductPrice => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeViewStateCopyWith<HomeViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeViewStateCopyWith<$Res> {
  factory $HomeViewStateCopyWith(
          HomeViewState value, $Res Function(HomeViewState) then) =
      _$HomeViewStateCopyWithImpl<$Res, HomeViewState>;
  @useResult
  $Res call(
      {List<ProductModel> products,
      List<CardProductModel> cardProducts,
      bool isLoading,
      bool isDataLoading,
      String hasError,
      int index,
      int productQuantity,
      int totalPrice,
      int totalBoughtProductPrice});
}

/// @nodoc
class _$HomeViewStateCopyWithImpl<$Res, $Val extends HomeViewState>
    implements $HomeViewStateCopyWith<$Res> {
  _$HomeViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? cardProducts = null,
    Object? isLoading = null,
    Object? isDataLoading = null,
    Object? hasError = null,
    Object? index = null,
    Object? productQuantity = null,
    Object? totalPrice = null,
    Object? totalBoughtProductPrice = null,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      cardProducts: null == cardProducts
          ? _value.cardProducts
          : cardProducts // ignore: cast_nullable_to_non_nullable
              as List<CardProductModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDataLoading: null == isDataLoading
          ? _value.isDataLoading
          : isDataLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      productQuantity: null == productQuantity
          ? _value.productQuantity
          : productQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      totalBoughtProductPrice: null == totalBoughtProductPrice
          ? _value.totalBoughtProductPrice
          : totalBoughtProductPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeViewStateCopyWith<$Res>
    implements $HomeViewStateCopyWith<$Res> {
  factory _$$_HomeViewStateCopyWith(
          _$_HomeViewState value, $Res Function(_$_HomeViewState) then) =
      __$$_HomeViewStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ProductModel> products,
      List<CardProductModel> cardProducts,
      bool isLoading,
      bool isDataLoading,
      String hasError,
      int index,
      int productQuantity,
      int totalPrice,
      int totalBoughtProductPrice});
}

/// @nodoc
class __$$_HomeViewStateCopyWithImpl<$Res>
    extends _$HomeViewStateCopyWithImpl<$Res, _$_HomeViewState>
    implements _$$_HomeViewStateCopyWith<$Res> {
  __$$_HomeViewStateCopyWithImpl(
      _$_HomeViewState _value, $Res Function(_$_HomeViewState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? cardProducts = null,
    Object? isLoading = null,
    Object? isDataLoading = null,
    Object? hasError = null,
    Object? index = null,
    Object? productQuantity = null,
    Object? totalPrice = null,
    Object? totalBoughtProductPrice = null,
  }) {
    return _then(_$_HomeViewState(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      cardProducts: null == cardProducts
          ? _value._cardProducts
          : cardProducts // ignore: cast_nullable_to_non_nullable
              as List<CardProductModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDataLoading: null == isDataLoading
          ? _value.isDataLoading
          : isDataLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      productQuantity: null == productQuantity
          ? _value.productQuantity
          : productQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      totalBoughtProductPrice: null == totalBoughtProductPrice
          ? _value.totalBoughtProductPrice
          : totalBoughtProductPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_HomeViewState implements _HomeViewState {
  const _$_HomeViewState(
      {final List<ProductModel> products = const [],
      final List<CardProductModel> cardProducts = const [],
      this.isLoading = true,
      this.isDataLoading = false,
      this.hasError = '',
      this.index = 0,
      this.productQuantity = 1,
      this.totalPrice = 1,
      this.totalBoughtProductPrice = 0})
      : _products = products,
        _cardProducts = cardProducts;

  final List<ProductModel> _products;
  @override
  @JsonKey()
  List<ProductModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  final List<CardProductModel> _cardProducts;
  @override
  @JsonKey()
  List<CardProductModel> get cardProducts {
    if (_cardProducts is EqualUnmodifiableListView) return _cardProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cardProducts);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isDataLoading;
  @override
  @JsonKey()
  final String hasError;
  @override
  @JsonKey()
  final int index;
  @override
  @JsonKey()
  final int productQuantity;
  @override
  @JsonKey()
  final int totalPrice;
  @override
  @JsonKey()
  final int totalBoughtProductPrice;

  @override
  String toString() {
    return 'HomeViewState(products: $products, cardProducts: $cardProducts, isLoading: $isLoading, isDataLoading: $isDataLoading, hasError: $hasError, index: $index, productQuantity: $productQuantity, totalPrice: $totalPrice, totalBoughtProductPrice: $totalBoughtProductPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeViewState &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality()
                .equals(other._cardProducts, _cardProducts) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isDataLoading, isDataLoading) ||
                other.isDataLoading == isDataLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.productQuantity, productQuantity) ||
                other.productQuantity == productQuantity) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(
                    other.totalBoughtProductPrice, totalBoughtProductPrice) ||
                other.totalBoughtProductPrice == totalBoughtProductPrice));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(_cardProducts),
      isLoading,
      isDataLoading,
      hasError,
      index,
      productQuantity,
      totalPrice,
      totalBoughtProductPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeViewStateCopyWith<_$_HomeViewState> get copyWith =>
      __$$_HomeViewStateCopyWithImpl<_$_HomeViewState>(this, _$identity);
}

abstract class _HomeViewState implements HomeViewState {
  const factory _HomeViewState(
      {final List<ProductModel> products,
      final List<CardProductModel> cardProducts,
      final bool isLoading,
      final bool isDataLoading,
      final String hasError,
      final int index,
      final int productQuantity,
      final int totalPrice,
      final int totalBoughtProductPrice}) = _$_HomeViewState;

  @override
  List<ProductModel> get products;
  @override
  List<CardProductModel> get cardProducts;
  @override
  bool get isLoading;
  @override
  bool get isDataLoading;
  @override
  String get hasError;
  @override
  int get index;
  @override
  int get productQuantity;
  @override
  int get totalPrice;
  @override
  int get totalBoughtProductPrice;
  @override
  @JsonKey(ignore: true)
  _$$_HomeViewStateCopyWith<_$_HomeViewState> get copyWith =>
      throw _privateConstructorUsedError;
}
