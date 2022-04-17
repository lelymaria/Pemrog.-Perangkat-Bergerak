class Authors {
  int? id;
  String? name;
  String? email;
  String? createdAt;
  String? updatedAt;

  Authors(
      {this.id,
      this.name,
      this.email,
      this.createdAt,
      this.updatedAt});

  Authors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
