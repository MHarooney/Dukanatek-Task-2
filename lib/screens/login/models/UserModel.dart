class UserModel {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? status;
  String? fcm_token;

  UserModel.initial() : id = "";

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    status = json['status'];
    fcm_token = json['fcm_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['status'] = this.status;
    data['fcm_token'] = this.fcm_token;
    return data;
  }
}
