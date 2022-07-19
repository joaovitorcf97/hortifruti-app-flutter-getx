import 'package:hortifrutti_app/app/data/models/product.dart';

class CategoryModel {
  final int id;
  final String name;
  List<ProductModel> products;

  CategoryModel({
    required this.id,
    required this.name,
    required this.products,
  });

  factory CategoryModel.fromJsonn(Map<String, dynamic> json) => CategoryModel(
        id: json['id'],
        name: json['nome'],
        products: json['produtos'] == null
            ? []
            : List<ProductModel>.from(
                json['produtos']
                    .map((product) => ProductModel.fromJsonn(product)),
              ),
      );
}
