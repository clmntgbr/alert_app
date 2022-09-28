import 'dart:convert';

GetItems itemsFromJson(String str) => GetItems.fromJson(
      json.decode(str),
    );

class GetItems {
  String context;
  String contextId;
  String contextType;
  List<dynamic> items;
  int totalItems;

  @override
  String toString() {
    return '{context: $context, contextId: $contextId, contextType: $contextType, totalItems: $totalItems, items: $items}';
  }

  GetItems({
    required this.context,
    required this.contextId,
    required this.contextType,
    required this.items,
    required this.totalItems,
  });

  factory GetItems.fromJson(Map<String, dynamic> json) {
    return GetItems(
      context: json['@context'],
      contextId: json['@id'],
      contextType: json['@type'],
      items: json['hydra:member']
          .map(
            (tagJson) => Item.fromJson(tagJson),
          )
          .toList(),
      totalItems: json['hydra:totalItems'],
    );
  }
}

class Item {
  String contextId;
  String contextType;
  int id;
  String? expirationDate;
  bool isLiked;
  bool isDeleted;
  Product product;

  Item({
    required this.contextId,
    required this.contextType,
    required this.id,
    this.expirationDate,
    required this.isLiked,
    required this.isDeleted,
    required this.product,
  });

  factory Item.fromJson(dynamic json) {
    return Item(
      contextId: json['@id'],
      contextType: json['@type'],
      id: json['id'],
      expirationDate: json['expirationDate'],
      isLiked: json['isLiked'],
      isDeleted: false,
      product: Product.fromJson(json['product']),
    );
  }

  @override
  String toString() {
    return '{@contextId: $contextId, contextType: $contextType, id: $id, expirationDate: $expirationDate, isLiked: $isLiked, product: ${product.toString()}}';
  }
}

class Product {
  String contextId;
  String contextType;
  int id;
  String name;
  String brand;
  String imagePath;
  String? categories;

  Product({
    required this.contextId,
    required this.contextType,
    required this.id,
    required this.name,
    required this.brand,
    required this.imagePath,
    this.categories,
  });

  factory Product.fromJson(dynamic json) {
    return Product(
      contextId: json['@id'],
      contextType: json['@type'],
      id: json['id'],
      name: json['name'],
      brand: json['brand'],
      imagePath: json['imagePath'],
      categories: json['categories'],
    );
  }

  @override
  String toString() {
    return '{@contextId: $contextId, contextType: $contextType, id: $id, name: $name, brand: $brand, imagePath: $imagePath}';
  }
}
