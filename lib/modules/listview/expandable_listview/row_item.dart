class RowItem {
  String headerValue;
  String expandedValue;
  bool isExpanded;

  RowItem(
      {required this.headerValue,
      required this.expandedValue,
      this.isExpanded = false});
}
