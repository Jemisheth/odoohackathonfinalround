
class SearchBookModel {
  Books? books;

  SearchBookModel({this.books});

  SearchBookModel.fromJson(Map<String, dynamic> json) {
    if(json["books"] is Map) {
      books = json["books"] == null ? null : Books.fromJson(json["books"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(books != null) {
      _data["books"] = books?.toJson();
    }
    return _data;
  }
}

class Books {
  List<Title>? title;

  Books({this.title});

  Books.fromJson(Map<String, dynamic> json) {
    if(json["title"] is List) {
      title = json["title"] == null ? null : (json["title"] as List).map((e) => Title.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(title != null) {
      _data["title"] = title?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Title {
  Image? image;
  String? id;
  String? title;
  String? description;
  List<String>? volumes;
  String? parentCategory;
  String? category;
  List<String>? author;
  String? stock;
  String? createdAt;
  int? v;

  Title({this.image, this.id, this.title, this.description, this.volumes, this.parentCategory, this.category, this.author, this.stock, this.createdAt, this.v});

  Title.fromJson(Map<String, dynamic> json) {
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
      volumes = json["volumes"] == null ? null : List<String>.from(json["volumes"]);
    }
    if(json["ParentCategory"] is String) {
      parentCategory = json["ParentCategory"];
    }
    if(json["Category"] is String) {
      category = json["Category"];
    }
    if(json["Author"] is List) {
      author = json["Author"] == null ? null : List<String>.from(json["Author"]);
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
      _data["volumes"] = volumes;
    }
    _data["ParentCategory"] = parentCategory;
    _data["Category"] = category;
    if(author != null) {
      _data["Author"] = author;
    }
    _data["stock"] = stock;
    _data["createdAt"] = createdAt;
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