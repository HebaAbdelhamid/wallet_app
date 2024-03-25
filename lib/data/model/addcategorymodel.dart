class addcategory {
  String? message;
  Addedcategory? addedcategory;

  addcategory({this.message, this.addedcategory});

  addcategory.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    addedcategory = json['addedcategory'] != null
        ? new Addedcategory.fromJson(json['addedcategory'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.addedcategory != null) {
      data['addedcategory'] = this.addedcategory!.toJson();
    }
    return data;
  }
}

class Addedcategory {
  String? userId;
  String? categoryName;
  String? categoryPic;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Addedcategory(
      {this.userId,
        this.categoryName,
        this.categoryPic,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Addedcategory.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    categoryName = json['categoryName'];
    categoryPic = json['categoryPic'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['categoryName'] = this.categoryName;
    data['categoryPic'] = this.categoryPic;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}