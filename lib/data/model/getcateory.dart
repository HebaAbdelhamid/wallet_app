class Category {
  String? message;
  List<UserCategories>? userCategories;

  Category({this.message, this.userCategories});

  Category.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['userCategories'] != null) {
      userCategories = <UserCategories>[];
      json['userCategories'].forEach((v) {
        userCategories!.add(new UserCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.userCategories != null) {
      data['userCategories'] =
          this.userCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserCategories {
  String? sId;
  String? userId;
  String? categoryName;
  String? categoryPic;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserCategories(
      {this.sId,
      this.userId,
      this.categoryName,
      this.categoryPic,
      this.createdAt,
      this.updatedAt,
      this.iV});

  UserCategories.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    categoryName = json['categoryName'];
    categoryPic = json['categoryPic'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['categoryName'] = this.categoryName;
    data['categoryPic'] = this.categoryPic;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
