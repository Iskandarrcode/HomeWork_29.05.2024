import 'package:may29/models/categories_models/categories_model.dart';
import 'package:may29/services/categories_services/categories_http_services.dart';

class CategoriesController {
  final categoriesHttpServiced = CategoriesHttpService();

  Future<List<CategoriesModel>> getCategories() async {
    List<CategoriesModel> products = await categoriesHttpServiced.fetchCategories();
    return products;
  }
}