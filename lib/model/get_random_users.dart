class RendomUsers {
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  // Null? dob;
  // Null? gender;
  String? profilePic;
  String? religion;
  String? sect;
  String? profession;
  // Null? educationLevel;
  // Null? status;
  // Null? statusMessage;
  // bool? active;
  // Null? lastActive;
  CreatedAt? createdAt;
  CreatedAt? updatedAt;
  // Null? deletedAt;

  RendomUsers({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    // this.dob,
    // this.gender,
    this.profilePic,
    this.religion,
    this.sect,
    this.profession,
    // this.educationLevel,
    // this.status,
    // this.statusMessage,
    // this.active,
    // this.lastActive,
    this.createdAt,
    this.updatedAt,
    // this.deletedAt
  });

  RendomUsers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    // dob = json['dob'];
    // gender = json['gender'];
    profilePic = json['profile_pic'];
    religion = json['religion'];
    sect = json['sect'];
    profession = json['profession'];
    // educationLevel = json['education_level'];
    // status = json['status'];
    // statusMessage = json['status_message'];
    // active = json['active'];
    // lastActive = json['last_active'];
    createdAt = json['created_at'] != null
        ? new CreatedAt.fromJson(json['created_at'])
        : null;
    updatedAt = json['updated_at'] != null
        ? new CreatedAt.fromJson(json['updated_at'])
        : null;
    // deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    // data['dob'] = this.dob;
    // data['gender'] = this.gender;
    data['profile_pic'] = this.profilePic;
    data['religion'] = this.religion;
    data['sect'] = this.sect;
    data['profession'] = this.profession;
    // data['education_level'] = this.educationLevel;
    // data['status'] = this.status;
    // data['status_message'] = this.statusMessage;
    // data['active'] = this.active;
    // data['last_active'] = this.lastActive;
    if (this.createdAt != null) {
      data['created_at'] = this.createdAt!.toJson();
    }
    if (this.updatedAt != null) {
      data['updated_at'] = this.updatedAt!.toJson();
    }
    // data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class CreatedAt {
  String? date;
  int? timezoneType;
  String? timezone;

  CreatedAt({this.date, this.timezoneType, this.timezone});

  CreatedAt.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    timezoneType = json['timezone_type'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['timezone_type'] = this.timezoneType;
    data['timezone'] = this.timezone;
    return data;
  }
}
