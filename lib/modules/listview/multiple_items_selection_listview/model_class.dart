class ModelClass {
  late String name;
  late bool isSelected;

  ModelClass(this.name, this.isSelected);

  @override
  String toString() {
    return 'ModelClass{_name: $name, _isSelected: $isSelected}';
  }
}
