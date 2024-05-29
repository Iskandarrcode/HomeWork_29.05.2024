import 'package:may29/models/product_model.dart';
import 'package:may29/services/products_http_services.dart';

class ProductController {
  final productsHttpServiced = ProductsHttpServices();

  Future<List<ProductModel>> getProducts() async {
    List<ProductModel> products = await productsHttpServiced.fetchProducts();
    return products;
  }
}
