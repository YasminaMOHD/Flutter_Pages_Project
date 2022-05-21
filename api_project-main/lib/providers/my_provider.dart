import 'package:api_project/data/api_helper.dart';
import 'package:api_project/data/db_helper.dart';
import 'package:api_project/models/productresponse.dart';
import 'package:flutter/widgets.dart';

class MyProvider extends ChangeNotifier {
  List<ProductResponse> allProduct;
  List<ProductResponse> favoriteProduct;
  List<ProductResponse> cartProduct;
  ProductResponse selectedProduct;
  List<String> allCategories;
  List<ProductResponse> categoryProducts;
  String selectedCategory = '';
  num quantity = 1;
  num totoal = 0;
  getAllProducts() async {
    List<dynamic> products = await ApiHelper.apiHelper.getAllProduct();
    allProduct = products.map((e) => ProductResponse.fromJson(e)).toList();
    notifyListeners();
  }

  getSingleProduct(int id) async {
    dynamic product = await ApiHelper.apiHelper.singleProduct(id);
    selectedProduct = ProductResponse.fromJson(product);
    notifyListeners();
  }

  getAllCategories() async {
    List<dynamic> categories = await ApiHelper.apiHelper.getAllCategories();
    allCategories = categories.map((e) => e.toString()).toList();
    notifyListeners();
    getCategoryProducts(allCategories.first);
  }

  getCategoryProducts(String category) async {
    categoryProducts = null;
    this.selectedCategory = category;
    notifyListeners();
    List<dynamic> products =
        await ApiHelper.apiHelper.getCategoryProducts(category);
    categoryProducts =
        products.map((e) => ProductResponse.fromJson(e)).toList();
    notifyListeners();
  }

  Future<List<ProductResponse>> getAllfavoriteProduct() async {
    favoriteProduct = await DbHelper.dbHelper.getAllFavoriteProduct();
    notifyListeners();
  }

  addFavoriteProduct(ProductResponse productResponse) async {
    await DbHelper.dbHelper.insertFavoriteProduct(productResponse);

    getAllfavoriteProduct();
  }

  Future<List<ProductResponse>> getAllcartProduct() async {
    List<ProductResponse> products =
        await DbHelper.dbHelper.getAllCartProduct();
    this.cartProduct = products;

    notifyListeners();
  }

  addcartProduct(ProductResponse productResponse) async {
    await DbHelper.dbHelper.insertCartProduct(productResponse);
    getAllcartProduct();
  }

  deleteFromCart(int id) async {
    await DbHelper.dbHelper.deleteProductFromCart(id);
    getAllcartProduct();
  }

  deleteFromFavorite(int id) async {
    await DbHelper.dbHelper.deleteProductFromFavorite(id);
    getAllfavoriteProduct();
  }

  increassQuantity(ProductResponse productResponse) async {
    this.quantity = await DbHelper.dbHelper
        .updateProductQuantityToIncrease(productResponse);
    notifyListeners();
  }

  decreaseQuantity(ProductResponse productResponse) async {
    this.quantity = await DbHelper.dbHelper
        .updateProductQuantityTodecrease(productResponse);
    notifyListeners();
  }
}
