import 'dart:convert';

class ProductModel {
  final int status;
  final String message;
  final List<Products> data;
  final Links links;

  ProductModel({
    required this.status,
    required this.message,
    required this.data,
    required this.links,
  });

  factory ProductModel.fromJson(String str) =>
      ProductModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        status: json["status"],
        message: json["message"],
        data: List<Products>.from(json["data"].map((x) => Products.fromMap(x))),
        links: Links.fromMap(json["links"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "links": links.toMap(),
      };
}

class Products {
  final String id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int icountId;
  final Unit unit;
  final String code;
  final int price;
  final int priceAfterDiscount;
  final dynamic description;
  final int weight;
  final bool isPrescriptionDrugs;
  final int categoriesCount;
  final List<Image> images;
  final List<Category> categories;
  final String ratingAverage;

  Products({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.icountId,
    required this.unit,
    required this.code,
    required this.price,
    required this.priceAfterDiscount,
    required this.description,
    required this.weight,
    required this.isPrescriptionDrugs,
    required this.categoriesCount,
    required this.images,
    required this.categories,
    required this.ratingAverage,
  });

  factory Products.fromJson(String str) => Products.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Products.fromMap(Map<String, dynamic> json) => Products(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        icountId: json["icount_id"],
        unit: unitValues.map[json["unit"]]!,
        code: json["code"],
        price: json["price"],
        priceAfterDiscount: json["price_after_discount"],
        description: json["description"],
        weight: json["weight"],
        isPrescriptionDrugs: json["is_prescription_drugs"],
        categoriesCount: json["categories_count"],
        images: List<Image>.from(json["images"].map((x) => Image.fromMap(x))),
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromMap(x))),
        ratingAverage: json["rating_average"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "icount_id": icountId,
        "unit": unitValues.reverse[unit],
        "code": code,
        "price": price,
        "price_after_discount": priceAfterDiscount,
        "description": description,
        "weight": weight,
        "is_prescription_drugs": isPrescriptionDrugs,
        "categories_count": categoriesCount,
        "images": List<dynamic>.from(images.map((x) => x.toMap())),
        "categories": List<dynamic>.from(categories.map((x) => x.toMap())),
        "rating_average": ratingAverage,
      };
}

class Category {
  final String id;
  final String name;
  final String icon;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Status status;
  final Type type;
  final int position;
  final bool isMenu;
  final Pivot pivot;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.type,
    required this.position,
    required this.isMenu,
    required this.pivot,
  });

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        status: statusValues.map[json["status"]]!,
        type: typeValues.map[json["type"]]!,
        position: json["position"],
        isMenu: json["is_menu"],
        pivot: Pivot.fromMap(json["pivot"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "icon": icon,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "status": statusValues.reverse[status],
        "type": typeValues.reverse[type],
        "position": position,
        "is_menu": isMenu,
        "pivot": pivot.toMap(),
      };
}

class Pivot {
  final String productId;
  final String categoryId;

  Pivot({
    required this.productId,
    required this.categoryId,
  });

  factory Pivot.fromJson(String str) => Pivot.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pivot.fromMap(Map<String, dynamic> json) => Pivot(
        productId: json["product_id"],
        categoryId: json["category_id"],
      );

  Map<String, dynamic> toMap() => {
        "product_id": productId,
        "category_id": categoryId,
      };
}

enum Status { ACTIVE, INACTIVE }

final statusValues =
    EnumValues({"active": Status.ACTIVE, "inactive": Status.INACTIVE});

enum Type { PRODUCT, PROMO }

final typeValues = EnumValues({"product": Type.PRODUCT, "promo": Type.PROMO});

class Image {
  final String id;
  final String productId;
  final String path;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String pathSmall;
  final String imageUrl;
  final String imageUrlSmall;

  Image({
    required this.id,
    required this.productId,
    required this.path,
    required this.createdAt,
    required this.updatedAt,
    required this.pathSmall,
    required this.imageUrl,
    required this.imageUrlSmall,
  });

  factory Image.fromJson(String str) => Image.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Image.fromMap(Map<String, dynamic> json) => Image(
        id: json["id"],
        productId: json["product_id"],
        path: json["path"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pathSmall: json["path_small"],
        imageUrl: json["image_url"],
        imageUrlSmall: json["image_url_small"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "product_id": productId,
        "path": path,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "path_small": pathSmall,
        "image_url": imageUrl,
        "image_url_small": imageUrlSmall,
      };
}

enum Unit { GRAM, PAKET, PCS, UNIT_PCS }

final unitValues = EnumValues({
  "Gram": Unit.GRAM,
  "PAKET": Unit.PAKET,
  "PCS": Unit.PCS,
  "Pcs": Unit.UNIT_PCS
});

class Links {
  final String apiUrl;
  final String apiUrlVersion;
  final String imageUrl;

  Links({
    required this.apiUrl,
    required this.apiUrlVersion,
    required this.imageUrl,
  });

  factory Links.fromJson(String str) => Links.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Links.fromMap(Map<String, dynamic> json) => Links(
        apiUrl: json["api_url"],
        apiUrlVersion: json["api_url_version"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toMap() => {
        "api_url": apiUrl,
        "api_url_version": apiUrlVersion,
        "image_url": imageUrl,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
