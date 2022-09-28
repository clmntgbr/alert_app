import 'dart:convert';

GetItem itemFromJson(String str) => GetItem.fromJson(json.decode(str));

class GetItem {
  String context;
  String contextId;
  String contextType;
  int id;
  bool isLiked;
  String? expirationDate;
  Product product;

  @override
  String toString() {
    return '{context: $context, contextId: $contextId, contextType: $contextType, id: $id, expirationDate: $expirationDate, product: ${product.toString()}';
  }

  GetItem({
    required this.context,
    required this.contextId,
    required this.contextType,
    required this.id,
    required this.isLiked,
    this.expirationDate,
    required this.product,
  });

  factory GetItem.fromJson(Map<String, dynamic> json) {
    return GetItem(
        context: json['@context'],
        contextId: json['@id'],
        contextType: json['@type'],
        id: json['id'],
        isLiked: json['isLiked'],
        expirationDate: json['expirationDate'],
        product: Product.fromJson(json['product']));
  }
}

class Product {
  String contextId;
  String contextType;
  int id;
  String name;
  String brand;
  String imagePath;
  String? imageIngredientsPath;
  String? imageNutritionPath;
  Nutrition nutrition;

  Product({
    required this.contextId,
    required this.contextType,
    required this.id,
    required this.name,
    required this.brand,
    required this.imagePath,
    this.imageIngredientsPath,
    this.imageNutritionPath,
    required this.nutrition,
  });

  factory Product.fromJson(dynamic json) {
    return Product(
        contextId: json['@id'],
        contextType: json['@type'],
        id: json['id'],
        name: json['name'],
        brand: json['brand'],
        imagePath: json['imagePath'],
        imageIngredientsPath: json['imageIngredientsPath'],
        imageNutritionPath: json['imageNutritionPath'],
        nutrition: Nutrition.fromJson(json['nutrition']));
  }

  @override
  String toString() {
    return '{@contextId: $contextId, contextType: $contextType, id: $id, name: $name, brand: $brand, imagePath: $imagePath, imageIngredientsPath: $imageIngredientsPath, imageNutritionPath: $imageNutritionPath, nutrition: ${nutrition.toString()}}';
  }
}

class Nutrition {
  String contextId;
  String contextType;
  int id;
  String? ecoscoreGrade;
  String? ecoscoreScore;
  String? ingredientsText;
  String? nutriscoreGrade;
  String? nutriscoreScore;
  String? quantity;

  Nutrition({
    required this.contextId,
    required this.contextType,
    required this.id,
    this.ecoscoreGrade,
    this.ecoscoreScore,
    this.ingredientsText,
    this.nutriscoreGrade,
    this.nutriscoreScore,
    this.quantity,
  });

  factory Nutrition.fromJson(dynamic json) {
    return Nutrition(
      contextId: json['@id'],
      contextType: json['@type'],
      id: json['id'],
      ecoscoreGrade: json['ecoscoreGrade'],
      ecoscoreScore: json['ecoscoreScore'],
      ingredientsText: json['ingredientsText'],
      nutriscoreGrade: json['nutriscoreGrade'],
      nutriscoreScore: json['nutriscoreScore'],
      quantity: json['quantity'],
    );
  }

  @override
  String toString() {
    return '{@contextId: $contextId, contextType: $contextType, id: $id, ecoscoreGrade: $ecoscoreGrade, ecoscoreScore: $ecoscoreScore, ingredientsText: $ingredientsText, nutriscoreGrade: $nutriscoreGrade, nutriscoreScore: $nutriscoreScore, quantity: $quantity}';
  }
}

GetItem getItemInit() {
  return GetItem(
    context: '',
    contextId: '',
    contextType: '',
    id: 0,
    isLiked: false,
    product: productInit(),
  );
}

Product productInit() {
  return Product(
    contextId: '',
    contextType: '',
    id: 0,
    brand: '',
    imagePath: '',
    name: '',
    nutrition: nutritionInit(),
  );
}

Nutrition nutritionInit() {
  return Nutrition(
    contextId: '',
    contextType: '',
    id: 0,
  );
}
