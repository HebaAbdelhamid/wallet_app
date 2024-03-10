/*class RegisterModel {
  bool? status;
  String? message;
  SavedUser? savedUser;

  RegisterModel({this.status, this.message, this.savedUser});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    savedUser = json['user'] != null ? new SavedUser.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.savedUser != null) {
      data['user'] = this.savedUser!.toJson();
    }
    return data;
  }
}

class SavedUser {
  int? id;
  String? firstname;
  String?lastname;
  String? email;
  String? duedate;
  String? image;
  String? password;
  String? cpassword;
  String? token;

  SavedUser(
      {this.id,
        this.firstname,
        this.lastname,
        this.email,
        this.duedate,
        this.image,
        this.password,
        this.cpassword,
        this.token});

  SavedUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname=json['lastname'];
    email = json['email'];
    duedate = json['duedate'];
    image = json['image'];
    password = json['password'];
    cpassword = json['cpassword'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstname'] = this.firstname;
    data['lastname']=this.lastname;
    data['email'] = this.email;
    data['duedate'] = this.duedate;
    data['image'] = this.image;
    data['password'] = this.password;
    data['cpassword'] = this.cpassword;
    data['token'] = this.token;
    return data;
  }
}*/
class RegisterModel {
  String? message;
  SavedUser? savedUser;

  RegisterModel({this.message, this.savedUser});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    savedUser = json['savedUser'] != null
        ? new SavedUser.fromJson(json['savedUser'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.savedUser != null) {
      data['savedUser'] = this.savedUser!.toJson();
    }
    return data;
  }
}

class SavedUser {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? cPassword;
  String? profilePic;
  String? dueDate;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  SavedUser(
      {this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.cPassword,
        this.profilePic,
        this.dueDate,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  SavedUser.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    cPassword=json['cPassword'];
    profilePic = json['profilePic'];
    dueDate = json['dueDate'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
data['cPassword']=this.cPassword;
    data['profilePic'] = this.profilePic;
    data['dueDate'] = this.dueDate;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}