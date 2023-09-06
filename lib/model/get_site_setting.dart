class GetSiteSetting {
  List<Religions>? religions;
  List<Religions>? priorities;
  List<Religions>? professions;
  List<Sects>? sects;
  List<Religions>? familyValues;
  List<Religions>? familyStatuses;
  List<Religions>? educationLevel;
  List<Religions>? interests;
  GetSiteSetting(
      {this.religions,
      this.priorities,
      this.professions,
      this.sects,
      this.familyValues,
      this.interests,
      this.familyStatuses,
      this.educationLevel});

  GetSiteSetting.fromJson(Map<String, dynamic> json) {
    if (json['religions'] != null) {
      religions = <Religions>[];
      json['religions'].forEach((v) {
        religions!.add(new Religions.fromJson(v));
      });
    }
    if (json['priorities'] != null) {
      priorities = <Religions>[];
      json['priorities'].forEach((v) {
        priorities!.add(new Religions.fromJson(v));
      });
    }
    if (json['interests'] != null) {
      interests = <Religions>[];
      json['interests'].forEach((v) {
        interests!.add(new Religions.fromJson(v));
      });
    }
    if (json['professions'] != null) {
      professions = <Religions>[];
      json['professions'].forEach((v) {
        professions!.add(new Religions.fromJson(v));
      });
    }
    if (json['sects'] != null) {
      sects = <Sects>[];
      json['sects'].forEach((v) {
        sects!.add(new Sects.fromJson(v));
      });
    }
    if (json['family_values'] != null) {
      familyValues = <Religions>[];
      json['family_values'].forEach((v) {
        familyValues!.add(new Religions.fromJson(v));
      });
    }
    if (json['family_statuses'] != null) {
      familyStatuses = <Religions>[];
      json['family_statuses'].forEach((v) {
        familyStatuses!.add(new Religions.fromJson(v));
      });
    }
    if (json['education_level'] != null) {
      educationLevel = <Religions>[];
      json['education_level'].forEach((v) {
        educationLevel!.add(new Religions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.religions != null) {
      data['religions'] = this.religions!.map((v) => v.toJson()).toList();
    }
    if (this.priorities != null) {
      data['priorities'] = this.priorities!.map((v) => v.toJson()).toList();
    }
    if (this.professions != null) {
      data['professions'] = this.professions!.map((v) => v.toJson()).toList();
    }
    if (this.interests != null) {
      data['interests'] = this.interests!.map((v) => v.toJson()).toList();
    }
    if (this.sects != null) {
      data['sects'] = this.sects!.map((v) => v.toJson()).toList();
    }
    if (this.familyValues != null) {
      data['family_values'] =
          this.familyValues!.map((v) => v.toJson()).toList();
    }
    if (this.familyStatuses != null) {
      data['family_statuses'] =
          this.familyStatuses!.map((v) => v.toJson()).toList();
    }
    if (this.educationLevel != null) {
      data['education_level'] =
          this.educationLevel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Religions {
  String? id;
  String? name;

  Religions({this.id, this.name});

  Religions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Sects {
  String? castId;
  String? castName;
  String? isActive;
  String? religionName;

  Sects({this.castId, this.castName, this.isActive, this.religionName});

  Sects.fromJson(Map<String, dynamic> json) {
    castId = json['cast_id'];
    castName = json['cast_name'];
    isActive = json['is_active'];
    religionName = json['religion_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cast_id'] = this.castId;
    data['cast_name'] = this.castName;
    data['is_active'] = this.isActive;
    data['religion_name'] = this.religionName;
    return data;
  }
}
