class LoginModel {
  bool? status;
  String? message;
  Data? user;
  String? token;
  LoginModel({this.status, this.message, this.user});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? new Data.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  Data? data;
  String? token;

  User(this.data, this.token);

  User.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    data = json['user'] != null ? Data.fromJson(json['user']) : null;
  }
}

class Data {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? cPassword;
  String? profilePic;
  String? dueDate;
  String? createdAt;
  String? updatedAt;
  int? v;

  Data({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.cPassword,
    this.profilePic,
    this.dueDate,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password'],
      cPassword: json['cPassword'],
      profilePic: json['profilePic'],
      dueDate: json['dueDate'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'cPassword': cPassword,
      'profilePic': profilePic,
      'dueDate': dueDate,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }
}
