class ModelClass1 {
  String _city = "";

  String get city => _city;

  set city(String value) {
    _city = value;
  }

  @override
  String toString() {
    return 'ModelClass1{_city: $_city}';
  }
}
