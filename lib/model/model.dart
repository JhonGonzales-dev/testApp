import 'dart:convert';

class ProductModel {
  ProductModel({
    required this.code,
    required this.data,
  });

  int code;
  List<Product> data;

  factory ProductModel.fromJson(String str) =>
      ProductModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        code: json["code"],
        data: List<Product>.from(json["data"].map((x) => Product.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Product {
  Product(
      {required this.id,
      required this.journal,
      required this.eissn,
      required this.publicationDate,
      required this.articleType,
      required this.authorDisplay,
      required this.docAbstract,
      required this.titleDisplay,
      required this.score});

  String id;
  String journal;
  String eissn;
  DateTime publicationDate;
  String articleType;
  List<String> authorDisplay;
  List<String> docAbstract;
  String titleDisplay;
  double score;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        journal: json["journal"],
        eissn: json["eissn"],
        publicationDate: DateTime.parse(json["publication_date"]),
        articleType: json["article_type"],
        authorDisplay: List<String>.from(json["author_display"].map((x) => x)),
        docAbstract: List<String>.from(json["abstract"].map((x) => x)),
        titleDisplay: json["title_display"],
        score: json["score"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "journal": journal,
        "eissn": [eissn],
        "publication_date": publicationDate.toIso8601String(),
        "article_type": [articleType],
        "author_display": List<dynamic>.from(authorDisplay.map((x) => x)),
        "abstract": List<dynamic>.from(docAbstract.map((x) => x)),
        "title_display": titleDisplay,
        "score": score,
      };
}
