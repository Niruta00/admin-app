class RegisterUserModel {
  String? Username;
  String? first_name;
  String? middle_name;
  String? last_name;
  String? email;
  bool? verified;
  String? type;
  String? createdAt;
  String? updatedAt;
  String? onlineStatus;
  String? token;

  RegisterUserModel(
      {this.Username,
      this.first_name,
      this.middle_name,
      this.last_name,
      this.email,
      this.verified,
      this.type,
      this.createdAt,
      this.onlineStatus,
      this.updatedAt,
      this.token});

  RegisterUserModel.fromJson(Map<String, dynamic> json) {
    Username = json['Username'];
    first_name = json['first_name'];
    middle_name = json['middle_name'];
    last_name = json['last_name'];
    email = json['email'];
    verified = json['verified'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    onlineStatus = json['onlineStatus'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Username'] = this.Username;
    data['firstname'] = this.first_name;
    data['middlename'] = this.middle_name;
    data['lastname'] = this.last_name;
    data['email'] = this.email;

    data['verified'] = this.verified;
    data['type'] = this.type;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['onlineStatus'] = this.onlineStatus;
    data['token'] = this.token;
    return data;
  }
}
