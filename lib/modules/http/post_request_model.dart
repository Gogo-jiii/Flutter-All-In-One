class PostRequestModel {
  String name = "";

  PostRequestModel(this.name);

  PostRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }

  @override
  String toString() {
    return '{name: $name}';
  }
}
