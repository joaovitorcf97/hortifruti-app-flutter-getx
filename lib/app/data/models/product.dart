class ProductModel {
  final int id;
  final String name;
  final num price;
  final String unitOfMeasure;
  final String image;
  final String? description;

  bool get isKG => unitOfMeasure == 'KG';

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.unitOfMeasure,
    required this.image,
    this.description,
  });

  factory ProductModel.fromJsonn(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        name: json['nome'],
        price: json['preco'],
        unitOfMeasure: json['unidade'],
        image: json['imagem'],
        description: json['descricao'],
      );
}
