class UserModel {
  dynamic message;
  dynamic token;

  UserModel({this.message, this.token});

  UserModel.fromJson(Map<dynamic, dynamic> json) {
    message = json['message'];
    token = json['token'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['message'] = this.message;
    data['token'] = this.token;
    return data;
  }
}
