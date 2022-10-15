class ModelClass {
  int? id = 0;
  String name;

  ModelClass({this.id, required this.name});

  static ModelClass fromJson(json) {
    return ModelClass(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name};
  }

  @override
  String toString() {
    return 'ModelClass{id: $id, name: $name}';
  }
}
