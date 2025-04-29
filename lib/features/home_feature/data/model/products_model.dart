class ProductModel {
  final int id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
    };
  }
}

class ProductsListModel {
  final List<ProductModel> products;

  ProductsListModel({required this.products});

  factory ProductsListModel.fromJson(List<dynamic> jsonList) {
    return ProductsListModel(
      products: jsonList.map((json) => ProductModel.fromJson(json)).toList(),
    );
  }
}
