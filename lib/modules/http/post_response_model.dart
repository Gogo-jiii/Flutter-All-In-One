class PostResponseModel {
  String? name = "";
  String? city = "";
  String? id = "";
  String? createdAt = "";

  PostResponseModel(this.name, this.city, this.id, this.createdAt);

  PostResponseModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    city = json['city'];
    id = json['id'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['city'] = this.city;
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    return data;
  }

  @override
  String toString() {
    return '{name: $name, city: $city, id: $id, createdAt: $createdAt}';
  }
}
