
class GetAllBooksModel {
  List<Books>? books;

  GetAllBooksModel({this.books});

  GetAllBooksModel.fromJson(Map<String, dynamic> json) {
    if(json["books"] is List) {
      books = json["books"] == null ? null : (json["books"] as List).map((e) => Books.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(books != null) {
      _data["books"] = books?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Books {
  Image? image;
  String? id;
  String? title;
  String? description;
  List<Volumes>? volumes;
  ParentCategory? parentCategory;
  Category? category;
  List<Author>? author;
  String? stock;
  String? createdAt;
  int? v;

  Books({this.image, this.id, this.title, this.description, this.volumes, this.parentCategory, this.category, this.author, this.stock, this.createdAt, this.v});

  Books.fromJson(Map<String, dynamic> json) {
    if(json["Image"] is Map) {
      image = json["Image"] == null ? null : Image.fromJson(json["Image"]);
    }
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["Title"] is String) {
      title = json["Title"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["volumes"] is List) {
      volumes = json["volumes"] == null ? null : (json["volumes"] as List).map((e) => Volumes.fromJson(e)).toList();
    }
    if(json["ParentCategory"] is Map) {
      parentCategory = json["ParentCategory"] == null ? null : ParentCategory.fromJson(json["ParentCategory"]);
    }
    if(json["Category"] is Map) {
      category = json["Category"] == null ? null : Category.fromJson(json["Category"]);
    }
    if(json["Author"] is List) {
      author = json["Author"] == null ? null : (json["Author"] as List).map((e) => Author.fromJson(e)).toList();
    }
    if(json["stock"] is String) {
      stock = json["stock"];
    }
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["__v"] is int) {
      v = json["__v"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(image != null) {
      _data["Image"] = image?.toJson();
    }
    _data["_id"] = id;
    _data["Title"] = title;
    _data["description"] = description;
    if(volumes != null) {
      _data["volumes"] = volumes?.map((e) => e.toJson()).toList();
    }
    if(parentCategory != null) {
      _data["ParentCategory"] = parentCategory?.toJson();
    }
    if(category != null) {
      _data["Category"] = category?.toJson();
    }
    if(author != null) {
      _data["Author"] = author?.map((e) => e.toJson()).toList();
    }
    _data["stock"] = stock;
    _data["createdAt"] = createdAt;
    _data["__v"] = v;
    return _data;
  }
}

class Author {
  String? id;
  String? name;
  int? mobile;
  String? email;
  List<dynamic>? address;
  List<String>? books;
  String? createdAt;
  int? v;

  Author({this.id, this.name, this.mobile, this.email, this.address, this.books, this.createdAt, this.v});

  Author.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["Name"] is String) {
      name = json["Name"];
    }
    if(json["mobile"] is int) {
      mobile = json["mobile"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["Address"] is List) {
      address = json["Address"] ?? [];
    }
    if(json["Books"] is List) {
      books = json["Books"] == null ? null : List<String>.from(json["Books"]);
    }
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["__v"] is int) {
      v = json["__v"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["Name"] = name;
    _data["mobile"] = mobile;
    _data["email"] = email;
    if(address != null) {
      _data["Address"] = address;
    }
    if(books != null) {
      _data["Books"] = books;
    }
    _data["createdAt"] = createdAt;
    _data["__v"] = v;
    return _data;
  }
}

class Category {
  String? id;
  String? name;
  String? level;
  int? v;

  Category({this.id, this.name, this.level, this.v});

  Category.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["level"] is String) {
      level = json["level"];
    }
    if(json["__v"] is int) {
      v = json["__v"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["name"] = name;
    _data["level"] = level;
    _data["__v"] = v;
    return _data;
  }
}

class ParentCategory {
  String? id;
  String? name;
  String? level;
  int? v;

  ParentCategory({this.id, this.name, this.level, this.v});

  ParentCategory.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["level"] is String) {
      level = json["level"];
    }
    if(json["__v"] is int) {
      v = json["__v"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["name"] = name;
    _data["level"] = level;
    _data["__v"] = v;
    return _data;
  }
}

class Volumes {
  String? id;
  int? volno;
  String? isbn;
  int? price;
  String? publicationYear;
  String? quantity;
  String? book;
  int? v;

  Volumes({this.id, this.volno, this.isbn, this.price, this.publicationYear, this.quantity, this.book, this.v});

  Volumes.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["Volno"] is int) {
      volno = json["Volno"];
    }
    if(json["ISBN"] is String) {
      isbn = json["ISBN"];
    }
    if(json["price"] is int) {
      price = json["price"];
    }
    if(json["PublicationYear"] is String) {
      publicationYear = json["PublicationYear"];
    }
    if(json["quantity"] is String) {
      quantity = json["quantity"];
    }
    if(json["Book"] is String) {
      book = json["Book"];
    }
    if(json["__v"] is int) {
      v = json["__v"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["Volno"] = volno;
    _data["ISBN"] = isbn;
    _data["price"] = price;
    _data["PublicationYear"] = publicationYear;
    _data["quantity"] = quantity;
    _data["Book"] = book;
    _data["__v"] = v;
    return _data;
  }
}

class Image {
  String? image1;
  String? image2;

  Image({this.image1, this.image2});

  Image.fromJson(Map<String, dynamic> json) {
    if(json["image1"] is String) {
      image1 = json["image1"];
    }
    if(json["image2"] is String) {
      image2 = json["image2"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["image1"] = image1;
    _data["image2"] = image2;
    return _data;
  }
}